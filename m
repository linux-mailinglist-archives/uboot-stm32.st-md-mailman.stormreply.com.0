Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E79BC306A5
	for <lists+uboot-stm32@lfdr.de>; Tue, 04 Nov 2025 11:06:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17D19C62ED6;
	Tue,  4 Nov 2025 10:06:38 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010029.outbound.protection.outlook.com [52.101.84.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3749C62ED5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Nov 2025 10:06:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=upd8ehEge/cfuQLewd1/6TTH0wuQZQoMro2fKL6emsxCaK8/+NmQyqBPhMbV3CGSqXwhWQVsU2PGnXJRYajdWuTpufQzm8UFW3DT67miE94k1HrmS/CvPIBKZev+UgwcLUg4DBTIDV8NcD8Fm8KLR9IUCyWn8CIQWfKf82PjB/y9faZKklVX9fbArG56ixJgzj81+IVU/tgL4dDZsnmSrSRPbzhfYho/r4wJdVO7CgYe4Jglqd5C2/5m/E0cRYouiAeD6VDZeRB55JPJwKjpfRbyrz2y7vyxzPRaGKL/IQg3kOnDmuAhX0xiiryBfe8Qitd/efNbghXqQPsIIeeSJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HEwIXQLUbTS6xvoCa/ce47qmmav5mXtLd6Z5JMod+l8=;
 b=Skm6+qnxHKkdATkkxPYQ/IKJWSba736vrpDbvjtSNvEH0xiyBOKbl0vRXnkCdW3ld1NLy3EKNVxKjAGmYS3uFKv/pdNlFhjpaKb5NEOhVbGnD6JmruLdZiYE35V4mmftDW8sLib3A4WvvtP2xfqmNZQBw6ehs/cxIgpCvBzYB2APSxmTh3btLUnRZhke2BKPRNPyHUYmHwR8ThAyBN/LRSg+u0vrdFhdYAfkH9nfdnhhqKHkrtBQ+sKhArSe3L8Opb+gsNddY9vlsa6kH3zZju/HxBUQx7PUGJXlxc0i3mWKtfjLMPJmpEtZrVuYXPGdv02A+ySLpr3s9zByWCna2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HEwIXQLUbTS6xvoCa/ce47qmmav5mXtLd6Z5JMod+l8=;
 b=C0dK/NKyEkaP3un2QsOlv4QoXM2FQwKyA0WeadUBdQx9PInitgVsrinPpUzJrivk3pa5WJGK5Lermp1nVaMGcVb2eIyuLYfbl5RCfJSRRaU3/eVfv+Yh/lM9if8LNWSoFrT6pG4g+Dz1uZ0XFlDGgsD0wOWY4uNZJGF/bms9garsIQ5RBzoWU53sS0ZaYn8IhoxdnQuKSYtgJCUle/NKRPoCmxPzI5kkP4Y6s/xhJ7r0j6TmNDHFghTLwjfOnXFQA6zW6QWYThICY6a0fpqG7528ljmVkj3Kh0ZXNqrp9wPyhmcOQfVHRMonJP7sr/2frzu0duDLZ1gUor6ezsfIEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS5PR04MB9969.eurprd04.prod.outlook.com (2603:10a6:20b:67c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Tue, 4 Nov
 2025 10:06:35 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9298.006; Tue, 4 Nov 2025
 10:06:35 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Tue, 04 Nov 2025 18:05:53 +0800
Message-Id: <20251104-imx-rproc-v4-v4-4-8bbc7b886737@nxp.com>
References: <20251104-imx-rproc-v4-v4-0-8bbc7b886737@nxp.com>
In-Reply-To: <20251104-imx-rproc-v4-v4-0-8bbc7b886737@nxp.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com, 
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, 
 Stefano Babic <sbabic@nabladev.com>, Fabio Estevam <festevam@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762250765; l=2398;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=M8deqCDAWPPcAYOEGwo5JrsHeroiY6Jj9TbnOowIkrg=;
 b=SWGbmVSJx+6lCD+IJXuEjq44FNJrAAyA0JsSKBgQkW5Y5Apgrq3bOytXyashOi3C90ydiHKVF
 ZildWQykphRCjdpf12grA+n9hoDt2ObAp8peBBqm1wgMxVX/I/oWl0q
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::20) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS5PR04MB9969:EE_
X-MS-Office365-Filtering-Correlation-Id: 9aedb591-51b8-465e-ed8c-08de1b89d635
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|7416014|376014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?STA5bC94dTE2WHFCWWFGSjZTSU5reUN5cTI0dXJGZkdVT3dkbE9xOVJ2R1cr?=
 =?utf-8?B?WEFBRmU4V1RFQ216dFFGVGFMeXhvU2R2NUhOWWpmTGU2RUZSUjRGT2dhYitB?=
 =?utf-8?B?WUh1S2I3N2VKMjNsWE81ZmlrcHJQYWpLdmwzTE1IeFEyY1hwOEwxZ29hbVNu?=
 =?utf-8?B?RVRIWjBoQWpXRkpndDIrcitySzRsaDczOGJpeU9DU2pZTERlODJDWmowSjdp?=
 =?utf-8?B?cC9xZTgzcVk1RnJDQktpSmUzdEF4djYrTnYvZkdKcER6Y3Y2b3R0a01ldU1v?=
 =?utf-8?B?OXEzWHRQUmZHNURyWS9tcXdxSTIyaEZxRHhVaGtRdTJ0ejRTaTlmcjNCWVcr?=
 =?utf-8?B?WWRIM29TU1ovN2Nja0ZxaE9yZTZyUUNnODUrMHAySVE2ZTBXS1pNQkt1WjI2?=
 =?utf-8?B?eVQ2RFFtRkY5SC90UkNBQ2Z6Z0NWSldaN0l2RDQwbE1TWlNQaU1BcStKOHJS?=
 =?utf-8?B?QnRiMUJ4eHpJdG9jSHcvOE0yOGFnSlJMZU0yN2NaNWlHMHl6Nm9PNmsyTTBs?=
 =?utf-8?B?anBBeXVIL0FYVzZqamRuOXo4Mlk4dlAzckRLTGV0bkphWWRjSk1RbTBJM0c3?=
 =?utf-8?B?T2tCVkkwWWVuU1E1VmJKWEZLaU84RE12MmIxY1B4QlpnV05CN01iaFp3czc2?=
 =?utf-8?B?VlVYNVZKVWE3QWZVdmRMTTZpRXpEMjJ1ZExOOGVIcXN3MG8zWUYxcnlnVnJx?=
 =?utf-8?B?N2Vla2Q2QUplWDF3Nk82cTg0WGQ4MVUxMGUzMGs1ZGc3UVduZ0tEamxMSGFB?=
 =?utf-8?B?d2hMYlMySExDem5vbEkxZzZFN3htWWZqVEp2N3pKYXNjTnQrQlBjWlVzRVRW?=
 =?utf-8?B?OURxVEhNWGh0L2xUZGZLaXhjMytDUXRFNHRGUDc2aEZxMmhQN3ZpTXRHZWpP?=
 =?utf-8?B?VFZhR3RpSDhzQlgvSVAwZkdabUdWVXUrc3RnZEpkNHBDYU1vNWU3QitLQU5S?=
 =?utf-8?B?eUxzSXk0RTNsQStxMFJmSGxVRXBTVHZhNmhxOU5wZElqbXdFUW9Xam9YUU11?=
 =?utf-8?B?ZVdMOFRRWDFiRVUzbDM3T3hzSGo5c2FNM1JjcFcvcStkWUhxbmtEZVBxeEJN?=
 =?utf-8?B?ZGZwbmhLQ2Q0WWZBRGxKTzFkV0o4YzNyWWIwR3E2MkttOWx3Y1ZxOFJTN1Rv?=
 =?utf-8?B?Sm4wTFBNTFBLVUNjaS83RWNReGMwVFZac3hmamh4ZnM2RlcrcS9hSythUXJN?=
 =?utf-8?B?RU56NmpsbmJabnRMZEkrM1lqeGlNU25iT2Y0WDd5b3RsK0FmQ2p1VHpvZjFj?=
 =?utf-8?B?Sjc5RTFrdC81ZWsyc0FFU0JjeWd5Y0YwWlZBVkdRWTlQc2VFYWxYZjZYUlh6?=
 =?utf-8?B?aDkwSFFZVVRtNnBieXRQbkd1QnVYdnZiTzlkL2N3aXFoL1BPaStHZW1rSm12?=
 =?utf-8?B?SFhCZHBnTmR3Y1VQUVBjcXVZVG03VGVQNmRWd3dMa0trL0ZFT25Bak5PVFlG?=
 =?utf-8?B?L1hVbVpLRlpUdjk4S09jQU9pQkN6dFBvMWQyNndabFU5RFpidDN0QWNIQTc3?=
 =?utf-8?B?bjVLVGJJZDZLOGw4ZVBsczg1b052UlV4bFFpUGhMZXdsN0NHNGdiYWZ5cXBY?=
 =?utf-8?B?YWFuWlBlYTZmUW1CZk9pc0luWXcwT3A0UXg5RnRNVWZRaEhzclEwbE01VzJ0?=
 =?utf-8?B?bjNqbUFxMnptcmNVbkZTWC80bmwvK3dGYVNyMEE1Y25hanNSZ0JVdUpQR0Zx?=
 =?utf-8?B?R1J6eUtzOXJ5SHRpRlhjY2k5N24xNmlVVXY1UUtXYXVCQnZVRzMxZ2ZGb0NF?=
 =?utf-8?B?Nm1SSGNLYTE0WllVbmEzdmZXS1hrT1FCdDA1T2YzZWx2SU15M3Y2REhSZndG?=
 =?utf-8?B?bXZTamU0Z3Nxck92YzNsUWJtSXVpSkhhK2lLQ1BUVzdjVW9TL3Z2SXdON1N1?=
 =?utf-8?B?aE5uSlFGUHhDQnNxZWgycGN2OGQ1V2U3SHRJOHJUc1lDcmIxY0MyUTNiZjVK?=
 =?utf-8?B?dlVjQUlYaG4rWE4xaWtZNi9pdHQxRTFxSWtIZy9odjdUUVFqWXR0TkFMUTY2?=
 =?utf-8?B?aTdRQ3Z1bFVMWWMrUFQxaXpDWXg2aVVFaEd0K2JUMUx6bU1nbEJtWWJkK0Zk?=
 =?utf-8?Q?xqTMGe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(19092799006)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGp4NGJqcU1rb0VmdmJ2UUwza2RqbEtKTm1WeXVVVlNlZ3RWM3FEcmF3ZmFY?=
 =?utf-8?B?YTJmMWxVQXRuZFpjOWUyWWR0eGdzaTVXUlVVSjYvZ1QvQ1o4cC9CQzZMSXk1?=
 =?utf-8?B?MThlQnU2Q000Qzh5V2VoTzJHbWxBS1A5S1RJS01nR2FNczczMXo1ZWtkSk8r?=
 =?utf-8?B?QitKZTk1WVJVeEowVUREdmJYbXEvN0RDRmdwUzFNV1BHS2FaNTJGT3h5TDRo?=
 =?utf-8?B?R0JvK3JHb0VEemdmTGZ4M0NPalM4MHFGWjV2L1I5Q2pkWEZDODZ0MWNoVHF6?=
 =?utf-8?B?SGRqWHFad2FtSWovY2l3RlR1dnJnMlFtaC9NUjZ6cXE4QmMyN1dNWDZWdXEx?=
 =?utf-8?B?MU1CRWZoYXEza2s5L00wKzlId2daT0N2b2ZmYTgyZnBHSFRtZklpNDdFc3Nt?=
 =?utf-8?B?cndYdnlQcnB0RjFhamtab2hVMVVPZVZIVmNaSEV5WWlKYjdaUlprN1lxU0FE?=
 =?utf-8?B?Z3l5V1ZtazJDYVBYbWtLNWZGVDRHQlVadUlYZnU4K1d6RHhncE5KMlpKNUp2?=
 =?utf-8?B?V3BhUmsrR01ZRWdLQ0pFZDFYRmJPSjNtNUhhK1J3OW9uU2pqRno1TlZiS0Mv?=
 =?utf-8?B?TzQ2T0pnWDErKzFVWmpySFdDejBzbC9VaElONEphMStWaU5RS3RYaWlFa3kz?=
 =?utf-8?B?UndhVS9zeHRaU29teUNEUGxZM0JIeE5zemd0QkQ3RUJYN1hwVmt3WWdsVGVl?=
 =?utf-8?B?dGJpMkk4bjg4SkhjcmFvTWtBRzFoN2JLWGtlandsdmg0OWE2ak4vdTJFY0hn?=
 =?utf-8?B?ejdxRCtZcDlVd2VkZU9BdnlKaXJrQ2I4OUI0K2xvbmhHMXBwQ0Z4Sk8zQ2dz?=
 =?utf-8?B?L1NMTmJQYVNnWXk5NEg2eE9SclRkK2hUdndCcGVxOERwL2NpdmlzVUdYWmpM?=
 =?utf-8?B?b0FoSWgzMWJSS0dhSERpaktCNUhxRlZIa3ZVM1F3c1MxMXpuT3RXbXpCeDJG?=
 =?utf-8?B?bExnbVVrZmhBQlFOSzlHbllqVUFCa0J2MDNsRUtGVFVFclhsdWxwVmwwOWp4?=
 =?utf-8?B?OWxZOU54RjhMcDA5dzViYmFCQS9hQ3Z0aU0wY0hWQjFCY2s2dnZFWTZOZVZC?=
 =?utf-8?B?Y2M2K01HVHZQeG8vcDVpemlYNWhTTGlrSDZCVGZBQ1pxRkZXc0FtUUZjYjhL?=
 =?utf-8?B?eXBOS2ZFQWZTS0ZiWXFHUGV3dGowbHNqU3NKY2wzWXFCQXY3QXMya0k1d1ZK?=
 =?utf-8?B?UFkxRVVldzNsMnhZMnQ1WHhTVXhaK3FVdFE2VGU1RDc3bUdyR1hieUNsNG1W?=
 =?utf-8?B?eXczWXZPY0hzOEdhSTcyamZzeEhVQm50eHhCT1U2WElmcm9ERVVXZC83VXBh?=
 =?utf-8?B?NUp5WWVBMHRwd3VVYWVYeWxOcEhZQVFHWXE1R2xyL1BwRksyaHZENDhTY00v?=
 =?utf-8?B?aTZ1UU9raG82Q3NkOHVEOHNaV3M0N2ZaWFhRUTdiK3lRMm5MZmVBSWZBUm1U?=
 =?utf-8?B?d0d6UG1MTklEN2xBTDZ6YWtzbFhtcUt3S1RRNEdqMXY3aTY4d3EycUhhRWd6?=
 =?utf-8?B?ZmxUdmZvVXpRekdmZ0dXTU0wcUJ1N01KeGd2WEJjaldOUXFKMHR6QkR3QTA1?=
 =?utf-8?B?YnB3SkxYMnlTUUR3YjNWV2Y0RkxXc0xTWlBteGV4SXJVTWp3Zy9JVHdTYlov?=
 =?utf-8?B?VzJwZGkyNFh1RUxBdlV3ZDVwQVRTYTM1M1dhRGVheUVFTTNhdEp2OUtYVUUr?=
 =?utf-8?B?TXEzQ0hDSmwvMlk2R2VYdVhNdWZ2MVBxRlg3aTEzc3FGQVJYZW9aSUlBN290?=
 =?utf-8?B?WVN4YTkxZnA2dGV0RnlZaU1DcnpVeWMvdHcxVzhlVXZDRy9wbHhrN2tTWnRQ?=
 =?utf-8?B?bURlekpIVTVkNXdCM2wxWFl5WjhkT3pZemNPekt4dTVUYW5oZCt3bkRHK1c3?=
 =?utf-8?B?eEhQUG5uNHoxOXBsOGkyZW1LTlEvajlWTXFCdEpqbUlNY3B0aEJSZFV2SUlh?=
 =?utf-8?B?MGdmTGVUK09JUGpLd0FGWk9KcHFGOHpOSnI0TzhzbXR5ZnhwSDBIc3MyampR?=
 =?utf-8?B?MXovaEpkYWM3b2w4ZzZIQTVUWHMwMGJjUUpySGpMMnFuUTllV0lPWklsOHFh?=
 =?utf-8?B?OXJsSjJQWGNKSE5WL2VycWtTNlo1SHUvcm4rZXdiSmtQMFZHOTNVVEhjRURl?=
 =?utf-8?Q?yLBnWHjeX5r0PH6cnQY+Wh94s?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aedb591-51b8-465e-ed8c-08de1b89d635
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 10:06:35.3207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eOlwTil1lE9zSQi+dflIsG+xwnj9CVoryXV3WfRtZaQ6re+xDOsF4ZY9hAna7/RyOWoI4+NFiDVAlo1+tOXctA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9969
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Ye Li <ye.li@nxp.com>, Udit Kumar <u-kumar1@ti.com>, Andrew Davis <afd@ti.com>,
 Beleswar Padhi <b-padhi@ti.com>, Judith Mendez <jm@ti.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Ryan Eatmon <reatmon@ti.com>,
 Hari Nagalla <hnagalla@ti.com>
Subject: [Uboot-stm32] [PATCH v4 04/12] remoteproc: imx_rproc: Add support
 for i.MX93 CM33
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

Introduce remote processor configuration for the i.MX93 Cortex-M33 core.

This patch adds:
- Address translation table (ATT) for i.MX93, including TCM
  (secure and non-secure) and DDR regions.
- A new device configuration structure `imx_rproc_cfg_imx93` using SMC
  method and ARM SMC ops.
- Device tree match entry for "fsl,imx93-cm33"

This enables remoteproc framework to properly initialize and manage the
Cortex-M33 core on i.MX93 platforms.

Reviewed-by: Ye Li <ye.li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index c71e409a00a55179b06434dfa190e8eb8ba559f1..9bb5532799803d05de0e125475b3dc41a452e906 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -322,11 +322,41 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
 	.ops		= &imx_rproc_ops_mmio,
 };
 
