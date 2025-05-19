Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9D2ABC324
	for <lists+uboot-stm32@lfdr.de>; Mon, 19 May 2025 17:52:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 064A7C7A821;
	Mon, 19 May 2025 15:52:13 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42B5BC78F8E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 May 2025 09:23:25 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43d2d952eb1so32353835e9.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 May 2025 02:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747646604; x=1748251404;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cmGDh7Quf7paBrFEK/LEdlFZm+7VMbs02wnac/NAITI=;
 b=WkjaY01PTUk2UPwM4oK7tH7pXjg0EdVq4l1P0KXsDRsZY6rm37NBNhghexUejaFng8
 R3Y2z7YfqfXaD9q0hUkSu0pErcqmoZElEQBi8eHzQjue3Q2M401zSgPVZLvIljxucvHf
 CmpCQ2av8YYzRr9E1SjZk8HJOaDlzl7386bMZZgb+TpoXPjOAvtbNVYWqux4GGsmPWpQ
 K6D8jH3gEHVLfeEWCclPpYeWCU1qPTvuKRXF8WgqgLNKEy5LD503QEhZXuFRf9ukvwlR
 QGqhXwA6XIShC4/rNzOtSaoKvqFQXzB1plY5CANFCfsZI2bvCRmknEBrKh5OIYeaIJHY
 NqnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747646604; x=1748251404;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cmGDh7Quf7paBrFEK/LEdlFZm+7VMbs02wnac/NAITI=;
 b=shSMuVBDXu4pmIubAKq3YktlxNSwy8VQJO77cT4laBnHlfq0IDmy0xzfvZB65zltps
 VxyPl+CjISVzoVw4HoLridncgU9sm5h96Em8o6sFYMjKW4Vp6pHGv85kaMyTKg1hkJJJ
 FxFWMD//2wNoEjEYUDf7KNeXsBruEgmluHNsztoE/up9FtCsysJ6GvYEBWGCug4ts1ql
 7npxNttHpbx1kQOm69sGTuhfHjMh+8ouNgevBb6qETuemccso/GvBl+bPiK8Hi1UclfE
 NmmNorvefBxel3AFyOIyMU9vBWXXfFK9WHFQzXZiE7YwP3rEJCItWA6+7BBjQPhJm5tG
 Ac3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXz/wZ/OQTBUayUjLrwR1SVLx5TIbSQsxIJXrdUONwwMB8rGD58dOj08sy/nTojrjApg0RoR0BDF3PrRA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy/i9LS/c44xKr6Ut9lNoJaWCF9QT2+LuuycVTDouNMFeZZhIKb
 uBiZhISXTENRZ4EP0MoMVgF0a0HCqp+40G3h+vvtlYrbYnVWwUAR/w5hQ3hB47OWGTs=
X-Gm-Gg: ASbGncts7Yo8UKoGAOTSn6nu4C/Fa9lMs1p/NfLoFzNMR21ZQwTDSE3+Hzhum1sPmog
 JDm2J0U0NHst5fSvyS7zPk1pFAE6d7c0kiEk8kKtqKjAX138ZjYage4JpRrZ22LTmY8dJdGF2DM
 m021txtW5qAdCoEKuiCeQcdObrWPALsJNMSbvWjQDrDhUnRpSIABezWVZe6sCjf3/6tErVSkR3L
 u4YWJhHDi8dpbkADww2/us0GXCeQAZMw1o3/cdcfnZ5u/TjDFFHDVDFn/98TI5jKappfn+Hp+3N
 WI1KWPVwQQBK7G9FrEH4DYu4x6voDcEE6cAeEbD6nNpH6XckaXZDvpbsJ56Q3W0kmnom4yMVhGd
 +lfaodiFRnzTb+1LHNWg6ZQAvc8Q67ow=
X-Google-Smtp-Source: AGHT+IFLfrdzgB3M6ko8RQD9Es7eT5NBE0s8mORUScAmdX6qrG9KPdSkrKdVjGn1EsNu5iZ3yBFmuQ==
X-Received: by 2002:a05:600c:474a:b0:442:f44f:65b with SMTP id
 5b1f17b1804b1-442fd675a33mr96374135e9.32.1747646604380; 
 Mon, 19 May 2025 02:23:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3cb:7bb0:f675:6612:8685:2dab?
 ([2a01:e0a:3cb:7bb0:f675:6612:8685:2dab])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442fd583fb7sm132268895e9.32.2025.05.19.02.23.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 02:23:24 -0700 (PDT)
