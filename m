Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJ5aChbfgWmDLQMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 12:42:14 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9976D8894
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 12:42:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A1B1C87EC6;
	Tue,  3 Feb 2026 11:42:13 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013046.outbound.protection.outlook.com [40.107.159.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 943A3C32EB0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Feb 2026 11:42:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MxL9gqtuPtGAHdHVaUKhuk7AeGaZf117r/lmq3e1cdnZEHcw+c9KuobNfHGZNGmzVs9sWfbLQIOdw3z9Bq/2vBnPdqJpi9rhA+a1u2IVRtZ0o+HH9cOp6HVWU3jYk1ArNpWkgnIH1Vtit4v8jmFvyjj9Dk3PAVFq2QE2CpiIANBf6hK9JiODUmu/m9IORfI03NeO5C555PyJbkm5wsabaQBm4fPSqTLkjfY/mrd6lAzML8QJtk9WL/GwbVUJVBXuF2orUneJLTZ2yGcAlc5E4Ld/cKLsD5s/kB6SFITW2JB9U0VqrNmYIw3iigazLMG2Yogy0On6zCvhc05LyfMZvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IFHF3wIXgVYkPzJLzTMj0VWXodJbQvuzSiFcUWdIaoM=;
 b=rPIwT5c7wDiyHbwu4fbQqdRjdEmld1i0/Dap5PrzmDz2y4EjP0/km9Gbz+RCCeQodYPFeQElz/Q2GLaJ0AETX7wbi2ucJYbLQ9r52oqRZ6Dpz3K5xOP2rSFUExqR9u53j+Ak7Ju8wkYL7uR/pkEOTQMJQPeeleRTniYLKqGwH9S2fQIqd7x42t3p6CCCOgXvTgUfQ9Jtu2UdTYw9ZenIl5zn7ib3iOnY/oIATX8vRDMP7zgZRF9pwrF8FFF1pl8BXdyj2bZ2ljW/w00BlV1IRgn165+n6E+hp+4LbK5hYTHUcfFG8qvIT0B07QLw/0spAkhgw//ejSXixVU7HXJX1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IFHF3wIXgVYkPzJLzTMj0VWXodJbQvuzSiFcUWdIaoM=;
 b=FnMAvxziuH9P+IpRtnXmKMD+JCkxqrFTrP+JJQCS3RrRHUfF1re7CJUF1kkwesZUowG9rzMQIiWkk50kMWk9aqTS3QSp/0qu1mcjlRBRs7k4aBjmsQNayTCTETzhHEUI7hgdHnhPXIZI0UHz3WIM6S86BkaOWiwHNPGyA/BnXOaKGSkq8CbdQs+yidqsN6MgkGjpZKE5NVehEAm8ilyTQH6UP3Inccwiwz9qjA0pj+UvyJM3vgzJzHa/NcPNZDTvrFqkXt+QIPf6Gll60Xxd6lepi27oTrBHTCWE9zauTAjYGYCnlMa4O18VpOnqqLTq1MJR29XrKWqalHR1NyOm1Q==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8055.eurprd04.prod.outlook.com (2603:10a6:20b:2a4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 11:42:05 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%5]) with mapi id 15.20.9564.006; Tue, 3 Feb 2026
 11:42:05 +0000
From: Peng Fan <peng.fan@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>, GSS_MTK_Uboot_upstream
 <GSS_MTK_Uboot_upstream@mediatek.com>, dl-uboot-imx <uboot-imx@nxp.com>,
 Aspeed BMC SW team <BMC-SW@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Christoph Stoidner <c.stoidner@phytec.de>, "kernel@puri.sm" <kernel@puri.sm>, 
 Sam Day <me@samcday.com>, Sumit Garg <sumit.garg@kernel.org>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, "uboot-snps-arc@synopsys.com"
 <uboot-snps-arc@synopsys.com>, "u-boot-amlogic@groups.io"
 <u-boot-amlogic@groups.io>, "u-boot@dh-electronics.com"
 <u-boot@dh-electronics.com>, "upstream@lists.phytec.de"
 <upstream@lists.phytec.de>, "u-boot-qcom@groups.io" <u-boot-qcom@groups.io>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>, "adsp-linux@analog.com"
 <adsp-linux@analog.com>
