Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F41BDC228
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Oct 2025 04:18:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A3CDC56615;
	Wed, 15 Oct 2025 02:18:34 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011048.outbound.protection.outlook.com [52.101.65.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A43BCC56613
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 02:18:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lCZo9DyL3J6EuybNaIxrBmktQn1MqN7mK/KQgggRXxY+hfzAl+D+s5s9Q9ehwNBMs3aQTvQkGGRHlmtzn0cZjylyTNotbp8ysKUQkiRlb0KJ7E7UoL9XY6GUxVcXzQZXW4mRFm37k0GPtYebaJAqIrXkQKVINwsOD2w0+aHURYFL3BVR4ihp+A0G7Bd1cI9M43vTyMI7O/etVHh9WTLGfSNSwhcpCH4BL4a1cqjZHTC1fnUn1qkJqSxyaoXdNDPWumZtoHCytzjpTmCFrRk4mOM4QggY50XW9LZ9o88urBQU4JSEgnkK+44b6hbwbmZg6+b5oXyshFpUVTiAM/cSJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vFvXMt3qTWxkXx08MWpEshdPL/PuxGGyjawqTw292cY=;
 b=X3VkuMGaJyNy5euGP1nJhpsrpveMqyAPir/nMLg9Q3eiF8yiJxj8bbYaVVltwK0A2hJBVfS6Y+17OQ3S4JxZtaxgeVuVhPF6ZBcdEedADnxzw5AH6MZsx6ZXYDrfWsVfGtNFXWOaz0qz5GMmfbI42Qtqw/uKdDqJCSRFEPjrpSbdAVLju/zbtxeBd7/I7qxrIO7QhMMnRToDSIxbco9gnY5Xu+TYjYqQoQumzzjiFDukVh2C6pOrp/qFXxbdqonqqUIdnrSm6kHnpWEDK6GY2PClZWSZ8BcNnc3DKm2jWghtLtOH0tgS6uCnmmlUGRJJFBue5IBdr3CohCTn5D+nNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vFvXMt3qTWxkXx08MWpEshdPL/PuxGGyjawqTw292cY=;
 b=FCvidosNdc7Y0Hty2+5HAG94TGiUJLi2Gdrk2K+0MAKE/Zuzpf6GMoJnl4S/etOljGnoJHc5aBRBsYiiApvaVkiTam2hxFV4DywDPyBLqmUBuZNv8DFnJ1dGGNdqtS3fmSuFnPn7bRq5vhI7GM9MuPqg8wULFiKKCBRrMGNoKHye7D9O9wN3y9P6xnHq+Pnyf8g5uA+wJpgLZXsMZvFx3dz2SsfryTuA9AYQeIArEWb+9lOuijrfb51EYMsqCaZeQseRnLjD5Xgrf6jD5rdjzltS7aRwgABsfrSfegu5oFNPd6hY1zX+AF3dv0hVZYiPXdo5FSTJfvbC8gJoZUkwhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU0PR04MB9444.eurprd04.prod.outlook.com (2603:10a6:10:35c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Wed, 15 Oct
 2025 02:18:31 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9228.010; Wed, 15 Oct 2025
 02:18:31 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 15 Oct 2025 11:30:29 +0800
Message-Id: <20251015-imx-rproc-v2-4-26c6b3d16c35@nxp.com>
References: <20251015-imx-rproc-v2-0-26c6b3d16c35@nxp.com>
In-Reply-To: <20251015-imx-rproc-v2-0-26c6b3d16c35@nxp.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com, 
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, 
 Fabio Estevam <festevam@gmail.com>, Stefano Babic <sbabic@nabladev.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2P153CA0033.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::21) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU0PR04MB9444:EE_
X-MS-Office365-Filtering-Correlation-Id: 652c8149-6685-49ab-73a9-08de0b9122cd
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|52116014|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T2FDR0RTYXZqUFowOGZkckl4SXFjTENRVUhYaFhELzRZeDJnRWM2eVJyUk5x?=
 =?utf-8?B?L3cvK2c3a296ckJ4eExRMFh3N0VYYnUzTy9pNlFjOFdIdmpwbXg0Wjlpc2hF?=
 =?utf-8?B?cmNZSk1NL0J0M2hwYVgyK0l5UGI5V3J5UXJZSklNeTRmditqTnViSkFrQmJh?=
 =?utf-8?B?WGhBd1crY3FVbGFKNTNuQ2gzbDM2aHM0Wmk4N25hb3FzRTFYd1FNUWZRdWl0?=
 =?utf-8?B?RjUvU1A3ME45TEl2ZkJsM3hqM2tVak81VFJEQi9wdkswSkNhdVpWeUtLeThO?=
 =?utf-8?B?QmQrOUo4eHE5KzFIQjAyRXUvQW1lZnJidnRJUXUvQ09SYWNwRUtFWG5DaU1r?=
 =?utf-8?B?a3BVYld0VzM2YkRjeE9KbEJKcW1KQmxWaGZpZThDT2pEQllXbDJTUjdsNjB4?=
 =?utf-8?B?TkdaNlhQdlhvUS81YUw1T1FGSUFoNEJodURNYlo1Zk9aY3hrdHFyVFNaY25Y?=
 =?utf-8?B?SXZEWmZ4aXFISVZCelZHZ3k4VjF3MmNnc0FwUDlVRkxWQ0hkVTBkNm9KNG9J?=
 =?utf-8?B?ZUdMRzk0ajRTM2VCZW5pMXhnS2p1bzZoWU56TXEybDhiZWpVUWE1NXQ0SVVr?=
 =?utf-8?B?WjdvVi9IL3BUa0x1ZGl6VXhKamE4ODZzQWxkNWgyeFRKNk9lT3haa0NhdXdt?=
 =?utf-8?B?NUw0VlZyTTljYnlFdVl1Q0lzWERCZFgzYlZvNUV3aE51SEpoMVlTWldHVjBC?=
 =?utf-8?B?Z2pRQnZ6NTBxYnRnZk55THJqZGpTUFV5Y2JCdVlhSHFjazRtbEhtZDNaZVZ0?=
 =?utf-8?B?a1NJci9GVXBSZGVQNXI2WHJ0ZjI4cWZkd2lsa1V1SjdmUStqY1gzTjgvck1U?=
 =?utf-8?B?Z3RGMXZUMVZSZ2NxaVB6UG90TUo4dUcwY3E3b0EwR0tqQmZWcTdOMTk1QlpG?=
 =?utf-8?B?NEdySGdZamZIVW9QVHo3NllNcWNhaWl0SndmRXZBUUoySmgzNTlZNVY2UGg4?=
 =?utf-8?B?TG9wOE45TFNlRStEdUlWakl3SU92Lythc084eDg5Q2ZqSXJjL2dDbDdIak5K?=
 =?utf-8?B?SnU5SFY5Mzd6T2U2WGN2SXIwYng5YVNOeVJzSHBLRXRaRDVWQ3JFczlPVzhX?=
 =?utf-8?B?Vm85NG5xY1RQdGtzYzBKTXFCc1N3bHhkNFNORlBMRi9URDRlOWNUenVsZWVk?=
 =?utf-8?B?bno0WnZGdDIzZlZld1lJcE9ZVUFTQ254dXpBVVJKQVM5M0lKT1dkQktjaloz?=
 =?utf-8?B?TjR5OVVBeHZNSXh3Kzl0bHo5OGZGY3MreFM0VkhNKzY0TWgxUEdvTnRwWW8z?=
 =?utf-8?B?akZQREdRcFpNbEpLK2pSck5WL1lLYkhaZnVPRDZwbkhobnMvWWVnV0QwTnE3?=
 =?utf-8?B?SVhmMDYwbzVVQ0NlOWJaRnFGUHk2Z3VZUXlGY3JPVzB1SXJlQTRBcUFQNXhi?=
 =?utf-8?B?b1ZoZGRCQ2IrZ3pmSEY3MkVZMEQzbzBVSDlaM1lzTGJiZGFWRnZDN0xpUFQ2?=
 =?utf-8?B?V25QYnRVaGx1TTZiRWVWWFNFOVVvOVlXcnF2L2RmUENCMmxQc1NvSC8rNjdH?=
 =?utf-8?B?UEE1Q1B3dDU4TlFMUTJ3eHlpazRPUVZ6aUhqZFBiM3MrUUpJQVdJMGlWYllR?=
 =?utf-8?B?c0ovdUlxQmdpM29FN2tYT29LZzhvTWpmdWVpTCt5d2xVdUFQRVhPNzJPRWlH?=
 =?utf-8?B?ZnljeHptdWtQVlowcVFPV0tDVzJaMVZvTkU0b1BKUUdyVGVySXo3Z1JRelhT?=
 =?utf-8?B?bGtnYjQyQVVodmdvYk1FL2dJUUhIaGJubVI5aUhLS1dFWUs5bzNGR0xlT0Er?=
 =?utf-8?B?c0s0WVJsSXd2OVMxSmt3blFPcVQrU20xdDBsNTJ2eVZKenVVU29hUXFWUUpO?=
 =?utf-8?B?NUs1ZjhRTFVoazhWL0hTQitmN0JUeEI5QXVJSlYycVJnOXllUW5aVGcxU0ho?=
 =?utf-8?B?aC9ibmNxQzhaS3NCMDlGNmhNUmRtNVVaWjk3NFFHVXV2OEpEL2J1RVMvWDdi?=
 =?utf-8?B?MW9wM2VFNDZqYWJBUDVDa0ExVERLSXBoeDZOZms2TWtGUlQyd1p0MkM4bG9v?=
 =?utf-8?B?emFnRWloNy92NW9hbmFTQjBmY0NxREdGN05Sdm5RcUZ1TmZQcnBmcldDZ2R6?=
 =?utf-8?Q?hAtW13?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(19092799006)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGZlU0hkdUYzMmJ1KzVxand5OTFLazhyY3JnT01ZRkJqekVJMzhmd3lWNi91?=
 =?utf-8?B?NnhKaWxpam93dWZjWjVsTjkyc1hJMzFZd3BJbXQ1cFg1bnQrMXlXR2dQbTFz?=
 =?utf-8?B?c3NwenBVMTFqM1A2K3ZqN2NneWdQem9oVzBWZWh4L2ZISGxidkR5dmhBcXdn?=
 =?utf-8?B?a2xqTDI3Y3NJOFdiSDdscVVvdmNGUlR6eGNnVmpwSGg2MFdPZ1VjaVBETlJW?=
 =?utf-8?B?Q0p0N256bllxT0oraUpVanNiV3hSZi9GcVRWdm5CZ3ljYktEMllaOVYrRWlJ?=
 =?utf-8?B?YzFSZ0oyd2wyOHhLMTcxZTJ5T24vTHAyUlA4TTRHNjJGV0dMdW1oTzdBUkRO?=
 =?utf-8?B?anZsOWo1dUZVaThianJ3R3hEZTBpVlUzQXlDWVNwVW1UQWJoMU03bThxQldz?=
 =?utf-8?B?U0tlNUhXSGVNNWNvTTA3RGFtNUVMYjVmU1dESFRmYXJXODNQUjRTK3kvTzdv?=
 =?utf-8?B?N3FIZFVPOEFNOC8vRHVsS0lEVldlS3ZVZ0Jpc2k3MzVOWVFJL0xpTUZCUHZ4?=
 =?utf-8?B?dDBDSlVCVlBJWTgwOFc4eTMvYk1wQSt2dVFsK1ZZQi94ejNBYlJlNk5neEtu?=
 =?utf-8?B?NFNvNDQ5WHFFWFBjNXdhVHAreSs5NXNTU0R4SFNhbmpac2NCY3NiZWhWQU9m?=
 =?utf-8?B?b2d3emUxVTFyTHhuM1pvS2MzVTBBK29mejF4VEo4NFhaWjh2Q1hPYzVMRFYx?=
 =?utf-8?B?Y1dETlJLYWdWSTI0bEI5TTcwWmlyN3YrYzZZNW15OWV4Skt4MzROaEgycGxH?=
 =?utf-8?B?UHVKKzNteEZJN21lbWQzSS9YbzBQVmxqS21FYWdtRUhPSEpxcXhWd2hVaDY2?=
 =?utf-8?B?cWFWeGVTRVphWUtiUGtDZkFqWXN5aHZxN1JoQ1JiSER2L1FoMEVmWFN1dCs4?=
 =?utf-8?B?OVM5d0xaL2ZnZzZQWkl4d1dyZFhUd1NpN3Vob1ovNzdWbDhySlpRY2ZTNkFZ?=
 =?utf-8?B?VUlWdlQvQlI0NHZFd3NBd0Y1ZFNhS0pBSitYZ0NNNldKTFdDQlE2Y3U5cnBs?=
 =?utf-8?B?R1VtcmxCQlZaK3BML2czUDM5cmVGWUZhdk9hTW5wWUNUeldjRnpoc3BCQkd3?=
 =?utf-8?B?eEFsUDBYczB6cXJsalNaMUg2akZObzBya1RXSEVycnZVQnlZa05nTSt3Qkt0?=
 =?utf-8?B?cXJKei91emFYUHpxU29OMTBTRFdRS0owZy9JZzV2T1FXUWx5ZnBhMUpHM1BQ?=
 =?utf-8?B?NmtHb0JGNmZLV04ycmRpVTJiNGF1UWp0VkFmNnJlcjFIM3VtNWlOVWRVajZ6?=
 =?utf-8?B?MGpFOC8wUkhzb1EvalhabGgvZW9qbjJuTlYxdnZQSStORmpLcG0vbTdRbmRt?=
 =?utf-8?B?WmI5R0FIMlFOV2k5WG9CSk9TRGROeEJXelFRWXVTVE5wZ2N1enpuNi9wOUtE?=
 =?utf-8?B?R1YzMUpDTjdpS1JkSmUrM1hlM2xQbDcrTG55T1E4OFltQTVkazNnTHF4Z3Aw?=
 =?utf-8?B?dzV5SjdFQ05ZY0ZsdHM1ZnpGcU1aYVR3bmcyYmtFeEdEQzhZVjNJNTNnNlNI?=
 =?utf-8?B?ZDJDOVA5WFh3QXUwV0lFeDFySzI4emJIZEx1N3hjajdnVkNid01NK0xkd2R4?=
 =?utf-8?B?ZVlTOXZTRlVQNzB6OWc5Z1ZZRHBKWWJzL3RUajhnT2M1eDhERWkreEtrQUxl?=
 =?utf-8?B?dTk2aVl5eWpEd1RwRy91TmZjN2UvajBmbmtuaTJISmY2VDFsQWZxQUViNXB5?=
 =?utf-8?B?OTdnSUxnTnRZRVhONWR2OTNzbWlDejNTNlMvY2FZczB1ZHBVdkpHTlNHUVQ4?=
 =?utf-8?B?b25wWVV4bE9QdnFBTFJzblRhNm5pSHl2ZnoyaStGUm5NR1dybE9yQkNJQ2x1?=
 =?utf-8?B?N3ltczM3c2syTmRNNm5CbFhwenBnWURQaE5YODI1NUVPWnlSWVJKWFNnNnBk?=
 =?utf-8?B?c1g2T1VNT0x2UlFzci8rWkZmRUNzcUtoU09mVXFzWUxab3FGMXI3NmdjZEtG?=
 =?utf-8?B?SUt4NnZQeDNXcmJ1dVZ5M3A1NnhycmRET25NOGxNejNVUUNyMmRhVUYwV3Vk?=
 =?utf-8?B?V0FidnJNeWoydDgvR1E2U1d2K1hmdFVPa0tXdVVmLzFka0ZaR1ZZWm13UjhL?=
 =?utf-8?B?dVorOG0ra21SYlg0cFJOUGNUVUpDVUpCRlZKaWZVcCs2azNsQkplTjg5UzdD?=
 =?utf-8?Q?rH43AqQLI0OrXP309vIrOAiyi?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 652c8149-6685-49ab-73a9-08de0b9122cd
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 02:18:31.6709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GRI2EsPNyDZ1oeFE/vvM0BYdkVyU4VoxX1ippjWrWxoN1lgdkPof8d4Y+49D7byC+IyqNzLuavfU4Dh5xmS2GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9444
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Ye Li <ye.li@nxp.com>, Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Udit Kumar <u-kumar1@ti.com>, Oliver Gaskell <Oliver.Gaskell@analog.com>,
 Andrew Davis <afd@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
 Judith Mendez <jm@ti.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Ryan Eatmon <reatmon@ti.com>, Hari Nagalla <hnagalla@ti.com>
Subject: [Uboot-stm32] [PATCH v2 04/10] remoteproc: imx_rproc: Add support
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

From: Peng Fan <peng.fan@nxp.com>

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
2.35.3

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
