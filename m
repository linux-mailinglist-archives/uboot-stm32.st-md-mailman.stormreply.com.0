Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A66CBBD7E5E
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Oct 2025 09:30:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D71BC5558D;
	Tue, 14 Oct 2025 07:30:15 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010036.outbound.protection.outlook.com [52.101.84.36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9090CC349C0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Oct 2025 01:37:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gDYdoMQ0i8tYDlpE2Imeze32KSSHmHVtzlnpc+KPTLooRIqGx/Brod+k1ZRK3wK9gr44S3qnYc/b4rcDZ+6UQuLiMPn52fVcdzPhPd7l3vOQuoSKDm2cLWnd75avu80fPJc63YbsSicePgeZyKh0U1bYr05cF4JOs5XfNJYohBMQxvgECV33lJAXOZdWvRVV7BJNF3NWw7LGBVJj25aBL0yFdViJNcJPpOvzLdtPjk8WzLRM/jgTEWdNsUb4SwfveW/KstV5s7gfjebhj9uOFgPaxOliWe4VCaFfiQaOkwQxEpJLZbUdJz7f/tSMaY3SfkB5cUUfJ4Nie3qRH2/ISw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9u3MVsYUS3KcpzStjz3hDy15NHdXBIWbzAKvOaXwrWA=;
 b=U9lawifxPO1DAgh7dhGy82a+3sjPGksSQPMewvgPKEs655vYYiciKKb8922Zt6saAKsehoHktHzsaNTjIVbyP18zbsvkIBtGveYjmC7qu851i8qojs971Swx1U9vA1IsrHW3EEF7YrosHDNY71idINrkip+VDdu4P4Noh25hcxgRxt4otdmPEZqNCvrRHF2BVHmvsWji/4mlLq97KifGYTkOTLREodFaprXf1jR/1j2m37cCSKXWJET0e4yz2lYEDiRBkJZ+sSrvv7gfEhclWbKP1e9id6oSEYMt09MWEM3h0VUevu0O+nQyZ/Mv2lcT0r9dcIlNC68y//zR1wMqOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9u3MVsYUS3KcpzStjz3hDy15NHdXBIWbzAKvOaXwrWA=;
 b=MVa3eheZGolsXChzKbOusTSv5kb2PlFL3gcVtbxp++5/g8ky7sigvvTB+PXQCFaqy9xbwLX5CPWIXYdH3UJnpw/7vTiX/A/OCtv2IP5O4YKKqwJu6nhtG6cFbhojw2mYKu0qesqO4Ty9dI9coaoForHeq9Ib+OjL/0F6i1yFhhjWpqNu60+RNPYmcbgYOTbtq+Oeg/ppc0HaaFTFZL+46FIRxvwjszQugmx3pDyvrzfNQtpWG/bKJ9G4g9uFttdJ6bwkU3JF3pC5+LPJNgmbElzWPgGI/AesR+uAonGBQXx2GDQIi7I4fnsJd9DWG52X+m9xhScpPB1tQMfWmOq/ow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM7PR04MB7077.eurprd04.prod.outlook.com (2603:10a6:20b:11c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 01:37:38 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 01:37:38 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 13 Oct 2025 10:49:25 +0800
Message-Id: <20251013-imx-rproc-v1-6-fb43a3fafcd0@nxp.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM7PR04MB7077:EE_
X-MS-Office365-Filtering-Correlation-Id: dda6d687-5725-4a85-087d-08de09f917b4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|1800799024|366016|19092799006|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b21xZkRYa0t4U044Y0V3VXV4SFJ6ZllGczBIcGxSaTNIYTZTbHpMUGh5VzBN?=
 =?utf-8?B?S2NwK2lSWVRCRmViZ1ZobXh3VnczUENlZ2lzczMvMXF1RXZVZjFZNzk3QjRo?=
 =?utf-8?B?aW9ocitSaGpUTnYwMzFYV2JKUGw5dHpVK0YzYTdDZEJOZ1U0aHR2YUppdURR?=
 =?utf-8?B?L0R6ZDNCa1l4TEJGVW52WGpTNGhZempHQTE2TUhDTzNVVWxVenZZZmU3NkZi?=
 =?utf-8?B?aXNvWVlQYnQ2V3d4OHlMcWU3NHlyRXZhN3IzOHZsZDVQSDF1TjQvMEVhYk1y?=
 =?utf-8?B?MTkrcWRsZUlIWFA2MHpoSzFZSndERGRycUF4L055QkZkc1B5c3lISkplcVhV?=
 =?utf-8?B?RjJES0M5YlQ4TGZ2NUNUNjZqTXp1NGZBd3Z2NUI3blQ3R2JTT2IrUzZaRnBZ?=
 =?utf-8?B?K2twanJ5YUFUbTdNMVRZVzZ1bkpiQkVCR3hwdlFBZTMrSlBtb3ZBa05sSUMz?=
 =?utf-8?B?WnZlTFFKZEdnc1ZteG5RWnZZa1Bab0tSRGx5emJpWGFHR0FZS0dhdlRGVzVo?=
 =?utf-8?B?NzJuV1ZqSnkwVW1KVUYrY2hKWnVBSFgyL2g5NVJEY2RoNzdWTXhDbkhud0lt?=
 =?utf-8?B?c3lFejYyK0dOODhKWXR1WjFZUmhwL3VvQW9WcVpUZHlUcHFzL3NuQTM0V0xV?=
 =?utf-8?B?UDE4dXVHMEtYZjg4QnFjOExjKzlmeWl0ZXprUk5heEZ3NzBKM211U2ZmdGVC?=
 =?utf-8?B?QWgyK0puWEhLeFcxeXN0ZVlQY1pjNiswR1I3NXBDZ2tZbVo3VHRJMW50cjVi?=
 =?utf-8?B?MjlRTHIxNFZrdkdEUXdFREtDRmYrVzlveGQwM0NnUVVBVGp2WkUwZFdqQ3h0?=
 =?utf-8?B?eE92Y3ZxRFFXQWVtZU9VeWJjQW9EVWRZcG9OYjB5NU14cmFKTUIxMXBLb0Zw?=
 =?utf-8?B?QTVvRDI2emt4aEhkYjBDV3ZFeEtWUldOOGo4UVNZcHNXNkpNdkx0Mld5a2NY?=
 =?utf-8?B?UFJUWm1CZjZVL2RCRi9FRk9NZkJMZit6TVNCVk16L3gxU0lZVmlaRm5YNWJC?=
 =?utf-8?B?UEZVWkw4WTBSdTNodTNkVE0yMWpVdXlPcFhtL2IxVXp2VlNwc1lHWXNpRFEz?=
 =?utf-8?B?UWRKSUJZblEzOWdIQ3lROXRIMHNaUEVjM3lTNlRGOEhoSGMzeDNjOWxQQ1Fa?=
 =?utf-8?B?czlXTG9JWXMwVzVZdUgwc2hjcDkzRWExMVBiclFnQjFVeGpuRjE5dTdiUVEv?=
 =?utf-8?B?MnpaYXM0ZkF4WVRWTWMvaVNqZXBoRDNveEVPbVlXNmJpS3NHWFVLS0NqMnhK?=
 =?utf-8?B?VGhTMlJ3QkZtcjRGU2xjY2hPQmllMkpXMUZyRUNud0ZMdUxvYm5qL2E2QU9n?=
 =?utf-8?B?V3lNVGRLaHRoR0wxL1FGcUthRDNVdDNFVUQ2WkVnbUVYMU1Wa09oZW43R3FY?=
 =?utf-8?B?N3pxYWFsZGxNMERKVE9YUzhZejVZSDVoeUZEcGJMUE1CQ1ZQQmhuZ1FXZDR3?=
 =?utf-8?B?NGlPVmJPUzRVU0lWWlNRenBvVjFGR0FmRjVrNUczdEVIckdoZjZHUjhRZXVR?=
 =?utf-8?B?cVA3aXh5VC9Va2RhM0lWR3ZwVUdGdGVUNzF5QjRZdU5nTmNnU0NiOVVyME9D?=
 =?utf-8?B?MFRZOGFrM2JzUXdoa0M4MkRJM3pSdG0xbEZ4QjFzNnBrS1MvdDNXc3BvUXVz?=
 =?utf-8?B?U3NLZm1zaFh1a2FEYmIwWFl1SGZ1SzZBMkx4aEl5UFF5TmNmMEJKY29WSWVv?=
 =?utf-8?B?ZXRuYTFWbVRaWEU4NlVueUNoY0J0bFVxMjZyUVJMTm5CQjU3c3BjTmx5a2dW?=
 =?utf-8?B?ZEM4WmQ0QTFsZ1IzZGMrTkIzOWJRSkVjVVZaTWF4ZVJOWVFuOVdlWG9DTERW?=
 =?utf-8?B?YzQyUXU1c0lWL0NHUWZOdDJNY2VTTkc5KzJRRGdrMEpzNFRCM2NMOVppekRN?=
 =?utf-8?B?RGwrL0JRV3k1QVlSN3lIbXBLZE50cDFjR2orbDA3RzBQTDB5bUxXNUNiU1pk?=
 =?utf-8?B?amhFMG5JQVg5UUk2UlpOSW9qS3NQMkNYd00xNGgxRndKOG1ENENpTWxTczJL?=
 =?utf-8?B?dGdSMmhDUjJyTC9CZU9YUncrbzJIWWtxdGcrVlpza2hPKzN1YVBqNytlR1k3?=
 =?utf-8?Q?ZD6f/y?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(1800799024)(366016)(19092799006)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWdFSldLYlRLRkx5ZklLWFQzYW5nbi95QnNiYmY4R3o5TTRpV1drekdZQ3lS?=
 =?utf-8?B?b1dLQ0lMMXJRR0hyb2JDN0FQV0toYWE1Tjcva000WkRBd2ZSaXVMT1FGTnU5?=
 =?utf-8?B?QTh3VUMwZVNIbHpLTGJsQzFTU1U1SVhRRnBLaERQUzVENHYrM3NQaGhFUGZJ?=
 =?utf-8?B?M1JjNjRDU1VCdnFoQ3Z0U0JHS2dYdXp2TnZhbkd6ajZjU1RyN3VQMnptenhs?=
 =?utf-8?B?QkpZWUtMdXZZZmVTRkUrUGFSMERjSjJPc1FEZVhZOXB2RjJ4ZGtrSXJwMnBH?=
 =?utf-8?B?WVpFNktnSHBJbXFuTHVCS0lKd0xwUVkzdEZhNFRCRzNXRTFrSWFic3J2cEQ2?=
 =?utf-8?B?eUpDeitBWEtCNzI4VXRLUmx6djQ3TTJ1TktPYjFDNk5raWEwOUFUakx5NWRv?=
 =?utf-8?B?bTZKRkdhZmFIMjNIY2JxdGpEMTcrc2xENzRaQjk1L1lNS2t3Y2RLenBhTW5l?=
 =?utf-8?B?YU5YOHAraXhpZ1lQWUdRNmZjZXhxZGUyRnNzRUlRZzJMZE1nNis4Z1NIU0Rm?=
 =?utf-8?B?bjNxc3MzVXpqc016RUpwMkpHeXJkTmtpT2sycXR2MXRaSkYwVUZBK0hOOCtD?=
 =?utf-8?B?YWo2R25OaFBCSU5BN1JYeVNyRnllbVQ5SFRZcXFCRkNGRlpjb0VpTjVPb2Ux?=
 =?utf-8?B?R0t4N3FqYkplK2o3UitROEhkcjNISUZLclR5KzViY2NEMlVpdmdoRUdCVU9P?=
 =?utf-8?B?N21JbXlpMDQ4YmRhc1V5VUo2TTZUL3pPZWNtMm1IOFJyNzZZMXM1dDZNbTNa?=
 =?utf-8?B?RzIzK3RTbHRqaHkwZWNtcUpuMzl0U1dCeDVWQS9CMjNobmEvTEFjR1hTTGk0?=
 =?utf-8?B?Z21vc3NobXJYS21BOE1mZWlYTnltYis1ZTJ0QWxESkY2eVMya0F1Z3g3dkZF?=
 =?utf-8?B?RVhFY1dnLzlwZTY3a3Z3R2wzSVkzTnZXckdqRXlSbTBwZFR1eUlUd2p5Nmxs?=
 =?utf-8?B?STlGdytkSXdjRGZHUERXVjR4c3QzRnFydVdVWVYyRDB3L0F5Wk1wYzZhTTVi?=
 =?utf-8?B?dTN6eFp0ejd2VnBqbnBUbHF2Z3N4bVBSOGdiTUNvTlZwczl6WW1wMWlFajFR?=
 =?utf-8?B?ODA4eDNJaEE5a0s5MER1QUs4cWJMcS9hY2ZJd2tua1g5d0ZnaUZ0cnBGeDFv?=
 =?utf-8?B?czlrd3FyUzk5ZmpYbVl5YjBYRVpGWC95RDJQNkRXUmttQ0MwMTFRM25aTEVB?=
 =?utf-8?B?c3VoQWFmUnNacG9GSDg2S0d5aklLQzVqUDdaVDcvc0JwYWhHL3pPczU2NE9W?=
 =?utf-8?B?dFZUYUFEbW1tL0JPQjV0Y1dJNUlEYnB5U1VpV2lHTG5ZOWN2cXZ2VUtESzR3?=
 =?utf-8?B?YUJodGloNFFGZklwSThGRisxM25EM3RWTWkycHRJNXByOHJiQ3JlZTZ2cmNW?=
 =?utf-8?B?OUpkbWwxVGpXQWxpaTlwbDVJZGpWVzZDc2FEdnhkRXM4L1EvcFhtcnRlYmN3?=
 =?utf-8?B?U3FNZjhKRERrdkxJRFdNUWpuM21vd0dtTEp6TVVuaXJxSS9ySUpGTWZzbi8x?=
 =?utf-8?B?VHRPRk16OGxUS1lzSXE1cTZVQTBIcy9qOXg4c1p5ZFliR2NBb0JwVVY0RXla?=
 =?utf-8?B?Mi9FN1ZKL2YrWXQyQitVemlGMlphTDNnVUNoT29kaXVmc1F4a0lHbnB1Rzlv?=
 =?utf-8?B?VGEwNWtYQ3BZWURudlFncjU2SG9SS3NrdmVkMjFiR2lrSXlSSjN6RGFsbEVy?=
 =?utf-8?B?eElROWhpRlY2VUM1TzhBL0srQ0lUWDdLNDdOUTVxY1FuSkJzdHo4dWFiQ0N2?=
 =?utf-8?B?RTl5ZTRWdE9KdFZ2ZTI2QzNNYWRQaHpxYnlFVUNKaitCQlpFeVV1OUFDS01Y?=
 =?utf-8?B?QkJwY2U0S1d6RXh3V2NjK0dDNWZpVkM2ZFZtUVdYMFpaNUxxUFF2MEdLd1dR?=
 =?utf-8?B?emlOZ2wrWnNySEtEenQxVzAvWm83SjRyb1d0Rmh3YUY0ZlFrekdveHVGVVhI?=
 =?utf-8?B?bkdaTCtPRVhZWi9IQ2NyZWFKMzZudEtKKzZmNkJuRHd0TTZOZ2t3OGFwZXhu?=
 =?utf-8?B?bTBBSXRFWmNNcUhFYjhUd1psRklGellqN3I3aDBOMkcrUTZYdzZucHV4c2lX?=
 =?utf-8?B?aVdmUVdzOXBVU2lPY0VLQzJDQXFkY0hPNHRhT3JyU0hPY2tjbzB3eFlJbWtL?=
 =?utf-8?Q?y9ihwu/wcRM/4by6TbbeM+Wr4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dda6d687-5725-4a85-087d-08de09f917b4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 01:37:38.3776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tiTlHr+r/W7HHA0tcX23KCI5c/q38faywWLWfCoJFQwbFwM+uYpijCyj0iOpTsuE8HBPdDkQ57VQpqtx6RRAfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7077
X-Mailman-Approved-At: Tue, 14 Oct 2025 07:30:14 +0000
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Ye Li <ye.li@nxp.com>, Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Udit Kumar <u-kumar1@ti.com>, Oliver Gaskell <Oliver.Gaskell@analog.com>,
 Andrew Davis <afd@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
 Judith Mendez <jm@ti.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Ryan Eatmon <reatmon@ti.com>, Hari Nagalla <hnagalla@ti.com>
Subject: [Uboot-stm32] [PATCH 06/11] arm: dts: imx8m: Add remoteproc node
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

Add CM7/4 nodes for i.MX8MQ/M/N/P.

Reviewed-by: Ye Li <ye.li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm/dts/imx8mm-u-boot.dtsi | 4 ++++
 arch/arm/dts/imx8mn-u-boot.dtsi | 4 ++++
 arch/arm/dts/imx8mp-u-boot.dtsi | 4 ++++
 arch/arm/dts/imx8mq-u-boot.dtsi | 4 ++++
 4 files changed, 16 insertions(+)

diff --git a/arch/arm/dts/imx8mm-u-boot.dtsi b/arch/arm/dts/imx8mm-u-boot.dtsi
index eb5b95a1fda7c37f8911bf1732d20ee9ede4c198..d891e8062fe557d6855f07078918b56e23e4c053 100644
--- a/arch/arm/dts/imx8mm-u-boot.dtsi
+++ b/arch/arm/dts/imx8mm-u-boot.dtsi
@@ -15,6 +15,10 @@
 		};
 	};
 #endif