Thread-Topic: [PATCH 00/14] treewide: Clean up usage of DECLARE_GLOBAL_DATA_PTR
Thread-Index: AQHclPmVOZhfiI7Tykq5GNWvlOXbRrVw2kJA
Date: Tue, 3 Feb 2026 11:42:04 +0000
Message-ID: <PAXPR04MB84594DBC04C4957716EA9C79889BA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20260203-cleanup-v1-0-4221c13e7558@nxp.com>
In-Reply-To: <20260203-cleanup-v1-0-4221c13e7558@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AS8PR04MB8055:EE_
x-ms-office365-filtering-correlation-id: c6733bb0-bd79-491f-ae81-08de63194112
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|19092799006|1800799024|38070700021|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?K2tNN1RpNGhCVnVxUXJFb0dqOVFoelpBL1dvbmgyK0FoYVhGU25pVGZUSCtX?=
 =?utf-8?B?ZGZiWVdKNTlsay9QeVVjQzE2L0xrSVBvVGdPZG5QWUtwZUlrVlpBT243UnYv?=
 =?utf-8?B?VmZUTEIrdy9QcFVmUE9Ha1RrUHNKSDNudzc0b0JuclVUWURETmY0WmdPNTdB?=
 =?utf-8?B?ZndQMlpJZTJOSzVKQm1ocmQrVWtOV0E3eE1CS1Z3YjY0WWJHekQ0czRZbFlh?=
 =?utf-8?B?MDcwVVBsS2tvNU5qbW1CbnhCTWoxTnNYRHJzenYwU3dRL3drVnRLdlVMd2Mw?=
 =?utf-8?B?dmo4U205TWhPcHNmNTloRkNGdGhiTExncWVwWVhlYjlmczJEeitqajNBcDdD?=
 =?utf-8?B?VTROY05haEMwWC8xMEtEa2RoS2FaZTVHREFnUDRMUDhtcEdOSnRPSEtXUWdT?=
 =?utf-8?B?Z0ZrSVRoeHo3cEx2Sk1GcTFWYkh6RkVnNmw3Q3RDejRpZnkyUkV6cENtWDdh?=
 =?utf-8?B?VEptdkFRd3ZNTEI5cUJKVUpYVW1BbVpnOHFzR0t6NXRIaUxleEVqRTlkemlF?=
 =?utf-8?B?NzdYQnpQZVhGWlk4dmpZNUh6aWtwKytqODl1NG5nQlJwSWx6QmcwOXh2Zm5v?=
 =?utf-8?B?YThPWVhvZU9IQUlJK3FJdjE0UnB0SnFWN1lPam9QdW1uZlJFamtadXB3aWho?=
 =?utf-8?B?MkgrajZlaHhpU21DREpsOVkyUjl4RUF3VXp4ZUlOVkE0TThQMEVQQkMzd2kw?=
 =?utf-8?B?RlhYbDFmVXd1dFlBNkxEWGdjVmZUTVRTSk12dzZ3TzZueXFFUy94ZzBqMHk0?=
 =?utf-8?B?SUtZRlE1d3NhaThyU2pUbWh0ZWVsZ2k1OUkyQnd6WWZXSmlmeENUV2x2Qm9q?=
 =?utf-8?B?Rm8veFJTUnVMRlNkMWdJY0xNc0daRVlRK0RUWFdWcGJLYjUvVGlzSENEQmhX?=
 =?utf-8?B?TTh3d1FBVmFreHBIS3pCU1F4SVl4eFZHM056bExSdGo1ZjcwZ2JROTNWbUpW?=
 =?utf-8?B?Nlp6ZStqb2hSQU90OFo1dG9mb28xbDF6NTRRMXFGWXR1enZwdCtUSHRpOGhi?=
 =?utf-8?B?TTcreXFCb2pOQ2lTZE8vejVLek52SE5zRHllLzlKejE5WXNoTGxQeEtVS09M?=
 =?utf-8?B?RnlZVk8ycXhLbXJnZ1BTZVU4RUZVNEtUSS9POU1iTFU5Q0xmZmVvQnRDTmZt?=
 =?utf-8?B?RUpjVHZEb1NZRHJMT3dNK2pCYUtabEdXanJiTXlkTEJjWFEyYks4OVhRSnMv?=
 =?utf-8?B?TGdZZFNJd1YreTRhMGNhL3JXSW5yQTMyMTNYcyt1RGVrc1JMTkRvYjNrQ1Jl?=
 =?utf-8?B?Nzd2dkpmTTZSZHY5M1lHRUdKdmx5eUsrOGlpRU1ySWYrRE9LZjlsWUdXT09D?=
 =?utf-8?B?dHE5QTh0bXdHdVVzNmZSOTI5bndCOUp3ZDNaL0JpaTJ2eC9BK3M5SHFKRGVs?=
 =?utf-8?B?dUU5T09rU29rTVZ6M1VVTU8zYTZWcFN1QTh0b0RUMUFkUkcydnhIejQxWE05?=
 =?utf-8?B?QWZnclh5NWpWK1JURkZhcVpPaGhCTjRteitnd1MxUTJRdGVSamRGcGFTREhQ?=
 =?utf-8?B?andsR2paM01pVEphUjVZRGZYNFdwVGo3SUNZVTY5bjBkZXNWdmoyNWVRblZu?=
 =?utf-8?B?cXN1dEwxRFBDTlovSER4TzNoR0NDMG1INHlLS1ZKRVRlUjdKcktqV2NCWG1j?=
 =?utf-8?B?Q2ZYQXpKS2dTQWNVaGtEUlgyWERHMTVoT1kzUGF0Z2p5TEVDZTJvNUFCdHox?=
 =?utf-8?B?UlhEbEhlWktCVFV3dmV0Qm9SRFpDWlBzN082WFdzQmlBSkRadTdxeHZlN2VD?=
 =?utf-8?B?U01LYmxXUHlTc3dVVnJ6UkM2ejlZbkE1UmM4MUM2TURZNTB1aExJb0xUaUxv?=
 =?utf-8?B?cjVwTWVibW9OTit0cXltNWx3WHBLZk9oaHBhN3ZjV2ZvT0dPRmMrTHNjelZq?=
 =?utf-8?B?NlRCWTg0RU1KMTVyNUs0bUNoMlo2RXVaWEdKYXVLMDNaaUlvNXE1WTVjNytn?=
 =?utf-8?B?S0dPaE9zcVpaZjN3Rzc5di9PVHFzc2JUdnpMRmp0cGZOMjd1MmJaQ2JZT2Ix?=
 =?utf-8?B?ZVFqTXR5YldkL1E1SkVoSWlydXhBcUhaNDBLb2RjZ1NTQnpSVjFSM3dNY2R2?=
 =?utf-8?B?K2VyVnJpYjJaeGoxWG9UVTI0WEZWL0o0WElHZTVNNURIOVU3SUFZL2xDUjBs?=
 =?utf-8?B?ZVo3Sm9SamxicEFBdk5CdG5zYkZWRm5wTnREQ3BYUVQ2SXB6SHJ5Yi9ITzZU?=
 =?utf-8?B?K3c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(19092799006)(1800799024)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U1o1Y1RSUjBoMElHcDl4VkY1Z1NrU2R4SXVSRFZPMlg4dzlVcW96TE9MbjE1?=
 =?utf-8?B?V0xUVXhsOEV3aEpFUWp0ODBucWtIRG5rWmhQeWcveVphbWpRWUN3T2Z5RCsz?=
 =?utf-8?B?U0c4WU1MQnJFZ21QRmlRNlI0RTFYYkIzU3liSStCWDdsdjhiQjg5cnhnZHRk?=
 =?utf-8?B?Y1pLMjhCOWZFS1Ewa2RRVFBMV2lRTHl2bjY0Mk5vMVE2U0h2N0ExeUZSK1pP?=
 =?utf-8?B?NjlhcmIvSjdnVjBGREk5cUdONFUrZzdGb0NHQ2NZTWlEc29NSTAxU3pteURh?=
 =?utf-8?B?Z2NWaHJqTDcybW5wS1J6QkJGUWVjUkRYREorWWh3cG9ITWJQdjk2clRVeDRJ?=
 =?utf-8?B?LzVYSmR1WkIzUTlybGZVam4wVklaZHMzSlNtbVZ1SlJ1UXJPejNiRWJobUJh?=
 =?utf-8?B?enVEa1h0NVhMUUUrOURPbVdDRFpwY3pzRG9OMGhYYTllYkJZckp4dVZuNnhz?=
 =?utf-8?B?aXdoN0VlMVc2aU1DWVlzNTZEODdBOHNGaC9GQndpOXVrQTdRWDVIL1VxZWRB?=
 =?utf-8?B?dUlTYlBWcE5rb0ZtWW9IZ3loT0dIV1ZicUVYMGZRaVNyMjlFaWlTZUhTZkFZ?=
 =?utf-8?B?MGFVc0g1NkNhc080NG5zSFFlNkxmZ2hYaXlpOWNwVXcxUnVqeVlqVmd5ZVFz?=
 =?utf-8?B?Ym9sS0xaTTVqczVuQmtOdWxiWC9NeUFTNU9wbXdSa3d5NXpCSURoTzRBeU15?=
 =?utf-8?B?MU1QTXhtbHVLRG1JZURkenNXMUFyZmZhQmJxUnJPY2tzeElDaE13MlJMaVJL?=
 =?utf-8?B?cEx2QjBTbjRCZzMxZk5iVyt1WUU3QUc3NDYreGFlYlVyRlFFZWdVYUtzNTRT?=
 =?utf-8?B?Myt0bEtCTnY3N01XQjQ3OUtEOUxGcFU5bUpHMWpxLzRFcERUTXpDbUF4NnNF?=
 =?utf-8?B?RE5IMjNsai9pdE5JNC9FeHRQVlJ0dkk5NGR3REs0QVAxWktxYXh5VXpkN0FJ?=
 =?utf-8?B?LzJ6em0ySzQ5ckRIQWdGdHAzc2J5T044aDI0cUdSeUxXYkFPNDRtL05zaUsx?=
 =?utf-8?B?N3A4d3ZYNmQ0T3F2bE1jaHJGb2QwdDlpTUE4QXVwdk8xZXJ5YUdUcy9HSUNC?=
 =?utf-8?B?ZDFNMWxqQ3RSRkpOQ2Y0SVFZZUdQaHpRWkczcGUvRjAxYzBiOVhUUGliNHFY?=
 =?utf-8?B?eFV4b1FwZG5EVUNxZzkzZElFdUZmQjlqUjg4ZlIvbGk0c3FHbW42VlErTnNy?=
 =?utf-8?B?Ukk4YlZLTCtBYTJINzdMWWlYM056WVVRYzlhTzNjc0NwdjhzQ0JCS012M3U4?=
 =?utf-8?B?QTFWbXpTYis5a3BTcDgrb0JQekpBUDhBODF4eVBlVDB1RkNWcy9rcEVaU1Nj?=
 =?utf-8?B?RERRbng3dVlna01Xa0xucnQxYnFMeDczZ0JmV2Mrb2JjeUhFMHJvL2RzTTQ5?=
 =?utf-8?B?UXdjaDVYdU1IcFZubkt1TldzWERrTWU4QVNwOEEySkVxQy9md0Z5WmsvK0tQ?=
 =?utf-8?B?VzBadUN5UDNWWVFxbVhNUlpDL1pUSzJEcERPWW90dUlJc0R1OE1ieEFkeHU1?=
 =?utf-8?B?SlBWbDdFVFlSdHNWZXlnSjE5STlObkV2blFyYWRSYkw5YzBLYVhGTEI4c2FU?=
 =?utf-8?B?eFVKYWhGYWJidU5RRStsdVVzYi9pb1pVTnA3b3V2UEVQWDVRMFZDMjVja3A4?=
 =?utf-8?B?TWRKV0tHYU1scGRIdFgwMmtBMitWNFV5eUxIOU1DTXRxRzRDWTluanlKOU0z?=
 =?utf-8?B?S2xCcWFDL05PUGFWR2VYWmp4ZEMvR2lhbXl4K2VzNDNwVFhKRE13aUtRS3JP?=
 =?utf-8?B?bG9JcWJ3Wk5PbXNTT2FWM0RRL2pMMS9wSHVKd3ZHRlF0RTVBd0F4V0JObHhx?=
 =?utf-8?B?UEQ1M1lwZGMxcHpHeHJ3YWhnVnVzbkpadXNyVkpIUyszMnVFa1U5VnRtSU1P?=
 =?utf-8?B?OWJSbHFBcTI3K282SWpubkw4V1h2T3hkakVjdkJMdFhOUnZYT05qV3ZKS1hu?=
 =?utf-8?B?QlpSNS93M01kSkdMOXpmd25id291YlhCRktiZEV3eFVQeHJwSkdsUER5WFo4?=
 =?utf-8?B?WGRadVgzbGd0RFVSQ2R3NFpqWFBPMGUxcmo0RE5PK3JJdkt5elV2dEpTUHR0?=
 =?utf-8?B?aFRlNVBYQ2pxRmlVNUN2MnpuT3JlSHp0Y1VqMWlpUmoyS0t3WC8xVFRLWXNN?=
 =?utf-8?B?cDlrTVNvUGIxQXljY3NmTG56QUI3Q2F1MVBmaEZWTk1kWUF1WGk0UDhYQ1Ar?=
 =?utf-8?B?cGwvbkF2dzB6Vm5tN3JHaENxcG8zYWN5Q1RST1c4QnRVcVl5aEdjWVhLZnFw?=
 =?utf-8?B?QkpoSml6N3RZZDdwYUVqTTNYYTNHd0o3VTI3QkEyL2JveTJoTWRSV3NabkVD?=
 =?utf-8?Q?n672+g/DYWmEsb+fB3?=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6733bb0-bd79-491f-ae81-08de63194112
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2026 11:42:04.9700 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6Zg6Dqum1S8Qd+jF23Zkr0nEJhsr6MMqA0hbqNW3+cf9L8fTEGHKXL7/UZLzhDPp04i4SJ8Uv5E/iXfT8nxDkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8055
Cc: Debbie Horsfall <debbie.horsfall@arm.com>, Heiko Stuebner <heiko@sntech.de>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>, Angus Ainslie <angus@akkea.ca>,
 Antonio Borneo <antonio.borneo@foss.st.com>,
 Ian Ray <ian.ray@gehealthcare.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 =?utf-8?B?QWx2aW4gxaBpcHJhZ2E=?= <alvin@pqrs.dk>,
 Finley Xiao <finley.xiao@rock-chips.com>, Zixun LI <admin@hifiphile.com>,
 Vitor Soares <vitor.soares@toradex.com>,
 Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Jaehoon Chung <jh80.chung@samsung.com>, Swamil Jain <s-jain1@ti.com>,
 Peter Hoyes <Peter.Hoyes@arm.com>, Eoin Dickson <eoin.dickson@microchip.com>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>, Lukasz Majewski <lukma@denx.de>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Hal Feng <hal.feng@starfivetech.com>, Marco Franchi <marcofrk@gmail.com>,
 Neha Malcom Francis <n-francis@ti.com>, Ramon Fried <rfried.dev@gmail.com>,
 Viorel Suman <viorel.suman@nxp.com>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Thierry Reding <treding@nvidia.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Ye Li <ye.li@nxp.com>,
 E Shattow <e@freeshell.de>, Sam Protsenko <semen.protsenko@linaro.org>,
 Masahisa Kojima <kojima.masahisa@socionext.com>,
 Teresa Remmet <T.remmet@phytec.de>, Benjamin Hahn <B.Hahn@phytec.de>,
 Francesco Valla <francesco@valla.it>, "Lukas
 F. Hartmann" <lukas@mntre.com>, Heiko Schocher <hs@nabladev.com>,
 Paul Geurts <paul.geurts@prodrive-technologies.com>,
 Tingting Meng <tingting.meng@altera.com>,
 =?utf-8?B?VGltbyB0cCBQcmVpw59s?= <t.preissl@proton.me>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Gilles Talis <gilles.talis@gmail.com>, Kamil Lulko <kamil.lulko@gmail.com>,
 Christoph Fritz <chf.fritz@googlemail.com>,
 Leonard Anderweit <l.anderweit@phytec.de>, Stefano Babic <sbabic@nabladev.com>,
 David Feng <fenghua@phytium.com.cn>, Bryan Brattlof <bb@ti.com>,
 Alice Guo <alice.guo@nxp.com>, Stefan Roese <stefan.roese@mailbox.org>,
 Alexey Brodkin <alexey.brodkin@synopsys.com>,
 Kever Yang <kever.yang@rock-chips.com>, "Lucien.Jheng" <lucienzx159@gmail.com>,
 Stefan Bosch <stefan_b@posteo.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Gabriel Dalimonte <gabriel.dalimonte@gmail.com>,
 "Ying-Chun Liu \(PaulLiu\)" <paul.liu@linaro.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Mateusz Kulikowski <mateusz.kulikowski@gmail.com>,
 Anastasiia Lukianenko <vicooodin@gmail.com>,
 Mark Kettenis <kettenis@openbsd.org>, Jerome Forissier <jerome@forissier.org>,
 Sky Huang <SkyLake.Huang@mediatek.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Primoz Fiser <primoz.fiser@norik.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Alex Nemirovsky <alex.nemirovsky@cortina-access.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Joseph Chen <chenjh@rock-chips.com>, Elaine Zhang <zhangqing@rock-chips.com>,
 Tien Fong Chee <tien.fong.chee@altera.com>,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>, Sam Shih <sam.shih@mediatek.com>,
 Rasmus Villemoes <ravi@prevas.dk>, Mathieu Othacehe <m.othacehe@gmail.com>,
 Minda Chen <minda.chen@starfivetech.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Anton Moryakov <ant.v.moryakov@gmail.com>, Mahesh Rao <mahesh.rao@altera.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>, Michal Simek <michal.simek@amd.com>,
 Andrew Goodbody <andrew.goodbody@linaro.org>,
 Alifer Moraes <alifer.wsdm@gmail.com>,
 Utsav Agarwal <utsav.agarwal@analog.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Brian Sune <briansune@gmail.com>,
 Leo <ycliang@andestech.com>, Greg Malysa <malysagreg@gmail.com>,
 David Zang <davidzangcs@gmail.com>, Ian Roberts <ian.roberts@timesys.com>,
 Simon Glass <sjg@chromium.org>, Osama Abdelkader <osama.abdelkader@gmail.com>,
 Alexander Graf <agraf@csgraf.de>, Mario Six <mario.six@gdsys.cc>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Varadarajan Narayanan <quic_varada@quicinc.com>,
 =?utf-8?B?Si4gTmV1c2Now6RmZXI=?= <j.ne@posteo.net>,
 Yannic Moog <y.moog@phytec.de>,
 Alif Zakuan Yuslaimi <alif.zakuan.yuslaimi@altera.com>,
 Liviu Dudau <liviu.dudau@foss.arm.com>, Dhruva Gole <d-gole@ti.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
 Jonathan Humphreys <j-humphreys@ti.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Naresh Kumar Ravulapalli <nareshkumar.ravulapalli@altera.com>,
 Fabio Estevam <festevam@gmail.com>, Tom Rini <trini@konsulko.com>,
 Dillon Min <dillon.minfei@gmail.com>,
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
 Thomas Chou <thomas@wytron.com.tw>,
 Manoj Sai <abbaraju.manojsai@amarulasolutions.com>,
 Bernhard Messerklinger <bernhard.messerklinger@at.abb.com>,
 Stephan Gerhold <stephan@gerhold.net>, Jonas Karlman <jonas@kwiboo.se>,
 Wolfgang Wallner <wolfgang.wallner@at.abb.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Muhammad Hazim Izzat Zamri <muhammad.hazim.izzat.zamri@altera.com>,
 Adam Ford <aford173@gmail.com>,
 Sai Varun Venkatapuram <saivarun.venkatapuram@amd.com>,
 Wadim Egorov <w.egorov@phytec.de>, Joe Hershberger <joe.hershberger@ni.com>,
 Linus Walleij <linusw@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Harrison Mutai <harrison.mutai@arm.com>,
 Aaron Williams <awilliams@marvell.com>, Boon Khai Ng <boon.khai.ng@altera.com>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jeremy Compostella <jeremy.compostella@intel.com>,
 Casey Connolly <casey.connolly@linaro.org>, Yao Zi <me@ziyao.cc>,
 Rick Chen <rick@andestech.com>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 Aswin Murugan <aswin.murugan@oss.qualcomm.com>, "Guillaume La
 Roque \(TI.com\)" <glaroque@baylibre.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Brian Ruley <brian.ruley@gehealthcare.com>, Marek Vasut <marex@denx.de>,
 Hai Pham <hai.pham.ud@renesas.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Randolph <randolph@andestech.com>,
 Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Vishal Mahaveer <vishalm@ti.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Ilko Iliev <iliev@ronetix.at>,
 Arturs Artamonovs <arturs.artamonovs@analog.com>,
 "matteo.lisi" <matteo.lisi@engicam.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Oliver Graute <Oliver.Graute@KoCoConnector.com>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 Maxim Moskalets <maximmosk4@gmail.com>,
 Alexander Feilke <alexander.feilke@ew.tq-group.com>,
 Markus Niebel <Markus.Niebel@ew.tq-group.com>, Apurva Nandan <a-nandan@ti.com>,
 Vasileios Bimpikas <vasileios.bimpikas@analog.com>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
 Lars Povlsen <lars.povlsen@microchip.com>, Patrick Wildt <patrick@blueri.se>,
 Adriano Cordova <adrianox@gmail.com>,
 Martyn Welch <martyn.welch@collabora.com>, Keerthy <j-keerthy@ti.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Dinesh Maniyam <dinesh.maniyam@altera.com>,
 Ferass El Hafidi <funderscore@postmarketos.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 Robert Nelson <robertcnelson@gmail.com>,
 Anatolij Gustschin <ag.dev.uboot@gmail.com>, Anshul Dalal <anshuld@ti.com>