+static const struct imx_rproc_att imx_rproc_att_imx93[] = {
+	/* dev addr , sys addr  , size	    , flags */
+	/* TCM CODE NON-SECURE */
+	{ 0x0FFC0000, 0x201C0000, 0x00040000, ATT_OWN | ATT_IOMEM },
+
+	/* TCM CODE SECURE */
+	{ 0x1FFC0000, 0x201C0000, 0x00040000, ATT_OWN | ATT_IOMEM },
+
+	/* TCM SYS NON-SECURE*/
+	{ 0x20000000, 0x20200000, 0x00040000, ATT_OWN | ATT_IOMEM },
+
+	/* TCM SYS SECURE*/
+	{ 0x30000000, 0x20200000, 0x00040000, ATT_OWN | ATT_IOMEM },
+
+	/* DDR */
+	{ 0x80000000, 0x80000000, 0x10000000, 0 },
+	{ 0x90000000, 0x80000000, 0x10000000, 0 },
+
+	{ 0xC0000000, 0xC0000000, 0x10000000, 0 },
+	{ 0xD0000000, 0xC0000000, 0x10000000, 0 },
+};
+
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
+	.att		= imx_rproc_att_imx93,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx93),
+	.method		= IMX_RPROC_SMC,
+	.ops		= &imx_rproc_ops_arm_smc,
+};
+
 static const struct udevice_id imx_rproc_ids[] = {
 	{ .compatible = "fsl,imx8mm-cm4", .data = (ulong)&imx_rproc_cfg_imx8mq },
 	{ .compatible = "fsl,imx8mn-cm7", .data = (ulong)&imx_rproc_cfg_imx8mn, },
 	{ .compatible = "fsl,imx8mp-cm7", .data = (ulong)&imx_rproc_cfg_imx8mn, },
 	{ .compatible = "fsl,imx8mq-cm4", .data = (ulong)&imx_rproc_cfg_imx8mq },
+	{ .compatible = "fsl,imx93-cm33", .data = (ulong)&imx_rproc_cfg_imx93 },
 	{}
 };
 

-- 
2.37.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
