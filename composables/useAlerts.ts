import { nanoid } from "nanoid";
interface AlertOptions {
    type?: "success" | "error" | "info" | "warning";
    title?: string;
    dismissiable?: boolean;
    timeout?: number;
}
interface Alert extends AlertOptions {
    message: string;
    id: string;
}
const TIMEOUT = 5000;
export const useAlerts = () => {
    const alerts = ref<Alert[]>("appAlerts", () => []);
    function dismiss(idOrAlert: string | Alert) {
        const id = typeof idOrAlert === "string" ? idOrAlert : idOrAlert.id;
        alerts.value = alerts.value.filter((alert) => alert.id !== id);
    }
    function addAlert(message: string, options: AlertOptions) {
        const id = nanoid();
        const Alert = {
            id,
            message,
            type: options.type || "info",
            dismissiable: options.dismissiable || true,
            timeout: options.timeout || 5000,
            title: options.title || "",
        }
        alerts.value.push(alert);
        if(alert.timeout) {
            setTimeout(() => dismiss(id), alert.timeout);
        }
    }
    function success(message: string, options: AlertOptions = {}) {
        addAlert(message, { ...options, type: "success" });
    }
    function error(message: string, options: AlertOptions = {}) {
        addAlert(message, { ...options, type: "error" });
    }
    function info(message: string, options: AlertOptions = {}) {
        addAlert(message, { ...options, type: "info" });
    }
    function warning(message: string, options: AlertOptions = {}) {
        addAlert(message, { ...options, type: "warning" });
    }
    return {
        success,
        info,
        warning,
        error,
        alerts,
        dismiss,
    };
};