Subject: Re: [Uboot-stm32] [PATCH 00/14] treewide: Clean up usage of
	DECLARE_GLOBAL_DATA_PTR
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[nxp.com:s=selector1];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[peng.fan@nxp.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:peng.fan@oss.nxp.com,m:u-boot@lists.denx.de,m:GSS_MTK_Uboot_upstream@mediatek.com,m:uboot-imx@nxp.com,m:BMC-SW@aspeedtech.com,m:joel@jms.id.au,m:c.stoidner@phytec.de,m:kernel@puri.sm,m:me@samcday.com,m:sumit.garg@kernel.org,m:tudor.ambarus@linaro.org,m:uboot-snps-arc@synopsys.com,m:u-boot-amlogic@groups.io,m:u-boot@dh-electronics.com,m:upstream@lists.phytec.de,m:u-boot-qcom@groups.io,m:uboot-stm32@st-md-mailman.stormreply.com,m:adsp-linux@analog.com,m:debbie.horsfall@arm.com,m:heiko@sntech.de,m:mkorpershoek@kernel.org,m:angus@akkea.ca,m:antonio.borneo@foss.st.com,m:ian.ray@gehealthcare.com,m:mchitale@ventanamicro.com,m:alvin@pqrs.dk,m:finley.xiao@rock-chips.com,m:admin@hifiphile.com,m:vitor.soares@toradex.com,m:jorge.ramirez.ortiz@gmail.com,m:horatiu.vultur@microchip.com,m:jh80.chung@samsung.com,m:s-jain1@ti.com,m:Peter.Hoyes@arm.com,m:eoin.dickson@microchip.com,m:chiawei_wang@aspeedtech.com,m:lukma@denx.de,m:christophe.leroy@csgroup.eu,m:hal.feng@starfivet
 ech.com,m:marcofrk@gmail.com,m:n-francis@ti.com,m:rfried.dev@gmail.com,m:viorel.suman@nxp.com,m:s-vadapalli@ti.com,m:treding@nvidia.com,m:Eugeniy.Paltsev@synopsys.com,m:marek.vasut+renesas@mailbox.org,m:ye.li@nxp.com,m:e@freeshell.de,m:semen.protsenko@linaro.org,m:kojima.masahisa@socionext.com,m:T.remmet@phytec.de,m:B.Hahn@phytec.de,m:francesco@valla.it,m:lukas@mntre.com,m:hs@nabladev.com,m:paul.geurts@prodrive-technologies.com,m:tingting.meng@altera.com,m:t.preissl@proton.me,m:ilias.apalodimas@linaro.org,m:gilles.talis@gmail.com,m:kamil.lulko@gmail.com,m:chf.fritz@googlemail.com,m:l.anderweit@phytec.de,m:sbabic@nabladev.com,m:fenghua@phytium.com.cn,m:bb@ti.com,m:alice.guo@nxp.com,m:stefan.roese@mailbox.org,m:alexey.brodkin@synopsys.com,m:kever.yang@rock-chips.com,m:lucienzx159@gmail.com,m:stefan_b@posteo.net,m:jcmvbkbc@gmail.com,m:gabriel.dalimonte@gmail.com,m:paul.liu@linaro.org,m:dario.binacchi@amarulasolutions.com,m:mateusz.kulikowski@gmail.com,m:vicooodin@gmail.com,m:kettenis@o
 penbsd.org,m:jerome@forissier.org,m:SkyLake.Huang@mediatek.com,m:gregory.clement@bootlin.com,m:frieder.schrempf@kontron.de,m:primoz.fiser@norik.com,m:jagan@amarulasolutions.com,m:alex.nemirovsky@cortina-access.com,m:michael@amarulasolutions.com,m:chenjh@rock-chips.com,m:zhangqing@rock-chips.com,m:tien.fong.chee@altera.com,m:iwamatsu@nigauri.org,m:sam.shih@mediatek.com,m:ravi@prevas.dk,m:m.othacehe@gmail.com,m:minda.chen@starfivetech.com,m:philipp.tomsich@vrull.eu,m:ant.v.moryakov@gmail.com,m:mahesh.rao@altera.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[199];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@nxp.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[arm.com,sntech.de,kernel.org,akkea.ca,foss.st.com,gehealthcare.com,ventanamicro.com,pqrs.dk,rock-chips.com,hifiphile.com,toradex.com,gmail.com,microchip.com,samsung.com,ti.com,aspeedtech.com,denx.de,csgroup.eu,starfivetech.com,nxp.com,nvidia.com,synopsys.com,mailbox.org,freeshell.de,linaro.org,socionext.com,phytec.de,valla.it,mntre.com,nabladev.com,prodrive-technologies.com,altera.com,proton.me,googlemail.com,phytium.com.cn,posteo.net,amarulasolutions.com,openbsd.org,forissier.org,mediatek.com,bootlin.com,kontron.de,norik.com,cortina-access.com,nigauri.org,prevas.dk,vrull.eu,amd.com,analog.com,andestech.com,timesys.com,chromium.org,csgraf.de,gdsys.cc,gmx.de,quicinc.com,foss.arm.com,ew.tq-group.com,cherry.de,collabora.com,konsulko.com,wytron.com.tw,at.abb.com,gerhold.net,kwiboo.se,ni.com,marvell.com,intel.com,ziyao.cc,siemens.com,oss.qualcomm.com,baylibre.com,renesas.com,epam.com,mentallysanemainliners.org,ronetix.at,engicam.com,KoCoConnector.com,blueri.se,postmarke
 tos.org];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,denx.de:url,nxp.com:email,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,lpc.events:url]