Message-ID: <71947acc-d77c-4cd2-9a15-d679a0e53a8c@linaro.org>
Date: Mon, 19 May 2025 10:23:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20250519090421.470942-1-patrick.delaunay@foss.st.com>
 <20250519110417.1.Ie741b1ca358414a1d718dca0667ac44eefc9227b@changeid>
Content-Language: en-US
From: Jerome Forissier <jerome.forissier@linaro.org>
In-Reply-To: <20250519110417.1.Ie741b1ca358414a1d718dca0667ac44eefc9227b@changeid>
X-Mailman-Approved-At: Mon, 19 May 2025 15:52:12 +0000
Cc: Tom Rini <trini@konsulko.com>, caleb.connolly@linaro.org,
 Casey Connolly <casey.connolly@linaro.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 ilias.apalodimas@linaro.org,
 =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 1/3] lib/uuid.c: restore support of system
 partition type for ESP
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi Patrick,

On 5/19/25 10:04, Patrick Delaunay wrote:
> Add support of shortname for type parameter and restore "system"
> as short name for EFI System Partition (ESP) for filed "type" of the
> "gpt write" command.
> 
> Fixes: d54e1004b8b1 ("lib/uuid.c: use unique name for PARTITION_SYSTEM_GUID")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  lib/uuid.c | 148 +++++++++++++++++++++++++++--------------------------
>  1 file changed, 76 insertions(+), 72 deletions(-)
> 
> diff --git a/lib/uuid.c b/lib/uuid.c
> index 6abbcf27b1f3..ee02fa4d600d 100644
> --- a/lib/uuid.c
> +++ b/lib/uuid.c
> @@ -62,184 +62,185 @@ int uuid_str_valid(const char *uuid)
>  	return 1;
>  }
>  
> +/* List of known GUID for GPT partition type */
>  static const struct {
> -	const char *string;
> +	const char *string;     /* name for type parameter of gpt command */

const char *type?

> +	const char *description;/* description used for %pUs */
>  	efi_guid_t guid;
>  } list_guid[] = {
>  #ifndef USE_HOSTCC
> -#if defined(CONFIG_PARTITION_TYPE_GUID) || defined(CONFIG_CMD_EFIDEBUG) || \
> -	defined(CONFIG_EFI)
> -	{"EFI System Partition", PARTITION_SYSTEM_GUID},
> -#endif
> -#ifdef CONFIG_PARTITION_TYPE_GUID
> -	{"mbr",		LEGACY_MBR_PARTITION_GUID},
> -	{"msft",	PARTITION_MSFT_RESERVED_GUID},
> -	{"data",	PARTITION_BASIC_DATA_GUID},
> -	{"linux",	PARTITION_LINUX_FILE_SYSTEM_DATA_GUID},
> -	{"raid",	PARTITION_LINUX_RAID_GUID},
> -	{"swap",	PARTITION_LINUX_SWAP_GUID},
> -	{"lvm",		PARTITION_LINUX_LVM_GUID},
> -	{"u-boot-env",	PARTITION_U_BOOT_ENVIRONMENT},
> -	{"cros-kern",	PARTITION_CROS_KERNEL},
> -	{"cros-root",	PARTITION_CROS_ROOT},
> -	{"cros-fw",	PARTITION_CROS_FIRMWARE},
> -	{"cros-rsrv",	PARTITION_CROS_RESERVED},
> -#endif
> +#if CONFIG_IS_ENABLED(EFI_PARTITION)
> +	{"mbr",		NULL,	LEGACY_MBR_PARTITION_GUID},
> +	{"msft",	NULL,	PARTITION_MSFT_RESERVED_GUID},
> +	{"data",	NULL,	PARTITION_BASIC_DATA_GUID},
> +	{"linux",	NULL,	PARTITION_LINUX_FILE_SYSTEM_DATA_GUID},
> +	{"raid",	NULL,	PARTITION_LINUX_RAID_GUID},
> +	{"swap",	NULL,	PARTITION_LINUX_SWAP_GUID},
> +	{"lvm",		NULL,	PARTITION_LINUX_LVM_GUID},
> +	{"u-boot-env",	NULL,	PARTITION_U_BOOT_ENVIRONMENT},
> +	{"cros-kern",	NULL,	PARTITION_CROS_KERNEL},
> +	{"cros-root",	NULL,	PARTITION_CROS_ROOT},
> +	{"cros-fw",	NULL,	PARTITION_CROS_FIRMWARE},
> +	{"cros-rsrv",	NULL,	PARTITION_CROS_RESERVED},
>  #if defined(CONFIG_CMD_EFIDEBUG) || defined(CONFIG_EFI)
>  	{
> -		"Device Path",
> +		"system", "EFI System Partition",
> +		PARTITION_SYSTEM_GUID,
> +	},

The patch adds quite many NULLs to the list_guid[] only for this very
special case. We would be better off hardcoding the "system" case into
uuid_guid_get_bin() I think.

> +	{
> +		NULL, "Device Path",
>  		EFI_DEVICE_PATH_PROTOCOL_GUID,
>  	},
>  	{
> -		"Device Path To Text",
> +		NULL, "Device Path To Text",
>  		EFI_DEVICE_PATH_TO_TEXT_PROTOCOL_GUID,
>  	},
>  	{
> -		"Device Path Utilities",
> +		NULL, "Device Path Utilities",
>  		EFI_DEVICE_PATH_UTILITIES_PROTOCOL_GUID,
>  	},
>  	{
> -		"Unicode Collation 2",
> +		NULL, "Unicode Collation 2",
>  		EFI_UNICODE_COLLATION_PROTOCOL2_GUID,
>  	},
>  	{
> -		"Driver Binding",
> +		NULL, "Driver Binding",
>  		EFI_DRIVER_BINDING_PROTOCOL_GUID,
>  	},
>  	{
> -		"Simple Text Input",
> +		NULL, "Simple Text Input",
>  		EFI_SIMPLE_TEXT_INPUT_PROTOCOL_GUID,
>  	},
>  	{
> -		"Simple Text Input Ex",
> +		NULL, "Simple Text Input Ex",
>  		EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL_GUID,
>  	},
>  	{
> -		"Simple Text Output",
> +		NULL, "Simple Text Output",
>  		EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL_GUID,
>  	},
>  	{
> -		"Block IO",
> +		NULL, "Block IO",
>  		EFI_BLOCK_IO_PROTOCOL_GUID,
>  	},
>  	{
> -		"Disk IO",
> +		NULL, "Disk IO",
>  		EFI_DISK_IO_PROTOCOL_GUID,
>  	},
>  	{
> -		"Simple File System",
> +		NULL, "Simple File System",
>  		EFI_SIMPLE_FILE_SYSTEM_PROTOCOL_GUID,
>  	},
>  	{
> -		"Loaded Image",
> +		NULL, "Loaded Image",
>  		EFI_LOADED_IMAGE_PROTOCOL_GUID,
>  	},
>  	{
> -		"Loaded Image Device Path",
> +		NULL, "Loaded Image Device Path",
>  		EFI_LOADED_IMAGE_DEVICE_PATH_PROTOCOL_GUID,
>  	},
>  	{
> -		"Graphics Output",
> +		NULL, "Graphics Output",
>  		EFI_GRAPHICS_OUTPUT_PROTOCOL_GUID,
>  	},
>  	{
> -		"HII String",
> +		NULL, "HII String",
>  		EFI_HII_STRING_PROTOCOL_GUID,
>  	},
>  	{
> -		"HII Database",
> +		NULL, "HII Database",
>  		EFI_HII_DATABASE_PROTOCOL_GUID,
>  	},
>  	{
> -		"HII Config Access",
> +		NULL, "HII Config Access",
>  		EFI_HII_CONFIG_ACCESS_PROTOCOL_GUID,
>  	},
>  	{
> -		"HII Config Routing",
> +		NULL, "HII Config Routing",
>  		EFI_HII_CONFIG_ROUTING_PROTOCOL_GUID,
>  	},
>  	{
> -		"Load File",
> +		NULL, "Load File",
>  		EFI_LOAD_FILE_PROTOCOL_GUID,
>  	},
>  	{
> -		"Load File2",
> +		NULL, "Load File2",
>  		EFI_LOAD_FILE2_PROTOCOL_GUID,
>  	},
>  	{
> -		"Random Number Generator",
> +		NULL, "Random Number Generator",
>  		EFI_RNG_PROTOCOL_GUID,
>  	},
>  	{
> -		"Simple Network",
> +		NULL, "Simple Network",
>  		EFI_SIMPLE_NETWORK_PROTOCOL_GUID,
>  	},
>  	{
> -		"PXE Base Code",
> +		NULL, "PXE Base Code",
>  		EFI_PXE_BASE_CODE_PROTOCOL_GUID,
>  	},
>  	{
> -		"Device-Tree Fixup",
> +		NULL, "Device-Tree Fixup",
>  		EFI_DT_FIXUP_PROTOCOL_GUID,
>  	},
>  	{
> -		"TCG2",
> +		NULL, "TCG2",
>  		EFI_TCG2_PROTOCOL_GUID,
>  	},
>  	{
> -		"Firmware Management",
> +		NULL, "Firmware Management",
>  		EFI_FIRMWARE_MANAGEMENT_PROTOCOL_GUID
>  	},
>  #if IS_ENABLED(CONFIG_EFI_HTTP_PROTOCOL)
>  	{
> -		"HTTP",
> +		NULL, "HTTP",
>  		EFI_HTTP_PROTOCOL_GUID,
>  	},
>  	{
> -		"HTTP Service Binding",
> +		NULL, "HTTP Service Binding",
>  		EFI_HTTP_SERVICE_BINDING_PROTOCOL_GUID,
>  	},
>  	{
> -		"IPv4 Config2",
> +		NULL, "IPv4 Config2",
>  		EFI_IP4_CONFIG2_PROTOCOL_GUID,
>  	},
>  #endif
>  	/* Configuration table GUIDs */
>  	{
> -		"ACPI table",
> +		NULL, "ACPI table",
>  		EFI_ACPI_TABLE_GUID,
>  	},
>  	{
> -		"EFI System Resource Table",
> +		NULL, "EFI System Resource Table",
>  		EFI_SYSTEM_RESOURCE_TABLE_GUID,
>  	},
>  	{
> -		"device tree",
> +		NULL, "device tree",
>  		EFI_FDT_GUID,
>  	},
>  	{
> -		"SMBIOS table",
> +		NULL, "SMBIOS table",
>  		SMBIOS_TABLE_GUID,
>  	},
>  	{
> -		"SMBIOS3 table",
> +		NULL, "SMBIOS3 table",
>  		SMBIOS3_TABLE_GUID,
>  	},
>  	{
> -		"Runtime properties",
> +		NULL, "Runtime properties",
>  		EFI_RT_PROPERTIES_TABLE_GUID,
>  	},
>  	{
> -		"TCG2 Final Events Table",
> +		NULL, "TCG2 Final Events Table",
>  		EFI_TCG2_FINAL_EVENTS_TABLE_GUID,
>  	},
>  	{
> -		"EFI Conformance Profiles Table",
> +		NULL, "EFI Conformance Profiles Table",
>  		EFI_CONFORMANCE_PROFILES_TABLE_GUID,
>  	},
>  #ifdef CONFIG_EFI_RISCV_BOOT_PROTOCOL
>  	{
> -		"RISC-V Boot",
> +		NULL, "RISC-V Boot",
>  		RISCV_EFI_BOOT_PROTOCOL_GUID,
>  	},
>  #endif
> @@ -247,35 +248,36 @@ static const struct {
>  #ifdef CONFIG_CMD_NVEDIT_EFI
>  	/* signature database */
>  	{
> -		"EFI_GLOBAL_VARIABLE_GUID",
> +		NULL, "EFI_GLOBAL_VARIABLE_GUID",
>  		EFI_GLOBAL_VARIABLE_GUID,
>  	},
>  	{
> -		"EFI_IMAGE_SECURITY_DATABASE_GUID",
> +		NULL, "EFI_IMAGE_SECURITY_DATABASE_GUID",
>  		EFI_IMAGE_SECURITY_DATABASE_GUID,
>  	},
>  	/* certificate types */
>  	{
> -		"EFI_CERT_SHA256_GUID",
> +		NULL, "EFI_CERT_SHA256_GUID",
>  		EFI_CERT_SHA256_GUID,
>  	},
>  	{
> -		"EFI_CERT_X509_GUID",
> +		NULL, "EFI_CERT_X509_GUID",
>  		EFI_CERT_X509_GUID,
>  	},
>  	{
> -		"EFI_CERT_TYPE_PKCS7_GUID",
> +		NULL, "EFI_CERT_TYPE_PKCS7_GUID",
>  		EFI_CERT_TYPE_PKCS7_GUID,
>  	},
>  #endif
>  #if defined(CONFIG_CMD_EFIDEBUG) || defined(CONFIG_EFI)
> -	{ "EFI_LZMA_COMPRESSED", EFI_LZMA_COMPRESSED },
> -	{ "EFI_DXE_SERVICES", EFI_DXE_SERVICES },
> -	{ "EFI_HOB_LIST", EFI_HOB_LIST },
> -	{ "EFI_MEMORY_TYPE", EFI_MEMORY_TYPE },
> -	{ "EFI_MEM_STATUS_CODE_REC", EFI_MEM_STATUS_CODE_REC },
> -	{ "EFI_GUID_EFI_ACPI1", EFI_GUID_EFI_ACPI1 },
> +	{ NULL, "EFI_LZMA_COMPRESSED", EFI_LZMA_COMPRESSED },
> +	{ NULL, "EFI_DXE_SERVICES", EFI_DXE_SERVICES },
> +	{ NULL, "EFI_HOB_LIST", EFI_HOB_LIST },
> +	{ NULL, "EFI_MEMORY_TYPE", EFI_MEMORY_TYPE },
> +	{ NULL, "EFI_MEM_STATUS_CODE_REC", EFI_MEM_STATUS_CODE_REC },
> +	{ NULL, "EFI_GUID_EFI_ACPI1", EFI_GUID_EFI_ACPI1 },
>  #endif
> +#endif /* EFI_PARTITION */
>  #endif /* !USE_HOSTCC */
>  };
>  
> @@ -284,7 +286,8 @@ int uuid_guid_get_bin(const char *guid_str, unsigned char *guid_bin)
>  	int i;
>  
>  	for (i = 0; i < ARRAY_SIZE(list_guid); i++) {
> -		if (!strcmp(list_guid[i].string, guid_str)) {
> +		if (list_guid[i].string &&
> +		    !strcmp(list_guid[i].string, guid_str)) {
>  			memcpy(guid_bin, &list_guid[i].guid, 16);
>  			return 0;
>  		}
> @@ -298,6 +301,8 @@ const char *uuid_guid_get_str(const unsigned char *guid_bin)

Should this be called uuid_guid_get_type() instead? 'str' or 'string' are confusing.
We should have 'type' and 'decription' IMO.

>  
>  	for (i = 0; i < ARRAY_SIZE(list_guid); i++) {
>  		if (!memcmp(list_guid[i].guid.b, guid_bin, 16)) {
> +			if (list_guid[i].description)
> +				return list_guid[i].description;
>  			return list_guid[i].string;

.description is never (or should never be) NULL. No need to return .string as a fallback.

>  		}
>  	}
> @@ -312,10 +317,9 @@ int uuid_str_to_bin(const char *uuid_str, unsigned char *uuid_bin,
>  	uint64_t tmp64;
>  
>  	if (!uuid_str_valid(uuid_str)) {
> -#ifdef CONFIG_PARTITION_TYPE_GUID
> -		if (!uuid_guid_get_bin(uuid_str, uuid_bin))
> +		if (IS_ENABLED(CONFIG_PARTITION_TYPE_GUID) &&
> +		    !uuid_guid_get_bin(uuid_str, uuid_bin))
>  			return 0;
> -#endif
>  		return -EINVAL;
>  	}
>  

Thanks,
-- 
Jerome
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
