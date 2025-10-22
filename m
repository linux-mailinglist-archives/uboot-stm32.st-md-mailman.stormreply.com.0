Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 229A4BF9859
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Oct 2025 02:49:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA1E8C5E2C3;
	Wed, 22 Oct 2025 00:49:17 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012039.outbound.protection.outlook.com [52.101.66.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 526C7C5E2C1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Oct 2025 00:49:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U8wGH8/GCMptx23tuL5TYrI7u67A5lhu9Jkai3haGPqQQDbumDWR1glO2rX3zxYsFWS+YIRpRv05M8FhnG74YkrA0gNsGjrftVCkDnfxm6uZwOzlCOmb8wNxLRrDbBgkynIJT12bSG0f+vmPaR2myeW3Qpe7Kwgt6LsQJaxBEG8wct1vFM+eWLi0zr39HDKLjj+3nSSyP4bCFOaXv3mvCqAq6RR4Kg48wWsBCvhCrbbGbgF+m8kRdHnbc0l9E0FOkwPYXyg9bOUy3jk7A6N/xc/+lOaPii/4OMY8xkQhtzsPIULOhl1zjh3LNfSnpLkF8CoiRneXeDhKRf7xbSVGsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HEwIXQLUbTS6xvoCa/ce47qmmav5mXtLd6Z5JMod+l8=;
 b=nYDh7zlMsHkYS5788UMq/rFtfWQtPVSHVclQvhWs/KjRiIiQg081i8IFLaSKWtsj9Er+nWaK+c00jklSIqRKbx+PNdR2sGxQRm02JC7gzBY8nVbkMyOCzsM694WVdiZs0f3gwN9ELWhrV7nP6ARuhjBwb4E0HoKxDjN1jvpyLaoPxkL4qw3OJEiTRkuET/kjUr1mNDmvN9SUGCFknfQ5Phez79vcyZBDtwHiJ5Pbzje5vxaF6XvE0gJdDw1ln19SvuGZ4kXF/EPYEzDNn07Zb5tZBwOoyCr/yQk/DKgb0D6V9JdqVBi34kKfFfQ8QTjcPquPcQW+amyD7a3OQSt8NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HEwIXQLUbTS6xvoCa/ce47qmmav5mXtLd6Z5JMod+l8=;
 b=S3AK02AGU5ycWAzfwkYL3uOqJJ6F/zWlKv4uebkbVYZ4D4SKRRtTQT+im0s5zMmz/fs4AADIgyH5/oIiAt2ZNjjDnKZ/88od0/bE7hVqDeeAlaDXlxjGGisi8F+n4L0sn9MomUre5eBZl7r5ac+z7l8g6Xr8nAMpAr8DsV4pm21TavSqoSlw0G4L3tSF6PB6ScCRNk/sIfy2lyrTqU+6OD3X+FJmm6KC75YA1dWFLm0lOSiKvcq4LtHxm+168B8d9fA6ju/oPiIDH2Uf9VVlecAxFqlaC2eHwhnEOW3bvWepuk6YfSLd/UTahWdlLTUQijhkvKoOqH5U4xH/AvXL1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Wed, 22 Oct
 2025 00:49:13 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9228.016; Wed, 22 Oct 2025
 00:49:13 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Wed, 22 Oct 2025 08:48:30 +0800
Message-Id: <20251022-imx-rproc-v3-v3-4-92273a82c5da@nxp.com>
References: <20251022-imx-rproc-v3-v3-0-92273a82c5da@nxp.com>
In-Reply-To: <20251022-imx-rproc-v3-v3-0-92273a82c5da@nxp.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com, 
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, 
 Stefano Babic <sbabic@nabladev.com>, Fabio Estevam <festevam@gmail.com>, 
 Tom Rini <trini@konsulko.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761094123; l=2398;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=M8deqCDAWPPcAYOEGwo5JrsHeroiY6Jj9TbnOowIkrg=;
 b=OS2zqQR+YLqNQ++sOX+662iMtCfblwuWJBpUskjfAjFQPk0YjT0kBiFNqY6Uhx7472HY5yIfU
 pUyBhUD6cuoC0fn7yA6aw2ioLXNdryZFtq1pQ/mhKLwZzfZdyeIT5+/
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR02CA0075.apcprd02.prod.outlook.com
 (2603:1096:4:90::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM0PR04MB6900:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c35a0f3-9622-4146-4b8f-08de1104d20f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|19092799006|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vk14N0NxRUc4KzRXbGF3OEFpS0VaODZ3NzhGaFljcjhGQUJ4VjdKb0MxSTFw?=
 =?utf-8?B?bWE1d1hHUG9YVXJXWUFBZk1ONVpTa1J6eDVZeld1N3FlQkZJSzErM1dVYlkx?=
 =?utf-8?B?KzVCZ3JFQ0x5akNYWVRCOXRMZmZhRmlDUnQ2MnpPemlvWjF0Z2U5Z1RjR3k2?=
 =?utf-8?B?NnpXUHE4SkdKc0lJTTcxQTUxRWNCb0YrSXMyajUvaW9tSTY1c2NINkN2N3hT?=
 =?utf-8?B?cm5RcWdRb3lIakY5N3Ywc0dWMGE3Ky9LWHR4Q3k3TEdXdVpBZHFzbWNhTXNw?=
 =?utf-8?B?YzZzSEdaa1JCVTlhQ29Ucmt5UU10dlhOV3pmbzkxOXZlei84VlM0UGFBRFRq?=
 =?utf-8?B?NzJUM0Jnc0hFQm81MHJkcFdWUkZKZ0N2M09oaG1ocC9JNFpvT2drL05qTnpy?=
 =?utf-8?B?VmpYRmdRWkQyRjJOeUduR2pPNGtJb0NiQVQ4aDFSZHplVkU3TkJRSlBJZlVU?=
 =?utf-8?B?RWUwUnRVK2NLV2pFcFFacS9tY2FVSFFSZWxvNE0wRm5WcVBWV2d4U1VrbW1F?=
 =?utf-8?B?TUZMQ1ZqdXovZnZsR1V5WU1GWS8yQ0ZDeWhib3VJbTNCaWdjKzVwc09QcTJ4?=
 =?utf-8?B?Zm1uZ0t0VmI2cmw4OSs3ajZFRVR1QzQrNm1VdUR0MlBoRURnUGl1a3F0K1Fw?=
 =?utf-8?B?Y1VsRk1NWmJYVEhtWHJWTmVRcWR4RkVINURnenY1ZTIvVkw4bEtDMTVmOGdQ?=
 =?utf-8?B?dzg4aXRtZDVOOU01TWxJd0pkQ2dYM2lLMEdxdjd0dzU4RDNYTHJtaGpqcm9S?=
 =?utf-8?B?LytlVFhQUFNZa2R5UFM0MmR0T01qemxEMDdReGZOS1pmNEtSY2lHVHo2ci9y?=
 =?utf-8?B?ejFmUW5kcDhXRklxSElqOFl1ZVVFSTlpWEhpbkJFaGMyNzlvL1FzUlB4Y2Y0?=
 =?utf-8?B?UXgxREhFaUFGRFJCN3lFOE5BKzVuQUd1a1BBcnJGSDFzQW4ydEU3Q3JCSGFD?=
 =?utf-8?B?VUc3Wll5VDRzeVVDL084Vm5OM0pYb2pzYnRsbERDekJxbjNWNXFpZWJIRWdv?=
 =?utf-8?B?RmVZVzdSMnBaNnIzL2JJWXlxMU1JWWxuZzZ4NUR2SjhsNGIzN1pNU0Nqdmhl?=
 =?utf-8?B?VEd4VHpVeG94V2dxMXFEeTN0WGs1T2JBMW84c1BmeXY4UzljV1BLV2ZqQXlh?=
 =?utf-8?B?c3h6UU9wTHZGcjVYcVMrbHJVUWVBV3RpaHMzUHg4R1dBZm84Lzg4ZnhNODBG?=
 =?utf-8?B?aTM5TERLV1hwcmUyTlAwZXI4dFpjWG13bnlCZlhUTDh1c2Y3SkJ3ZVIwUVB1?=
 =?utf-8?B?SUF3c0dMTGIxYmFCbStVSjR6SEVOY3R0NDNsTmd4cWhYOEtOZjlYb0tVQjhP?=
 =?utf-8?B?NEdZODlCK1VSZm1sWER0b015QlpsWWtWbnN4MGlSV0NuZEhiUFVaeWRFc1li?=
 =?utf-8?B?cmJjUUhLdmJiWEhvUnFGVFg0OUFlRUJWYjVSSGRDSllPS1k3am5LRTg4NmQ2?=
 =?utf-8?B?UDlNY2MxMDB3c3Frem9mdzZ1R0wzZUJEMk9VcGg3NFRacFkySE5mR2pWS0RJ?=
 =?utf-8?B?Q0Y1R3lOUis0SkMrZ1FxejFldDd5RDNDLzRyQjZaT3l1K3dvTlVGOWZ5Vnd2?=
 =?utf-8?B?ZGswalBQZUFPREl2NWg1UDhWY2svRVBaV0NBa21QSFRVRUQ4cFVZeE5tVHdu?=
 =?utf-8?B?aDhweThZeElYMVV0VUp0V0tIY1lkUzdUL3ZOM3N4cTRteWVvZldoWmZMU2M0?=
 =?utf-8?B?M2VEekE3QmxPYnNZTFpSaWJMRzE5cUx5ci9iNU95NGpsUHFjdDl2c25Ic29H?=
 =?utf-8?B?WTRZREthWS9sS0tzaXk2Z0NWWFlYcElmSVJHdHVma0t0SHRoZlhUSklCZldu?=
 =?utf-8?B?cEhEYk5EU3ZZazZ6b0dtTUtVR0V0bVgvRUYrYnBlK3l0WDI0eVcrNk1YZmFW?=
 =?utf-8?B?OVlua3p6cDVvWGprQS9CRTk2TW9yeEFZcm5IWkIyQjJsbmsyelpzd2xybUht?=
 =?utf-8?B?b3p2eWpoT0lndXo2RDUwS1p4clNKVWhXdythTHZzYTFqOTBkaHh5ZW5ZRlJa?=
 =?utf-8?B?TmVKcEg4OUdxTWJvTWhGNTZlQXZ2S09ieXNFU3NxZ2RxaEVGNG5CTDZTU2t2?=
 =?utf-8?Q?2Fh8xr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(7416014)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0ZVWStXczJwYnlyTFMwTkRUNjVpOUtJL0YwWVo3Ym5CUHh3ejRKQjRBdDh1?=
 =?utf-8?B?M0ZYN1YxTHR1eVNoOExINHFGOGVSUE91a2NJRVRqZE9pK3Bubm50b2JRWkZO?=
 =?utf-8?B?d09MNU52VmI2NlB5U0VvYlozZ2N5Zk5hSjA2bjZsREQvaHVJcm9vOXhQMkZM?=
 =?utf-8?B?QkFVa3JKblNQRW1Hc1RzbXd2ZVdzMmxvekVxWG5Pd2tRcXJIenozYjlVNnBi?=
 =?utf-8?B?U1lyTkRqWUowWlZBRjFrWnJxeEdqY0dMalVIcXhZeUFFQWdKZ1hQcnpKMGF1?=
 =?utf-8?B?cXRDbzg1bmd6RW1PQTNVa2d3RGNuaExSd3IxUS80c1QzUCtLa09tUStGWkIr?=
 =?utf-8?B?S2k0WXdsV1ZNSkZtdytmRVhmUzJtczdYVTJEWUVSR1pOdXkyY0IvNFZHcU5p?=
 =?utf-8?B?bHV5OXZDU3ZXY3dYWnZTYTA4SkhSRTZubFJXdlhnQ1Frd3VydGxnNS95amY5?=
 =?utf-8?B?dC94NFVUZHZ6Vy9pcS9aMzhXWUk2QzZNNVRFSDVReU1uWTZJNVlDclI1UGJV?=
 =?utf-8?B?U3QyR1hiV0N3WVF1MkZmSkVaWnZ6OC9zV0dkWEFUWUhrZW9kQzg1NVA1ckEx?=
 =?utf-8?B?TEMrRkhDbUM5VUszTDJwVTNMcnZUR0lPLytxRlNaS0FFR2s3eGdMaWZxa3Q3?=
 =?utf-8?B?MEdIMXp6eGpGbkptYWxRK0txV1J5WW4zb0IybXlKQ0Fvdit1REV3MnNaS0Fs?=
 =?utf-8?B?dDEyUDZOYXd6Tkp6UjYwSkJ1c3Mydm1jRDlPVXc2b1hxbVkvcHBrU0JxcWtH?=
 =?utf-8?B?V081S3RkSWk5MVh2K0lnVVBJYUtxKzBDRnROeTJUKzFaWjUvcXdJV0xEZDNT?=
 =?utf-8?B?ZHlacHFodGRHSFdubzFnenhTanJ2aXBrZ3RwZ1JMaTVYWUg0MXFGazg2UzZn?=
 =?utf-8?B?TW5FQkVFdEpXQ29PQXVxNzVxM0xDSnpyU29XRUsyQW1wendOY2IwdkREWlNT?=
 =?utf-8?B?bE9MRDBSSjgrYnJzWWRCNzVnS3RKRHI0OWQ4OGlYV09GaFptbGJMZXZlQ3hQ?=
 =?utf-8?B?R3pIaVdHM3VqVnY0N0IwTWlJZ0ZocXVXeVhscXhKbEZnS2tlNXkxRE85OVVU?=
 =?utf-8?B?S1ZpcXd0K2o4TXRwTkhEZUh0c2gvL3JIbC9xK0dCT3NDRms1dzgxeFVTUWJq?=
 =?utf-8?B?TTcxM2gvNmVFQm5MazlwdyszdTB3bjc5Ky9DSk9kRTl4RmUrbUk0M3ppZkNz?=
 =?utf-8?B?MDZuZWhHa3R2MG1YRXh6SVF4N1dIYW5iR0VNT1ordzRmTmJqenM1WHkrRWd1?=
 =?utf-8?B?bE5jYnRIVkswOVYvQU9MYVhsKzJ0cm92V3dzZWNOLzYzSHh6YVZudUt5K3Vn?=
 =?utf-8?B?WG83aFU3TVpQcDZ0SUI4VTl5V2VZMDM2MzJGU2ZjZTdLQStpb1VIeE9zRUhG?=
 =?utf-8?B?M2RaK3p1cDk3cjVYS1NaTDhGMFVObXFmOEg0SmRjZ21yamM3a1NEM3RsdTdF?=
 =?utf-8?B?anJybTdRaFNaNVdGL3A2Z0dnUTVoSWtiMklqZkh5d0Fpa25YMTNLYmQ2MHdk?=
 =?utf-8?B?TFNJKzd1dDJreDU2UHJRcDBPSStEYityUnRrb0FtYUs5MVVrODJqMHNBS1M0?=
 =?utf-8?B?cFFXaFpuaFNZcVp4ZjRzM3htUkZXYnp3bUFSZUQ0WGJwNUxBblJrNE0xWC9k?=
 =?utf-8?B?U3EvUFZZL002Vm9JKzFVQnBWcjR3ZmxWZVlPbG9ObUpQZGlEeUJSR0xwcGt0?=
 =?utf-8?B?S3JZakxncnIwL21OdkZPTGQ2dTR2aSttbitLMHlTTEVpZVYvRE1WUmRIUm5C?=
 =?utf-8?B?dENKMTVyK2Qxc3l4NUtQMUlEaGpWNlY0L0x5MC9BYnc0b1orUHRWanpXMktV?=
 =?utf-8?B?d3VXdkxaM2lUd3IwZ0NQTk5CL2Jsb3NkM1U2UEUrOTBzTWI0RUplaDN6djNU?=
 =?utf-8?B?Y0NORGwxZ3I4aS9JOTRxT25VeS9kNHMyNkRkbVpWMDNucUV3a1R6bExaRDJt?=
 =?utf-8?B?aDR3Q3VGMzR4VTRnS1k2UzFjekxoWXFCVnZWRzNyR1BBazMrWU9KUlJZNlVD?=
 =?utf-8?B?dTB1T3p0QVlYOEpGWFl6SkVDR2VnVjdoS1owa3cwNHFDdDRwM2pSQmtaWVlz?=
 =?utf-8?B?cUFodjJKYWpLWDFoWGVSN1BZeksrTU9oUU1wRExrLzdwTUxHaUpQNnVNRmdt?=
 =?utf-8?Q?nRibkKi+uxIwRuvs4kD91xrzM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c35a0f3-9622-4146-4b8f-08de1104d20f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 00:49:13.6432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sgaZ1She/S9iEFwamxjSRuP7rWB2Ea80vu8YkFSftv66LdUjglVOrZnwRhK4sxaI7bP1V0enAWFvPJchcYnw8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6900
Cc: Peng Fan <peng.fan@nxp.com>, Ye Li <ye.li@nxp.com>,
 Udit Kumar <u-kumar1@ti.com>, Alice Guo <alice.guo@nxp.com>,
 Andrew Davis <afd@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
 Judith Mendez <jm@ti.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Ryan Eatmon <reatmon@ti.com>, Hari Nagalla <hnagalla@ti.com>
Subject: [Uboot-stm32] [PATCH v3 04/12] remoteproc: imx_rproc: Add support
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