X-Rspamd-Queue-Id: B9976D8894
X-Rspamd-Action: no action

> Subject: [PATCH 00/14] treewide: Clean up usage of
> DECLARE_GLOBAL_DATA_PTR

B4 fails to send the last 2 patches. And I am not sure how to send
patch 13 and 14 in the same thread. So just resend, but seems
resend still fails for patch 13 and 14. (:

Regards
Peng.

> 
> This patch set primarily removes unused DECLARE_GLOBAL_DATA_PTR
> instances.
> 
> Many files declare DECLARE_GLOBAL_DATA_PTR and include
> asm/global_data.h even though gd is never used. In these cases,
> asm/global_data.h is effectively treated as a proxy header, which is not
> a good practice.
> 
> Following the Include What You Use principle, files should include only
> the headers they actually depend on, rather than relying on
> global_data.h indirectly. This approach is also adopted in Linux kernel
> [1].
> 
> The first few patches are prepartion to avoid building break after
> remove the including of global_data.h.
> 
> A script is for filtering the files:
> list=`find . -name "*.[ch]"`
> for source in ${list}
> do
>         result=`sed -n '/DECLARE_GLOBAL_DATA_PTR/p' ${source}`
>         if [ "${result}" == "DECLARE_GLOBAL_DATA_PTR;" ]; then
>                 echo "Found in ${source}"
> 
>                 result=`sed -n '/\<gd\>/p' ${source}`
>                 result2=`sed -n '/\<gd_/p' ${source}`
>                 result3=`sed -n '/\<gd->/p' ${source}`
>                 if [ "${result}" == "" ] && [ "${result2}" == "" ] && [ "${result3}"
> == "" ];then
>                         echo "Cleanup ${source}"
>                         sed -i
> '/DECLARE_GLOBAL_DATA_PTR/{N;/\n[[:space:]]*$/d;s/.*\n//;}'
> ${source}
>                         sed -i '/DECLARE_GLOBAL_DATA_PTR/d' ${source}
>                         sed -i '/global_data.h/d' ${source}
>                         git add ${source}
>                 fi
>         fi
> done
> 
> [1]
> https://lpc.events/event/17/contributions/1620/attachments/1228/25
> 20/Linux%20Kernel%20Header%20Optimization.pdf
> 
> CI: https://source.denx.de/u-boot/custodians/u-boot-mmc/-
> /pipelines/29177
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Peng Fan (14):
>       beacon: imx8mm/n: Drop useless files
>       mediatek: mt7622: Drop useless board files
>       common: cli_hush: Include vsprintf.h
>       cmd: mem: Include vsprintf.h
>       test: log_filter: Include vsprintf.h
>       xtensa: relocate: Add missing headers
>       toradex: common: Add missing headers
>       tegra: pmc: Cleanup headers
>       rockchip: evk_rk3308: Cleanup headers
>       nxp: emc2305: Cleanup headers
>       pci: layerspace: Add missing header files
>       renesas: common: Include asm-generic/u-boot.h
>       socfpga: clock_manager_s10: Add missing header files
>       treewide: Clean up DECLARE_GLOBAL_DATA_PTR usage
> 
>  arch/arc/lib/bootm.c                                        |  3 ---
>  arch/arm/cpu/armv7/s5p4418/cpu.c                            |  3 ---
>  arch/arm/mach-aspeed/ast2600/spl.c                          |  3 ---
>  arch/arm/mach-imx/imx8/clock.c                              |  3 ---
>  arch/arm/mach-imx/imx8/fdt.c                                |  3 ---
>  arch/arm/mach-imx/imx8/iomux.c                              |  3 ---
>  arch/arm/mach-imx/imx8m/clock_imx8mm.c                      |  3 ---
>  arch/arm/mach-imx/imx8ulp/cgc.c                             |  3 ---
>  arch/arm/mach-imx/imx8ulp/clock.c                           |  3 ---
>  arch/arm/mach-imx/imx9/clock.c                              |  3 ---
>  arch/arm/mach-imx/imx9/clock_root.c                         |  3 ---
>  arch/arm/mach-imx/misc.c                                    |  3 ---
>  arch/arm/mach-imx/spl_imx_romapi.c                          |  3 ---
>  arch/arm/mach-meson/board-axg.c                             |  3 ---
>  arch/arm/mach-meson/board-g12a.c                            |  3 ---
>  arch/arm/mach-meson/board-gx.c                              |  3 ---
>  arch/arm/mach-socfpga/clock_manager_agilex.c                |  3 ---
>  arch/arm/mach-socfpga/clock_manager_agilex5.c               |  3 ---
>  arch/arm/mach-socfpga/clock_manager_n5x.c                   |  3 ---
>  arch/arm/mach-socfpga/clock_manager_s10.c                   |  5 ++---
>  arch/arm/mach-socfpga/mailbox_s10.c                         |  3 ---
>  arch/arm/mach-socfpga/misc_gen5.c                           |  3 ---
>  arch/arm/mach-socfpga/misc_soc64.c                          |  3 ---
>  arch/arm/mach-socfpga/mmu-arm64_s10.c                       |  3 ---
>  arch/arm/mach-socfpga/reset_manager_s10.c                   |  3 ---
>  arch/arm/mach-socfpga/spl_agilex.c                          |  3 ---
>  arch/arm/mach-socfpga/spl_agilex5.c                         |  3 ---
>  arch/arm/mach-socfpga/spl_agilex7m.c                        |  3 ---
>  arch/arm/mach-socfpga/spl_gen5.c                            |  3 ---
>  arch/arm/mach-socfpga/spl_n5x.c                             |  3 ---
>  arch/arm/mach-socfpga/spl_s10.c                             |  3 ---
>  arch/arm/mach-socfpga/system_manager_soc64.c                |  3 ---
>  arch/arm/mach-tegra/pmc.c                                   |  4 +---
>  arch/microblaze/lib/bootm.c                                 |  3 ---
>  arch/mips/mach-ath79/qca956x/ddr.c                          |  3 ---
>  arch/mips/mach-mscc/cpu.c                                   |  3 ---
>  arch/mips/mach-mtmips/ddr_cal.c                             |  3 ---
>  arch/mips/mach-octeon/cvmx-pko.c                            |  2 --
>  arch/nios2/lib/bootm.c                                      |  3 ---
>  arch/riscv/cpu/andes/spl.c                                  |  3 ---
>  arch/riscv/cpu/cv1800b/dram.c                               |  3 ---
>  arch/riscv/cpu/generic/dram.c                               |  3 ---
>  arch/riscv/cpu/k230/dram.c                                  |  3 ---
>  arch/riscv/cpu/th1520/spl.c                                 |  2 --
>  arch/sh/lib/bootm.c                                         |  3 ---
>  arch/x86/cpu/ivybridge/model_206ax.c                        |  3 ---
>  arch/x86/lib/init_helpers.c                                 |  3 ---
>  arch/x86/lib/zimage.c                                       |  3 ---
>  arch/xtensa/lib/relocate.c                                  |  2 ++
>  arch/xtensa/lib/time.c                                      |  3 ---
>  board/BuR/brsmarc1/board.c                                  |  3 ---
>  board/BuR/common/common.c                                   |  3 ---
>  board/Marvell/octeontx/smc.c                                |  3 ---
>  board/Marvell/octeontx2/smc.c                               |  3 ---
>  board/advantech/imx8mp_rsb3720a1/imx8mp_rsb3720a1.c         |  2
> --
>  board/advantech/imx8mp_rsb3720a1/spl.c                      |  2 --
>  board/advantech/imx8qm_dmsse20_a1/imx8qm_dmsse20_a1.c       |
> 2 --
>  board/advantech/imx8qm_rom7720_a1/imx8qm_rom7720_a1.c       |
> 3 ---
>  board/andestech/voyager/voyager.c                           |  3 ---
>  board/armltd/vexpress64/vexpress64.c                        |  3 ---
>  board/beacon/imx8mm/Makefile                                |  1 -
>  board/beacon/imx8mm/imx8mm_beacon.c                         |  8 --------
>  board/beacon/imx8mm/spl.c                                   |  3 ---
>  board/beacon/imx8mn/Makefile                                |  1 -
>  board/beacon/imx8mn/imx8mn_beacon.c                         |  8 --------
>  board/beacon/imx8mn/spl.c                                   |  3 ---
>  board/beacon/imx8mp/spl.c                                   |  3 ---
>  board/beagle/beagleboneai64/beagleboneai64.c                |  2 --
>  board/beagle/beagleplay/beagleplay.c                        |  2 --
>  board/broadcom/bcmns/ns.c                                   |  3 ---
>  board/cloos/imx8mm_phg/imx8mm_phg.c                         |  3 ---
>  board/cloos/imx8mm_phg/spl.c                                |  3 ---
>  board/compulab/imx8mm-cl-iot-gate/spl.c                     |  2 --
>  board/coreboot/coreboot/coreboot.c                          |  3 ---
>  board/cssi/cmpc885/cmpc885.c                                |  2 --
> 
> board/data_modul/imx8mm_edm_sbc/imx8mm_data_modul_edm_sb
> c.c |  2 --
>  board/data_modul/imx8mm_edm_sbc/spl.c                       |  2 --
> 
> board/data_modul/imx8mp_edm_sbc/imx8mp_data_modul_edm_sbc.
> c |  2 --
>  board/data_modul/imx8mp_edm_sbc/spl.c                       |  2 --
>  board/dhelectronics/dh_imx8mp/common.c                      |  2 --
>  board/dhelectronics/dh_imx8mp/imx8mp_dhcom_pdk2.c           |  2 --
>  board/dhelectronics/dh_imx8mp/spl.c                         |  2 --
>  board/emcraft/imx8mp_navqp/spl.c                            |  3 ---
>  board/emulation/qemu-riscv/qemu-riscv.c                     |  2 --
>  board/engicam/imx8mm/icore_mx8mm.c                          |  2 --
>  board/engicam/imx8mm/spl.c                                  |  2 --
>  board/engicam/imx8mp/icore_mx8mp.c                          |  3 ---
>  board/engicam/imx8mp/spl.c                                  |  3 ---
>  board/gdsys/mpc8308/gazerbeam.c                             |  3 ---
>  board/google/imx8mq_phanbell/imx8mq_phanbell.c              |  3 ---
>  board/highbank/highbank.c                                   |  3 ---
>  board/kontron/osm-s-mx8mp/osm-s-mx8mp.c                     |  3 ---
>  board/kontron/osm-s-mx93/osm-s-mx93.c                       |  3 ---
>  board/kontron/pitx_imx8m/pitx_imx8m.c                       |  2 --
>  board/mediatek/mt7622/Makefile                              |  2 +-
>  board/mediatek/mt7622/mt7622_rfb.c                          | 12 ------------
>  board/mntre/imx8mq_reform2/imx8mq_reform2.c                 |  3 ---
>  board/msc/sm2s_imx8mp/sm2s_imx8mp.c                         |  2 --
>  board/msc/sm2s_imx8mp/spl.c                                 |  3 ---
>  board/nxp/common/emc2305.c                                  |  4 +---
>  board/nxp/imx8mm_evk/imx8mm_evk.c                           |  3 ---
>  board/nxp/imx8mm_evk/spl.c                                  |  3 ---
>  board/nxp/imx8mn_evk/spl.c                                  |  3 ---
>  board/nxp/imx8mp_evk/spl.c                                  |  3 ---
>  board/nxp/imx8qm_mek/imx8qm_mek.c                           |  3 ---
>  board/nxp/imx8qxp_mek/imx8qxp_mek.c                         |  3 ---
>  board/nxp/imx8ulp_evk/imx8ulp_evk.c                         |  2 --
>  board/nxp/imx8ulp_evk/spl.c                                 |  2 --
>  board/nxp/imx93_frdm/imx93_frdm.c                           |  3 ---
>  board/phytec/imx8mp-libra-fpsc/spl.c                        |  3 ---
>  board/phytec/phycore_imx8mm/phycore-imx8mm.c                |  3 ---
>  board/phytec/phycore_imx8mm/spl.c                           |  3 ---
>  board/phytec/phycore_imx8mp/phycore-imx8mp.c                |  3 ---
>  board/phytec/phycore_imx8mp/spl.c                           |  3 ---
>  board/phytec/phycore_imx93/phycore-imx93.c                  |  3 ---
>  board/polyhex/imx8mp_debix_model_a/imx8mp_debix_model_a.c   |
> 3 ---
>  board/polyhex/imx8mp_debix_model_a/spl.c                    |  3 ---
>  board/purism/librem5/librem5.c                              |  2 --
>  board/purism/librem5/spl.c                                  |  2 --
>  board/qualcomm/dragonboard410c/dragonboard410c.c            |  3 ---
>  board/qualcomm/dragonboard820c/dragonboard820c.c            |  3 ---
>  board/renesas/common/gen3-common.c                          |  4 +---
>  board/renesas/common/gen4-common.c                          |  4 +---
>  board/renesas/common/gen5-common.c                          |  4 +---
>  board/rockchip/evb_rk3308/evb_rk3308.c                      |  5 ++---
>  board/ronetix/imx8mq-cm/imx8mq_cm.c                         |  2 --
>  board/samsung/common/exynos5-dt.c                           |  3 ---
>  board/samsung/common/misc.c                                 |  3 ---
>  board/st/stm32f429-discovery/stm32f429-discovery.c          |  3 ---
>  board/st/stm32f429-evaluation/stm32f429-evaluation.c        |  3 ---
>  board/st/stm32f469-discovery/stm32f469-discovery.c          |  3 ---
>  board/st/stm32f746-disco/stm32f746-disco.c                  |  3 ---
>  board/st/stm32h743-disco/stm32h743-disco.c                  |  3 ---
>  board/st/stm32h743-eval/stm32h743-eval.c                    |  3 ---
>  board/st/stm32h747-disco/stm32h747-disco.c                  |  3 ---
>  board/st/stm32h750-art-pi/stm32h750-art-pi.c                |  3 ---
>  board/technexion/pico-imx8mq/pico-imx8mq.c                  |  3 ---
>  board/ti/am62x/evm.c                                        |  2 --
>  board/ti/am64x/evm.c                                        |  2 --
>  board/ti/j784s4/evm.c                                       |  2 --
>  board/toradex/apalis-imx8/apalis-imx8.c                     |  3 ---
>  board/toradex/apalis_t30/apalis_t30.c                       |  3 ---
>  board/toradex/colibri-imx8x/colibri-imx8x.c                 |  3 ---
>  board/toradex/colibri_t20/colibri_t20.c                     |  3 ---
>  board/toradex/common/tdx-cfg-block.c                        |  3 ---
>  board/toradex/common/tdx-cfg-block.h                        |  2 ++
>  board/toradex/common/tdx-common.h                           |  2 ++
>  board/toradex/smarc-imx8mp/smarc-imx8mp.c                   |  3 ---
>  board/toradex/smarc-imx8mp/spl.c                            |  3 ---
>  board/toradex/verdin-imx8mm/spl.c                           |  3 ---
>  board/toradex/verdin-imx8mm/verdin-imx8mm.c                 |  3 ---
>  board/toradex/verdin-imx8mp/spl.c                           |  3 ---
>  board/toradex/verdin-imx8mp/verdin-imx8mp.c                 |  3 ---
>  board/xilinx/zynq/bootimg.c                                 |  3 ---
>  boot/bootmeth-uclass.c                                      |  2 --
>  boot/fdt_simplefb.c                                         |  3 ---
>  boot/image-sig.c                                            |  2 --
>  boot/image.c                                                |  3 ---
>  cmd/bloblist.c                                              |  3 ---
>  cmd/bootefi.c                                               |  3 ---
>  cmd/bootm.c                                                 |  3 ---
>  cmd/date.c                                                  |  3 ---
>  cmd/mem.c                                                   |  4 +---
>  cmd/sound.c                                                 |  3 ---
>  cmd/spl.c                                                   |  3 ---
>  common/cli_hush.c                                           |  4 +---
>  common/stdio.c                                              |  3 ---
>  drivers/block/sandbox.c                                     |  3 ---
>  drivers/bootcount/pmic_pfuze100.c                           |  2 --
>  drivers/cache/sandbox_cache.c                               |  3 ---
>  drivers/clk/altera/clk-agilex.c                             |  3 ---
>  drivers/clk/altera/clk-agilex5.c                            |  3 ---
>  drivers/clk/altera/clk-mem-n5x.c                            |  3 ---
>  drivers/clk/altera/clk-n5x.c                                |  3 ---
>  drivers/clk/rockchip/clk_px30.c                             |  3 ---
>  drivers/clk/rockchip/clk_rk3308.c                           |  3 ---
>  drivers/clk/rockchip/clk_rk3528.c                           |  2 --
>  drivers/clk/rockchip/clk_rk3568.c                           |  2 --
>  drivers/clk/rockchip/clk_rk3576.c                           |  2 --
>  drivers/clk/rockchip/clk_rk3588.c                           |  2 --
>  drivers/clk/rockchip/clk_rv1108.c                           |  3 ---
>  drivers/clk/rockchip/clk_rv1126.c                           |  2 --
>  drivers/cpu/bcm283x_cpu.c                                   |  3 ---
>  drivers/cpu/cpu-uclass.c                                    |  2 --
>  drivers/cpu/imx8_cpu.c                                      |  3 ---
>  drivers/cpu/mtk_cpu.c                                       |  3 ---
>  drivers/firmware/arm-ffa/arm-ffa-uclass.c                   |  3 ---
>  drivers/firmware/arm-ffa/arm-ffa.c                          |  3 ---
>  drivers/firmware/arm-ffa/ffa-emul-uclass.c                  |  3 ---
>  drivers/firmware/arm-ffa/sandbox_ffa.c                      |  3 ---
>  drivers/gpio/gpio-uclass.c                                  |  3 ---
>  drivers/gpio/nx_gpio.c                                      |  3 ---
>  drivers/i2c/mxc_i2c.c                                       |  3 ---
>  drivers/i2c/nx_i2c.c                                        |  3 ---
>  drivers/i2c/ocores_i2c.c                                    |  3 ---
>  drivers/i2c/soft_i2c.c                                      |  3 ---
>  drivers/i2c/synquacer_i2c.c                                 |  2 --
>  drivers/mailbox/imx-mailbox.c                               |  2 --
>  drivers/misc/atsha204a-i2c.c                                |  3 ---
>  drivers/misc/fs_loader.c                                    |  3 ---
>  drivers/misc/imx8/fuse.c                                    |  3 ---
>  drivers/mmc/ca_dw_mmc.c                                     |  3 ---
>  drivers/mmc/f_sdh30.c                                       |  2 --
>  drivers/mmc/jz_mmc.c                                        |  3 ---
>  drivers/mmc/msm_sdhci.c                                     |  3 ---
>  drivers/mmc/mv_sdhci.c                                      |  3 ---
>  drivers/mtd/nand/raw/pxa3xx_nand.c                          |  3 ---
>  drivers/mtd/nand/raw/tegra_nand.c                           |  3 ---
>  drivers/mtd/nvmxip/nvmxip_qspi.c                            |  3 ---
>  drivers/mtd/spi/sf-uclass.c                                 |  3 ---
>  drivers/net/dwmac_s700.c                                    |  3 ---
>  drivers/net/fec_mxc.c                                       |  3 ---
>  drivers/net/gmac_rockchip.c                                 |  2 --
>  drivers/net/mvneta.c                                        |  3 ---
>  drivers/net/octeontx/smi.c                                  |  3 ---
>  drivers/net/phy/fixed.c                                     |  3 ---
>  drivers/net/phy/phy.c                                       |  3 ---
>  drivers/net/phy/xilinx_gmii2rgmii.c                         |  3 ---
>  drivers/net/sandbox-raw.c                                   |  3 ---
>  drivers/net/sandbox.c                                       |  3 ---
>  drivers/net/ti/keystone_net.c                               |  3 ---
>  drivers/net/xilinx_axi_emac.c                               |  3 ---
>  drivers/pci/pci_octeontx.c                                  |  3 ---
>  drivers/pci/pcie_dw_meson.c                                 |  3 ---
>  drivers/pci/pcie_dw_qcom.c                                  |  3 ---
>  drivers/pci/pcie_dw_rockchip.c                              |  3 ---
>  drivers/pci/pcie_dw_ti.c                                    |  3 ---
>  drivers/pci/pcie_layerscape.c                               |  3 ---
>  drivers/pci/pcie_layerscape.h                               |  4 +++-
>  drivers/pci/pcie_starfive_jh7110.c                          |  3 ---
>  drivers/pci_endpoint/pci_ep-uclass.c                        |  3 ---
>  drivers/phy/marvell/comphy_core.c                           |  3 ---
>  drivers/phy/omap-usb2-phy.c                                 |  3 ---
>  drivers/phy/rockchip/phy-rockchip-pcie.c                    |  3 ---
>  drivers/phy/rockchip/phy-rockchip-typec.c                   |  3 ---
>  drivers/pinctrl/mtmips/pinctrl-mt7628.c                     |  3 ---
>  drivers/pinctrl/nexell/pinctrl-nexell.c                     |  3 ---
>  drivers/pinctrl/nexell/pinctrl-s5pxx18.c                    |  3 ---
>  drivers/pinctrl/nxp/pinctrl-imx-mmio.c                      |  3 ---
>  drivers/pinctrl/nxp/pinctrl-imx.c                           |  3 ---
>  drivers/pinctrl/nxp/pinctrl-imx8.c                          |  3 ---
>  drivers/pinctrl/nxp/pinctrl-mxs.c                           |  3 ---
>  drivers/power/domain/imx8m-power-domain.c                   |  3 ---
>  drivers/power/pmic/bd71837.c                                |  3 ---
>  drivers/power/pmic/mc34708.c                                |  3 ---
>  drivers/power/pmic/mp5416.c                                 |  3 ---
>  drivers/power/pmic/pca9450.c                                |  3 ---
>  drivers/power/regulator/pwm_regulator.c                     |  3 ---
>  drivers/pwm/pwm-sifive.c                                    |  3 ---
>  drivers/pwm/rk_pwm.c                                        |  3 ---
>  drivers/pwm/sunxi_pwm.c                                     |  3 ---
>  drivers/ram/stm32mp1/stm32mp1_tests.c                       |  3 ---
>  drivers/reboot-mode/reboot-mode-gpio.c                      |  2 --
>  drivers/reboot-mode/reboot-mode-rtc.c                       |  2 --
>  drivers/remoteproc/rproc-uclass.c                           |  2 --
>  drivers/serial/ns16550.c                                    |  3 ---
>  drivers/serial/sandbox.c                                    |  3 ---
>  drivers/serial/serial_adi_uart4.c                           |  2 --
>  drivers/serial/serial_htif.c                                |  3 ---
>  drivers/serial/serial_xen.c                                 |  3 ---
>  drivers/smem/msm_smem.c                                     |  3 ---
>  drivers/spi/ca_sflash.c                                     |  3 ---
>  drivers/spi/microchip_coreqspi.c                            |  2 --
>  drivers/spi/mvebu_a3700_spi.c                               |  3 ---
>  drivers/spi/omap3_spi.c                                     |  3 ---
>  drivers/spi/spi-sunxi.c                                     |  3 ---
>  drivers/spi/spi-synquacer.c                                 |  2 --
>  drivers/spi/spi-uclass.c                                    |  3 ---
>  drivers/spi/tegra210_qspi.c                                 |  3 ---
>  drivers/spmi/spmi-msm.c                                     |  3 ---
>  drivers/thermal/imx_tmu.c                                   |  3 ---
>  drivers/timer/ostm_timer.c                                  |  3 ---
>  drivers/timer/sp804_timer.c                                 |  3 ---
>  drivers/usb/common/common.c                                 |  3 ---
>  drivers/usb/phy/rockchip_usb2_phy.c                         |  3 ---
>  drivers/usb/tcpm/tcpm.c                                     |  2 --
>  drivers/video/hx8238d.c                                     |  2 --
>  drivers/video/imx/mxc_ipuv3_fb.c                            |  3 ---
>  drivers/video/nexell_display.c                              |  3 ---
>  drivers/video/rockchip/rk_lvds.c                            |  3 ---
>  drivers/video/rockchip/rk_mipi.c                            |  3 ---
>  drivers/video/sandbox_sdl.c                                 |  3 ---
>  drivers/video/tidss/tidss_drv.c                             |  2 --
>  drivers/video/zynqmp/zynqmp_dpsub.c                         |  3 ---
>  drivers/watchdog/armada-37xx-wdt.c                          |  3 ---
>  drivers/watchdog/at91sam9_wdt.c                             |  3 ---
>  drivers/watchdog/mt7621_wdt.c                               |  3 ---
>  drivers/watchdog/orion_wdt.c                                |  3 ---
>  drivers/watchdog/sbsa_gwdt.c                                |  3 ---
>  drivers/watchdog/wdt-uclass.c                               |  3 ---
>  fs/fs.c                                                     |  3 ---
>  fs/ubifs/ubifs.c                                            |  3 ---
>  include/relocate.h                                          |  2 --
>  lib/efi_loader/efi_capsule.c                                |  3 ---
>  lib/efi_loader/efi_gop.c                                    |  3 ---
>  lib/efi_loader/efi_rng.c                                    |  3 ---
>  net/eth-uclass.c                                            |  3 ---
>  net/tftp.c                                                  |  3 ---
>  net/wget.c                                                  |  3 ---
>  test/cmd/exit.c                                             |  3 ---
>  test/cmd/test_echo.c                                        |  3 ---
>  test/cmd/test_pause.c                                       |  3 ---
>  test/dm/blk.c                                               |  3 ---
>  test/dm/i3c.c                                               |  2 --
>  test/lib/test_print.c                                       |  3 ---
>  test/log/log_filter.c                                       |  4 +---
>  306 files changed, 22 insertions(+), 867 deletions(-)
> ---
> base-commit: 1de103fc29761fa729dffaa15d0cfb2766be05e4
> change-id: 20260202-cleanup-560c900f7bc3
> 
> Best regards,
> --
> Peng Fan <peng.fan@nxp.com>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