+	imx8mm-cm4 {
+		compatible = "fsl,imx8mm-cm4";
+		syscon = <&src>;
+	};
 };
 
 #ifdef CONFIG_FSL_CAAM
diff --git a/arch/arm/dts/imx8mn-u-boot.dtsi b/arch/arm/dts/imx8mn-u-boot.dtsi
index 4a4498b36b012eb7aa22a3feeb043013068e961f..29eecd6d70d9f6c9fef48cda9fb560841ebd4aa0 100644
--- a/arch/arm/dts/imx8mn-u-boot.dtsi
+++ b/arch/arm/dts/imx8mn-u-boot.dtsi
@@ -16,6 +16,10 @@
 	};
 #endif
 
+	imx8mn-cm7 {
+		compatible = "fsl,imx8mn-cm7";
+	};
+
 	wdt-reboot {
 		compatible = "wdt-reboot";
 		wdt = <&wdog1>;
diff --git a/arch/arm/dts/imx8mp-u-boot.dtsi b/arch/arm/dts/imx8mp-u-boot.dtsi
index 9ede98a11e42f6279d654443bbb2d7059ad53d81..d9d220c70db600a7be1d021a0c4e8927a2f2b17f 100644
--- a/arch/arm/dts/imx8mp-u-boot.dtsi
+++ b/arch/arm/dts/imx8mp-u-boot.dtsi
@@ -16,6 +16,10 @@
 		};
 	};
 #endif
+
+	imx8mp-cm7 {
+		compatible = "fsl,imx8mp-cm7";
+	};
 };
 
 #ifdef CONFIG_FSL_CAAM
diff --git a/arch/arm/dts/imx8mq-u-boot.dtsi b/arch/arm/dts/imx8mq-u-boot.dtsi
index 93e2ef27f7ced9b3a471e1dc41be4b1861ed0b81..0687fcdbd68b210aa9cfb89e87713e9a5aff0754 100644
--- a/arch/arm/dts/imx8mq-u-boot.dtsi
+++ b/arch/arm/dts/imx8mq-u-boot.dtsi
@@ -7,6 +7,10 @@
 	binman: binman {
 	};
 
+	imx8mq-cm4 {
+		compatible = "fsl,imx8mq-cm4";
+		syscon = <&src>;
+	};
 };
 
 &soc {

-- 
2.35.3

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
