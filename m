Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B29BF9868
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Oct 2025 02:49:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E65BC5E2C3;
	Wed, 22 Oct 2025 00:49:42 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010066.outbound.protection.outlook.com [52.101.84.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2C99C5E2C1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Oct 2025 00:49:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dJ0oZQimA6fh58ImLjczyrRnaISxSGTU+2Yhm0DtyWrLEg22ACthBTcGwEMcuQp/Qf7peqtap+KoU8VCe2tBDaklPgago8by9PlAjRFVxDn/rZjoiF7lzWZBeSepp3aJKbOA1mpE/jCtGZY+4DNqR6fAdW8g/FfrdcbDhGLI9e6zYpSnibeRzdlIh2iGzFWedbv6uWCM87bS4q7JlqMLCF6fbwhQRJcojbmuMKwH5xMpv09zYD7eWL29K1m87XZ3HUhfcGZ29w7FwS2Ombv9+ZZUC2eYIdx1QJlzQOsMmDJv6jqqFTKoOCF7xpfEiZw9ymWqLJFXAQMNY2a0qq8wIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7uPdOe50ITVAjg8Cwowb3m/TU0u1cxVNb8Pe4TNteVc=;
 b=XvPhDexqLEo3KLQW49XeQUz9wivdWzPqMN4vZTrIqYVeSoGLyIXEMNbZxkDeDg1qMg7VgUF/3N9D2FV69bBb8FK5U7bRfOgtzcIdF2Wuz5R1XoFAubPkddAr+x8h9buqTbDaiWhuQQFWlMvpS6VxMmC1bS1h31QBXOr7Xw4LtjfOXwe9x2gKCTFVH/XjTTosiN8gIik3XnrY03HaUIt+HKEjtEGjULaPitetOSXss3hdJkSiLOUnp7cECnFdAgdNqePQl+k3FP8vdETPWcfYZAk5v0rP/I+vGEmk2g3xfnH2XAWTltc3J9KnGiD84gE+HDZX6IxedYliwAbUWYqimw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7uPdOe50ITVAjg8Cwowb3m/TU0u1cxVNb8Pe4TNteVc=;
 b=TEFIygzEe5mpa3FRzA1sSdPrQqx0DhHIjSU1n7nPvA0YWIefio86kA7lRKr9brykmsDq0qhR74U32NHBosGOlbmnRZpLGmSL+yDU2b4uxFzk9XPfE0xW91wxreISQBWTH309cxEmsLSKFhjHjAcyus3DqB8EJC/VI6VO6eZ5w3pv8XgtQzK3oN6tnFgrx6DQHS2bUF1MhUx799yc7n5663Xy3AskN8+3dc8/qn3ZHYQAtyAzHcitBORrUCn6wZxszwlRXHCrQswIeKKdgRiAKKuqjlG5CyxJZWk/VNr64mhlIIRfMMePufUB+qgGcxSId2T4yt9ubW1HSG8DkB1i0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Wed, 22 Oct
 2025 00:49:39 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9228.016; Wed, 22 Oct 2025
 00:49:39 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Wed, 22 Oct 2025 08:48:35 +0800
Message-Id: <20251022-imx-rproc-v3-v3-9-92273a82c5da@nxp.com>
References: <20251022-imx-rproc-v3-v3-0-92273a82c5da@nxp.com>
In-Reply-To: <20251022-imx-rproc-v3-v3-0-92273a82c5da@nxp.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com, 
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, 
 Stefano Babic <sbabic@nabladev.com>, Fabio Estevam <festevam@gmail.com>, 
 Tom Rini <trini@konsulko.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761094123; l=762;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=u4mrKl8QAViYss0mU1iA60Nq9w38UecOIZ3xN5uEEKs=;
 b=JE/2tWGVVWfUGwAmHD++04tePDg9Ex45zJ/gagamUXZu7WAUfy0YePlb1S2pwtMcPiASz80qP
 TzkviXyT39uDgbpwz14K/yU+DQJF9P1IrIMKZWT6zUewBWs5h9beoku
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR02CA0075.apcprd02.prod.outlook.com
 (2603:1096:4:90::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM0PR04MB6900:EE_
X-MS-Office365-Filtering-Correlation-Id: 61f96a45-2dd7-4296-43c2-08de1104e181
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|19092799006|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TU1sZGMxekFMQnJVeGt4djNZaDJQeEdKdiszL2hxT25vYys2QVJkRDhreVhz?=
 =?utf-8?B?Ty83VFFMTHFpdXB1ZWorVGlPSGFGUzZvaXlhUlVFSWhtSU0xWlQzMHZKZWpa?=
 =?utf-8?B?UlNtQmJCeU9pdXFycktWRnlwSTlSajN0Y2ErRDlOSGQ4WmZzT2JFSjczNkdJ?=
 =?utf-8?B?eW9xMmpDUFBkRmRXV0h6N0ZTUHo2Tkk2MUZndkliTDVNWFpsWkVjVVJkemdY?=
 =?utf-8?B?bzl6UzFQYVZJQTJMekpJemVxWVo3UnZHNWRSUXN2ejRlaHRVSG9IMmFWWVdt?=
 =?utf-8?B?RlhVZEJNNlVLUzJRL2RQTUNYd0FRNXcyZmtsZC90azRMS2dDTFk1RFdBVDBt?=
 =?utf-8?B?LzJTZGRCK0VwcW53UnZpZ3VWb0txanJyMTFDS25PTzhxRHp6SVk4c0JnWitt?=
 =?utf-8?B?a25ZWm90ck10VDZ3K1BybW1ocXlzdThqWUlZbjdpWHVhYTlSRXJjRmFxWUJr?=
 =?utf-8?B?YXNtcUNvZkFNbjdRMjNOejZBSDh0SmoxSFlMMGhyUmZFWjNKOWhkMVZBQnFn?=
 =?utf-8?B?YkorTlVrTmVEMVVoQWNYV2VaV1gzaGdRWnE1czN3K2dvTFh3amVsUHBqSXNH?=
 =?utf-8?B?Z2ZRTHExQlNiQks3RXJySnFrMnQvSzVpSEV4eFZ3dS9KWExkTW9ia1E0Wklx?=
 =?utf-8?B?MDFLQmZOQnQxTVZFb0hSSThXQkczbncyOVMyMGFtUHcxVHUwM0h5V1Z2VVd2?=
 =?utf-8?B?bEQ0YlhBVGl0UG53NlVPakt5RXF5WlNZaGRIcVJhNlA4NVBIR3huZmNSbmlX?=
 =?utf-8?B?VWR2a0NsSE1LVlpDYk5mNitNOHZwTHBXMFltR1FNcU9RUGp2akd3c1FPbDR6?=
 =?utf-8?B?cGFZWml2aU1qYURvK3ZKS254RWpPQVZmN1lwbXFCMVExSzJPUTZtZjNOR0My?=
 =?utf-8?B?dGc1TjYzZ3Rma3lLOUVyS2d0QTR3UkN3Ti9wYStyd2U4WTdrcERHd0ppUzU0?=
 =?utf-8?B?MkVBckthckZLVXkzNFBzN1FoUS9ydWJ6TnI0bnFkRS9SOW8xbWZ6YjRRMVI4?=
 =?utf-8?B?aCtlcHJxYzE1R01ZYTV0NmdaT1JwRGNLejdHZ3lyUDdmM3h5UVRWU2Y0VE93?=
 =?utf-8?B?U0hHa0pZbG9RenNxazM4eUE1YVBzNVBoVGZjQWhBMFlySFRBQnExbDkxWlRx?=
 =?utf-8?B?azVmT3V0Z2pibVl4VFc2WXFGYkVEZXZFREVaTzA5V2c2VmNReWJmb3JEeFBx?=
 =?utf-8?B?UURwc2o4ZktYZHNSUGFVSFZFWHFGbWJRSFZwOG90QlRWdHFMU3FTaDhoSml0?=
 =?utf-8?B?T3owbkNBRlZyVmJ2UGw5a29vNDFYR1ZXMjhQTUVsaTl3N3BqN2NTZC9iNzlU?=
 =?utf-8?B?MXVqSS9nb2VsZEIwemZ0bkEyYlJ5NDdSWGN0eDJ1UE1zUm91UlhnZklDZm9n?=
 =?utf-8?B?M2Y3czhvNVdwTGQxcTd3SlkyNkJWYUgwcG9vSGxXQ1ZlVTBlQVNndGdCVmVO?=
 =?utf-8?B?WDV4R3FMaWRmUk90M2tQS3ZoL3hWazdMamJYNk5Tczd4QlR2dnFjWnIzSDNY?=
 =?utf-8?B?dmxUQU5JcWI4dGp4WjRUZGhmU09Gd0hDbHI0ZjUzaXk1NGczeGFlcGt4MVJv?=
 =?utf-8?B?T21KQTFFemtsc0ptcWlSNlptT0ZwUmlGRDdWS1dpekM5dFg2NnFiakV6a3RG?=
 =?utf-8?B?R0pjdXdaQjFVT08xQkZsMTlSWDhxYlVsYitxUjQyazZiZ3BGR2dBUEZTMXF2?=
 =?utf-8?B?TEFUN1dXRlEwQ3NQak1wMWRucVozb2t5dXNmTk5OQWcrU2cydzhmY25RNVo0?=
 =?utf-8?B?Z2NVWjdFRGxZbFloWmNzQ3M1dVYzOWNNNWNxTXJ0cW9Cek1LRmJhczlFdzlS?=
 =?utf-8?B?WFI3MC9WVlEyaVJkVXpqTmNudWVkZ2tuSWdWdGp6cU9MSHM0aXFzOVpETlVS?=
 =?utf-8?B?RnRZVUtaS2hyblNkN3htSjM5aWVoT2lMRFlXOG5rNkU5bEphRHhDc0NLQ2lx?=
 =?utf-8?B?MU1heUpGK1phQU5TME4wYklvdWoxQ3hvazFwWmZBa1BxeHk2TGYwai9tNE5H?=
 =?utf-8?B?NkxEbzdYS3R4OGVhSklzNGdlaytpOGdnME9iYTdhMk1rM3NHeW5qTmV1MHA5?=
 =?utf-8?Q?IbYu+Q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(7416014)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXFlUG13eEhBSFBYTW1CSDRwV1FTUC9KY1RibDJadnlzZzUxL0pvZnVUQ3dp?=
 =?utf-8?B?MEFscGF1TmY0TVBNY3RKWEpDT0dVczBzcmw0c1JRS3NlU0ZSRHZLNm9vc3pZ?=
 =?utf-8?B?MG9aNHVFTFhSTFZCUzI0OHNkMFdLTXlycWl1d09HWDZJMW82NFA0RWJ3aW8r?=
 =?utf-8?B?U2VWYVpRWTVURlQ5TFgwWkFWL3RGRlQ1WllTbVR6M3M1cHRRemtwTzJCemVL?=
 =?utf-8?B?c0VtUFBVbStaUlVzd3RmREJhQStlb3orZFhnL05YbUFXZElWVnNmNDB2c1l5?=
 =?utf-8?B?M3loNmdLOWZyRVBmWnIwRWhjbmRwRUJKdUFYTjN1L2ltMTRHNm84Z0dSR0dV?=
 =?utf-8?B?Z3Z2UWVtKzhuRzlyaGhQZUpmbDJzT2FVTUl0Z2ZmcjlFb29Edmk2NUptUDgy?=
 =?utf-8?B?VU9aY0g2TDRDQXNMQ2ZoSDI2elBVeUlhWFZjaG9zZVlWTzRkdEMzY1JNNW04?=
 =?utf-8?B?MEpRMENqSm1Vem13M0dkZjZNZ3NzUHRmRnFvQ1lvd1NsUUE4TnplZkFBbEZ0?=
 =?utf-8?B?WmcwQnpzMEZBOGVjZWJYc0wxakk5YmZMOGpxaGFQSjFUdEN3TVNXSTFJaExG?=
 =?utf-8?B?dXFzTDh6aUpObTNBUmR4VGFFRFF6ZldaTWtLd055WG52YUo3YzhGWHNPQ3Mr?=
 =?utf-8?B?YlhrbzhHUlZZVkUwa3FuZlJPSWFUNmlvZ29DOWd6a2dtWE1tMDBVQ0V0OEVw?=
 =?utf-8?B?cUJPZmMvS2xxVTJkd0xjWkJ3M1lubzA4OG1sNmtUdEt4aWFhU3RrQVFrSDJG?=
 =?utf-8?B?dmxUV2h2OFhQZnVsT1JRbHZsVmhydy9oa1lEMGRqUzJMK3JiVXFoTnloMVh6?=
 =?utf-8?B?dW5aalQ2bW5ra2x3T25iQnlBSnFrbVRiV0VPRDFYT2VLVk9EQVBOUk16MG15?=
 =?utf-8?B?OVkyd256bGg4elFRMjB5elVzeVJ1Znd3RzFNSFdZTDQ0cm5ubTR5VmxYbkhm?=
 =?utf-8?B?aHE2emt5WC91STZaRDRjWW42aTE2TkRpQVBCdzhHOXpPUmlDODlsMUFCU3My?=
 =?utf-8?B?QWtPTlFTSVJaNXMxaVVmUFp0Qy9TVE01YUxIQys0UUtNVm5vd3ZkOVNDN3o0?=
 =?utf-8?B?ZWlMVGFnSG1yN3BhOXJtM0NCZVhpOWk3OFdsOTNCREkvT2JtNXBvWGZIdXVu?=
 =?utf-8?B?RUUwNTBhcjB6clpSNHNpSGZKc1hoVTRaY1h6aDhDNG92bjhrQVlQdmtkOGo5?=
 =?utf-8?B?S0RMNWxSTjJueXorZ0ZFb0FmOHZnYVZIQ1I3ZFdudnFCTVNIQW5VMU9RZDF2?=
 =?utf-8?B?STVMdW4xZFFjRjlKbm5jdnhreFhmalRON0lwS0RaUEIwVWpGdHhabG10UGkx?=
 =?utf-8?B?d05YQUNxbmFiRnYvZHQ2cTBWbjdMd2ZFOE5FbmVhQS9EamtPZ1ZQd2NEbW02?=
 =?utf-8?B?N1JNRzRoSm1FM2FLZi9NRFZ4cHpEbkRqVnFqOFRTd2xuV0VKNnZFWld2ZkM2?=
 =?utf-8?B?OWFoYXpyZW5IVG0wZVZqdWY4VXN2TVF6S2UxVGdWRWkzOTJFWmNHcXNGOHQv?=
 =?utf-8?B?V0VURG9pelBGOHJFSU9FQVIxRUdWb21rcVpRMHRyT3FKZUVRMXJIb0h1ZzBp?=
 =?utf-8?B?Q2FkdENPSFlXQllCQi8xdjFielVmNTdwTE9JS1JiYVg4aDEwOUNDV0llbUJl?=
 =?utf-8?B?N3ZZNmx0SVBBZmFnamkzb1ZoVnF0YmdMUCs3amZCVzhLekdJV2pVZFpiRmlJ?=
 =?utf-8?B?TFJ1SzFzcVlOeHJaMVBCR2RPRVdSMysxVW0ydUdkUDVONkZTLzV0SG1HeGJK?=
 =?utf-8?B?SFlYelV3dWMwK3dvUUpzVXpQbXVBWW8zK1VuTlprUWx2cnZHRHlmL3REbkR4?=
 =?utf-8?B?TEdsVW5BaHMzbUNPQ3liK2VrSW9HWUlRZkpuTWlJdm1ZUjN6TnljbmJPa1FN?=
 =?utf-8?B?eG8yNnAydW8vclljcGp5NmNUdTkzUnZFeURkOE9TZ0JWVDhtVEllc2JkV241?=
 =?utf-8?B?OWZYSkYraW9EbUNQRGV4QmNwSHU2WFIzOUNNY0NXMWhEeE1VOUlKVncrWHlk?=
 =?utf-8?B?STFjdmQ0bVpHa2xsdjh4UFFrL2ZYUTczNEtmRTloQ3U4alA4ZlJ3V05RZEZs?=
 =?utf-8?B?L0RDVFpCdkorMGV2aGQySnd4QnlZRnpwSGJ5VG14Tkk5YTQ5UUk0dGJNZVVz?=
 =?utf-8?Q?8tiNsa04YEWE9TQpEKkIHm2Hk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61f96a45-2dd7-4296-43c2-08de1104e181
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 00:49:39.6736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HWvvJu1E5fagVc9Jcll6GtGPvW/mf9woe5Wr4RsRBAN35NwyVr62GsfHyVuFE6mbhT3Fz3HjAoHwi9nZUGKTnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6900
Cc: Peng Fan <peng.fan@nxp.com>, Ye Li <ye.li@nxp.com>,
 Udit Kumar <u-kumar1@ti.com>, Alice Guo <alice.guo@nxp.com>,
 Andrew Davis <afd@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
 Judith Mendez <jm@ti.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Ryan Eatmon <reatmon@ti.com>, Hari Nagalla <hnagalla@ti.com>
Subject: [Uboot-stm32] [PATCH v3 09/12] imx8mq: Enable remoteproc for
	i.MX8MQ EVK
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
2.37.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
