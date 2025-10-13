Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BD9BD7E5F
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Oct 2025 09:30:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A595FC56607;
	Tue, 14 Oct 2025 07:30:15 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012046.outbound.protection.outlook.com [52.101.66.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB788C349C0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Oct 2025 01:38:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GJ4MO7S5Wc96aYWzPIIrxZmCoR6f3ezVvrwc/bHwNdS4Vzj24VY7d0YB0HzgggPWF9+cYI0Thi5a7t7UR6GzMZfGkcAKTmz0IOekOmgcik7uq+L8qpwnjANF9MY55lAqa5thudhei6RCANGsL9vxRfOJcBjYPKqqxevEWpdStfPctd9nLJNCjrETLUzsOn6i/GE5v3i6vGMQKlOzgAd2p69TDDqeiVK2LfadmLMgvVWQNkrNmVISfADa6nVKEAFe+QpRO+UGwUIoNt/nO+Ni9IK9Hw/JG7i5xWmJLPl441iQPX5/+vp8Il9Wvproh/v/VLMcVwTqtCprNDcJpgZUjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bCE8hrs0y5nmvebkbgKE2fSLvVcSMpMXm0r9sWglbkY=;
 b=hDdOtroaeVARpX7DfdTXSbqggB8Wmu5D5LOW+KUYpCz0a81GQoNk+8I1eWQLIW9/WpTyMovQCtdVlxSAOoHYM92QJmqeG+lt2dw916UffAIrC5E/NcuH78SiBd5WOJ/hxr3Hh5+bA6tmwWoKgNR6KOc7OV5A3IO+493IzJpqOjhkNtgr2Ox3hUE9f72GwFRXKQ3hUPXsmqwvHM0ftflS2LSfs3e5n+KwzEGm0I8WtYouxiX9rweHPz1R5mciRS7tOUZV5S3+aHqkoEgeD+k6ywOKcJJBti5BHPO3l7Cvl17cYpRcCzas1B9hiwKUkwDZXDYTccjzzmWCGRxMKBETpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bCE8hrs0y5nmvebkbgKE2fSLvVcSMpMXm0r9sWglbkY=;
 b=oytxiYhDwactPJRMPKjWEXksNWcK/WxLin+LkxM+6SCRbdipdLURtkBq0am0WYHFHIYsFkRmpVaGLSfsNQG+fjaJ0SX6R8OHRI75cf77NF6LJDAyXrK/NQigNFYfeYhN9wKjvoQ+rxgNNehCsXIjcyo29AtfmaOaZYMk6pUieonqNxWNuDjS/bdIRmvWzGa3rZE52T3pccNVT49DP3vxxA6mGKLY9OWfzek7+sVzSYlIZ79gvnIjZMIiCnlNQ/1LQEzmUxgbb8yT4IKzaGA0tpQHdI6Dcsir9owd9d6kiiXT/6EG+MpukXcaCsH2eTSUyRLVCf+Pa3MKbfgFPEtXzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI0PR04MB10613.eurprd04.prod.outlook.com (2603:10a6:800:25f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 01:37:59 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 01:37:59 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 13 Oct 2025 10:49:29 +0800
Message-Id: <20251013-imx-rproc-v1-10-fb43a3fafcd0@nxp.com>
References: <20251013-imx-rproc-v1-0-fb43a3fafcd0@nxp.com>
In-Reply-To: <20251013-imx-rproc-v1-0-fb43a3fafcd0@nxp.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com, 
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, 
 Fabio Estevam <festevam@gmail.com>, Stefano Babic <sbabic@nabladev.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR04CA0202.apcprd04.prod.outlook.com
 (2603:1096:4:187::20) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI0PR04MB10613:EE_
X-MS-Office365-Filtering-Correlation-Id: 66361707-24f7-4e02-9375-08de09f92403
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|52116014|7416014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmZ6RllIZEhWbDRmMVVORHF6Vy96U2NmTFpXNGgrcm5JZGpPRDM0U2hwdm9j?=
 =?utf-8?B?QWJUcjBrRHpnYU9adHo1MzBKUnJMU0ZIck8reU5FZ2swZXZrRUcvT1pxV29l?=
 =?utf-8?B?YTlobjAvR0EzV1BKdjM5cTh6SDM2U0I5QXpsTHBwc1VSd3I0d2RLUnZDUWZw?=
 =?utf-8?B?VXhmMXladm8vckpWemhVNlBBdHdiUVNndzhlOTJWcG5qMG4vbmVkTU9SdGxa?=
 =?utf-8?B?cWlPdVNNK3NqTjhqaXVueC9JcnJXZE83ZGkwd0RkYVFIamF6cnZadDRjYUFk?=
 =?utf-8?B?OGtFd25qVkdKZU5DRmN1UjdCRi9TN1BsTXZMMjdQNCtFWVJaUjB6NmNNVXp6?=
 =?utf-8?B?Wnl5RmxjU1UvbEpzNTNhQjBwdVJTZ0hNcFdJdXB1V2Z4dmY3bDFpQ0hZclBW?=
 =?utf-8?B?N2dxV1Qzck1aeTNmcGVlYW9sSXFDUTUzeUt5cnNIUXhWUDdBTlpvVmQwOFg2?=
 =?utf-8?B?V2FpMHZkMXNRb0ZURUVqU0FQUEJaN0NhQVNOellyRnBuT3ZsSXZScE1DN2pG?=
 =?utf-8?B?NjZGNURYbHpDRmVicDd5RWk4YjBRZG5vRlNnUE5lRzA5dXk5c3NvWTY5bHVp?=
 =?utf-8?B?aXU2KzBtOVQyOURRT1A4OExLL0ZxSDdkelc2bkJrYlkxYVV2NHlmaXhUVGk3?=
 =?utf-8?B?RnR4cWVvNlJpd3BuRHJXVEtLZlg0S3Jvb1BOUVJ6SWhJVHUzTEhES2oxK3Y3?=
 =?utf-8?B?dlVKSGZXemcySzdiWnIrWVc4bFNncGk4NTdhMDlQdVVnekNPNVk5TjBKSTRZ?=
 =?utf-8?B?cFF0L25KazZqTUhobWhhVkx6TzJMNnVWSnBLbVA2aG4zK0FDV2FnTjQ4WG1R?=
 =?utf-8?B?V0lYSlMzaFVETzJlbCsxbmVzUHRCRDNuT3hsRW9NcFJWS08zVnZNMWNpQXg4?=
 =?utf-8?B?VHM3bHlVMExxTXJZQWZIYWVRZE9KZ2htTXA3aG44QUtmd3psRDlNTzlMTWxy?=
 =?utf-8?B?Rzk5c2RPekFsLzNTSnpyWVcyZE9CYmVEZlNXYXhPMjMxWUpkRTFUUGVHcWxL?=
 =?utf-8?B?K3BFZFBEcWZLbE9ubWE2YkV3SWdiWjhXN1FhckJEeXFCVE0xNDZZb3ZycVpY?=
 =?utf-8?B?V2xmcWJ0ZnVxVDRwQkkvRXg5MGZEWitwQmhjME1INkxlM3NrNHNtMytaN1lB?=
 =?utf-8?B?UG03RGdTRDQ5NzhlbTNONzZPeFdOQ2Y0WjA4dEEzN3RqVXBCVFJPbFk2aWZy?=
 =?utf-8?B?TU5ocTM0WTBwRFpKcjhRN0o1L2NDZGxISDk3NzZlTmJCTEhnT28ySEtnZTkr?=
 =?utf-8?B?eTJ0NFVIbGZVbmdZSzlsc2IvUjUrUzBuTnBGWW1Ddlo5STJhcjM1TkdFdDAv?=
 =?utf-8?B?UVJaZWlPUjRiWStjVDdiWnI2NVNwMzdmS1ljUDZDbEhwVDIvMG9BNWdGUmxr?=
 =?utf-8?B?dGc1dTBGeHcwUE5MSm96R29PUUZMRkJ4MmVPTnpnd0J1clF6eUMyUDg0bDF1?=
 =?utf-8?B?aVN0VVU1dEp3M1EzTzB5d0h3VmNkZmxpMURsMDVaMVRSY3d1VUFhUlUwbHV4?=
 =?utf-8?B?YlFFRERONWNQbFJ5Wms1eWZXdStRNE1ZN1hoTk5OSVVTVC9sMmhNNUtLcFRK?=
 =?utf-8?B?WDVGRUNEVVBkRWh0K1RDb3E0elB3ZEdtUlZ0NGVNanY2MWRJbTdBcWQ0Nzg3?=
 =?utf-8?B?c0lKb2lwaG1TRFlUVWZteUgyS3IzQTdwWjc5WEdlUlhhdG43Wk1SQktmUmZD?=
 =?utf-8?B?MjlEMDFjWGRxUGg3MG9xODRSM0UzWXR4MU9OU0V5M0U3MDV0bmhmNzhnYmdZ?=
 =?utf-8?B?dEJ3VDNBUllHbWNtUHVCRytwdkZzd2tuUSsvbTZjRUtia1lGdWRFMjRpektX?=
 =?utf-8?B?dThZQlJGNHhNOWxJWDZqazU2MkthbG9wcnYwaHlkZnMza1lTS21kc2tad1Rr?=
 =?utf-8?B?SUQvTzNKUW5CcElUNzhyTWxHdGl2MnZoNWI3V05JeTJzbHNqZWRFSExMa1lT?=
 =?utf-8?B?L2lFN2FLMWRXYzJGbUw2aklVM3gwQ0tiMXBIdDRYb0IwUnRpdnF0S3J3Mlpj?=
 =?utf-8?B?a05YSmtpZ0d4bitOWW4yVjlpSEhnUCtCTU1XaU45NDJQK3pkdStrNUlXUG1v?=
 =?utf-8?Q?jhCxd/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnpVYWIrd1Z2N1g4SmRlVnpmaUpKYWR3NnRGNyszTWRvaTVLdmluNmsxU1BU?=
 =?utf-8?B?MDc5S0V4MzA5VERQeVp3d1lzQWNlN0MwUHlPV0YvRWg5TmxrQk1VUDRrZkJw?=
 =?utf-8?B?eFI1YTBjRjE5OGFaNThXMWR4eTNuMGRrOUtlVnc2djBMYXZTY0phY3RCOWdO?=
 =?utf-8?B?dGlLdjlvUXdDOFNvUnVhRTI2bDdMQXR5VlpVSlpEMWtjOFJWR2NqY3NTM1BS?=
 =?utf-8?B?M2lvby9aeHdWREtwTEFxV0tERys2VWkxaXdqTFRCRVpWSktVUHNnUDBnRjdq?=
 =?utf-8?B?ZGx5UDhzTzVldXRCekdjMjl1ZFc1TEluZ1g2UkdHZ0RDRFlORDVrN0xnSDNj?=
 =?utf-8?B?TmRKV2xPUmkxWW9hMTVHTU5xTWhCL3RoczB6ZEhvNUk1anBIOWdqR2RueWQ5?=
 =?utf-8?B?d0VLNDdRYkdnTk1TQkl5QnhtTmdtZkFkZVFZRCt4MWp4VG9KQW9CSDRHNHFO?=
 =?utf-8?B?T05zbGFETnVQVER6UmNSdllXdjVLeUhRTG1WTU5jbzVuK0FydlR5clorTWRI?=
 =?utf-8?B?VG5MNE9udkhocnEvbkdCcFNocUwvOEhJUTk1S2xwSnNRWjhteXFkYnJEM242?=
 =?utf-8?B?NVlTNGpYZ1MxZzUvbUkxVzV2M2s2R29WYmV3MW05ZU5STHVhLzVmWmlsblVQ?=
 =?utf-8?B?QnlTejZmdE9aRTdmWE5Sa3l3dHdKdVNZdUM0QWdRWHg3UEpScHRtZUVqdTMy?=
 =?utf-8?B?R3E0TjlZYjNydS9WTll3TjZib3IrWkl4OVd3cWsxS0cwWmNTeFFTREhwSkNY?=
 =?utf-8?B?U0FGYlZoVk5SSFp6YVU4K2I2NDZkVG5JWUdZVVY1ZVlDSlZ6dXJRR3EyYWR5?=
 =?utf-8?B?N0ZpQjBNT0FJSTljVkpTajgvMkVsbld1OThEbEZEQnMydDhxOUlWM0kxY0xO?=
 =?utf-8?B?WDg5eGR6WE1yMllRV2JhMjJheksxOHdKS2RrQlZSd2YxbDBNQytJdllCR2dV?=
 =?utf-8?B?RWtXZ2xpNEpmeDFyQWxsNTB5TEpocVpyZWN3QnRTVGFQVzMycFJZK2xuZEx5?=
 =?utf-8?B?ZzJiRFZLdWNQUnl6YnZFdUFtNlBsMnlTN1V1ZzlqU29ET0liTHJRbzJhWlRG?=
 =?utf-8?B?N3dtME5VeVIvczRYbXlENWFXd050TlNHSG9pdWhGQkZvQTB4TGRoMmprc3Fu?=
 =?utf-8?B?azR2emU0Y2o1RnBTQzZOVUVnODdJMzZrZXFpZENwSzZCM2hRL1J1K2pOWFk3?=
 =?utf-8?B?NGZPYlVxUkpEVGQrd014djlSTmhmTHcwcE5GY0JNQzQ5Nm4zRVhVRE9GMVZE?=
 =?utf-8?B?VVJLdlkwOTNhamtCeW5aT1huYmV6dEpad2JBbExGTjNLREhGTm1KL2ZGSCt4?=
 =?utf-8?B?V0VsNTV0OE9SNWdoMmlVaDZXTTlQcTBVU1NyRngvQXJiY2NYM1NMUEZJM3hz?=
 =?utf-8?B?KzVJcWFOSWVuQ2UzMXdnYWtaenpWU250aUZVWW10WkVIVmhGdnY4azg3Vndy?=
 =?utf-8?B?ZjRYWi9vYTZDNVhMY2F5Z2NGSjBqWWFZeWxtbUt3L1p1M2NDUXRNY3BwUllT?=
 =?utf-8?B?Smc5ZFNheFUybitzcUVpNGQwUnNKYXpjZitLK0JFdmRGYTFZbnBZZzh2YVU4?=
 =?utf-8?B?MVpBNHdab2xUMUVheExBeXhWRjFLZEVvakxwNlBCSFNWYURnRGs3RGthVFNs?=
 =?utf-8?B?cCtIT01sdGJ2SWRxQnpHdDJaVXl5U3FLZ0EvTTk3eHp3NExlRHlJMEIwUkJz?=
 =?utf-8?B?TUZJbW9odktjNkluTmZnSDlQUENmYU1qM1c4Yy9UT3o0c0drNTFaSWYzZlJT?=
 =?utf-8?B?MGhobVViblBaYStqd3oyWFRyMytJNHYwSlFlUit1dFVVV1o4czBnL2xLallv?=
 =?utf-8?B?WXFORzdqRklvVFIySjVnTXNhVmpodUlldUVDYW1tQ01hN0ZYSFdLc2N6MW8r?=
 =?utf-8?B?MktlekQ1WXFGamgrbUVPVU03OUhzUm5KaGxEYmdoS2Nya1F6N0UvbWg1blVM?=
 =?utf-8?B?dDQ0Mmk1K0pwQlkyMjVwOVc5L29VOFFEOWxYaEtQWTVvdkRWbzB6OVZpbXY0?=
 =?utf-8?B?RC80bWxiU1QwVG42em9NOEZoaE1lZjVTUEphS2NxMVY0cWNIUVlOZDRqZ0dz?=
 =?utf-8?B?TG52RGR0VmR1MzNYdTVCVGx3L3BSZDUzVTZ0S3dRQjBpQUZZenEwR3ZpQmVG?=
 =?utf-8?Q?5lBl1hWOGAsNAYlTq4S0r+CPv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66361707-24f7-4e02-9375-08de09f92403
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 01:37:59.0262 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SQa/IxZvkQahOAjJw69B7Olyznm953TYHylfDxfxdM2GTIcHZxvI74Z998yWVUZpnJKAVvpxxzWVLdRilZzdZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10613
X-Mailman-Approved-At: Tue, 14 Oct 2025 07:30:14 +0000
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Ye Li <ye.li@nxp.com>, Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Udit Kumar <u-kumar1@ti.com>, Oliver Gaskell <Oliver.Gaskell@analog.com>,
 Andrew Davis <afd@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
 Judith Mendez <jm@ti.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Ryan Eatmon <reatmon@ti.com>, Hari Nagalla <hnagalla@ti.com>
Subject: [Uboot-stm32] [PATCH 10/11] imx8mq: Enable remoteproc for i.MX8MQ
	EVK
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

From: Peng Fan <peng.fan@nxp.com>

Select configs to enable remoteproc for i.MX8MQ EVK

Reviewed-by: Ye Li <ye.li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm/mach-imx/imx8m/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/mach-imx/imx8m/Kconfig b/arch/arm/mach-imx/imx8m/Kconfig
index 0584dcb580fd4b25582b26b899c70f3cb78a3858..030ed2f0633212499bf74f232e9bcd19d9bcd86f 100644
--- a/arch/arm/mach-imx/imx8m/Kconfig
+++ b/arch/arm/mach-imx/imx8m/Kconfig
@@ -67,6 +67,10 @@ config TARGET_IMX8MQ_EVK
 	select FSL_CAAM
 	select ARCH_MISC_INIT
 	select SPL_CRYPTO if SPL
+	select CMD_REMOTEPROC
+	select REMOTEPROC_IMX
+	select REGMAP
+	select SYSCON
 	imply OF_UPSTREAM
 	imply BOOTSTD_FULL
 	imply BOOTSTD_BOOTCOMMAND

-- 
2.35.3

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
