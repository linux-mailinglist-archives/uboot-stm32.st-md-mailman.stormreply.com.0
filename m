Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9496BF984B
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Oct 2025 02:48:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87B44C5E2C3;
	Wed, 22 Oct 2025 00:48:56 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011012.outbound.protection.outlook.com [52.101.65.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF66DC5E2C1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Oct 2025 00:48:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TLgjCvYWq4/lVBdDzEwakS65xI1D+AT2dCb2FCpc33r+9WnAiESqiSMsA1lyXsW7Txhc7XNMPViiDKEulgURhkHSG5NpO/Yzbs8hWFBZGhSCcReKx94ZxLObrmbx6I+BjPlYOaLIijPG00fHdNoj7BvZsQQmZ6+yDJkC1A4mG8SEW4W1HdOvKvRuDiZbYcKQ+KJBaWgC5UaC3gy8hFuJW0Ca6pdTKY1un+1MYtUuAtE0PGh4MIs+wMLS6GJx3C/WSb3u9KL0PpM2FCXM5fIo+u2zxUY0QeaO87c5iwj0PvfMIg0YUrXU7LbYaqCb261cRdrFdAc/3fzs5Os8Ys9XSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FTRyz1JNbNrv3G5ZcQ8rbm+R3GpBmAxF7EW3B7WIcXY=;
 b=qOVBjMziIzMgMTtMsdmh96FYAJ7ACNgkFdzMyUQsfTp3W6gp0FUnKQUCQb4N9bmjpz2n5FF4V4+zf2d8Txew+G58yvwIgyKXDGGjPC4+f3IEdWoCso+QCEiLl+sPXRVPK5mbrfHMSAxL0e68ewDdyNDpjV8EXCAqHL+ufYn4k0GL2zl5RJT1IuygHtBr7t71BqhH5hl9CMxAfi4HMBQhMIKgl9PmxHEQfcLRo29XlHo0JE/evmr1JCiN2MTdcIpIat1mvRh/qNF3YhKiPhEjnX7Iqjn7zFfceG86qMWCejr3LXRZHFE0TOrwBLsxSC933rRJWu/qwxliIm6vf2/Whw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FTRyz1JNbNrv3G5ZcQ8rbm+R3GpBmAxF7EW3B7WIcXY=;
 b=MM/dp/wPRoC01uUkhLb+RpQ8iAbM+UiOcvrAnENBELT774zwfzsEBCTmukeSefvw00JkkLnGyFRkP19rJ6Ng9rXKT9/SP5JX8CsAAN/YriEGraCMaLBNaKNp80OpL+pRynZXWX0VHYysK8Med5EBBPpcJAgWm65gXZqwW+7G/J1EgBG9kghzzlEtcfTlYRqwfEtgSQVEDv9124mefIE69YtGrDQRJbkfSbDj7HQ3QH2TfSDWOGabp3FtdwMfFWHydW2OAqriWHj1weVX5w9grRqfweeKEQE1O6Mevaiyec+z4WwyUv9wcFS9ij/Ci/wiJmdMyE2/uDjEuC0rtszvWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DBBPR04MB8027.eurprd04.prod.outlook.com (2603:10a6:10:1e6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 00:48:53 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9228.016; Wed, 22 Oct 2025
 00:48:53 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Wed, 22 Oct 2025 08:48:26 +0800
Message-Id: <20251022-imx-rproc-v3-v3-0-92273a82c5da@nxp.com>
X-B4-Tracking: v=1; b=H4sIANsp+GgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAyMD3czcCt2igqL8ZN0yY90UixTjFNM0I1OzFBMloJaCotS0zAqwcdG
 xtbUA8UYo3l4AAAA=
X-Change-ID: 20251020-imx-rproc-v3-d8d3d5f256d4
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com, 
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, 
 Stefano Babic <sbabic@nabladev.com>, Fabio Estevam <festevam@gmail.com>, 
 Tom Rini <trini@konsulko.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761094123; l=3424;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=70wcafDMbr7sduTEsxCN6E0FykKidts0UoYmX/VhqZ8=;
 b=D4JA7G2cFOJmWrzphxEIwB0N4LaNV4Pef5nkIHWJPIOZ/SVGkv4QyfJKBuyhA5oIpYB1UptOy
 3Eo04qmdmI3A24yatdcYsPylTaP8QCsvVuaVql7gAcfHlS9jSFojDM4
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR02CA0075.apcprd02.prod.outlook.com
 (2603:1096:4:90::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DBBPR04MB8027:EE_
X-MS-Office365-Filtering-Correlation-Id: d7a97fa1-ecc4-47e9-30e3-08de1104c59d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|52116014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N3dUL1NTUFU1OTBmS1I1ZnNJc2xtbnBOeXQvKzFuRFdjK2MrNS9wYlJ0S3Vy?=
 =?utf-8?B?Vi8vSzFFRVZOQ09POWJVUHJxVkJ1dUh4UiswSjdPelN4NUdJcHJ1QzVraS9T?=
 =?utf-8?B?Mk5Ia0trMkgrZENHM281dTh2R29PVDFFZUlGdVdaNjMxVEZWckpXM1k3bTJO?=
 =?utf-8?B?MjhrUCtITWNvS1VIWkMrM0pTbFZTL1orSXk2S1BxZzdOeEwzUGlkc1R4R3Iw?=
 =?utf-8?B?WFA5U0ZEQ0Nja2h2bVFFdSs2TmE3Sk1LT3NsSzdBZW01d1JFcDE3d0JoT3U2?=
 =?utf-8?B?eThNM0Q5NDArWU5OVDUra1lDTWdxQVRvdTcxcGtELzJqWmhHSDUxdllEYUVp?=
 =?utf-8?B?MWVBOFdCU0IxYkRLZGdPQ1JDc1ZKbERwNytSQkV3dmtaT25lWW1lamFQSnlh?=
 =?utf-8?B?NHNsUEwycnhsQklJM3V0SXVVV3VvdnJnZ0F0WmNWZWlDNmRqYTV4OEkrS0py?=
 =?utf-8?B?OWh6cHhxY1BLVG5ldEpRTG8zOTNBRDRSdGtDTWNLamhpdkhjb0swRk9oMy9j?=
 =?utf-8?B?WVRWNmF3K2VZbU4ydmgyNkRxR0R2L1hlMDErVGt6UGMwMUlGUkV3Q0U2WnJ2?=
 =?utf-8?B?WGM5WTFrL2p4R1V0OWZGUmdrYk5BUnJnaVAvNnE1RWJCUTYzVHBzdWF0ajBp?=
 =?utf-8?B?a1laTEJEMVlKWkFGYnBEOHg0REU2MDhoREtpNGRFeklidG5ocGhpUTBhc29j?=
 =?utf-8?B?V05QTE9MWnNONHlhU0hiNUx0cjVlZVhZeDZPbG5udnJJTmJkYzZZOHJaY2gv?=
 =?utf-8?B?cS94S28wMDN5QTkrNnVOdHorY0U2MTJqR3oxeFN0QkhuQ1d3bmsvYjdHSlZp?=
 =?utf-8?B?TWFhc1UxUFBIUmhqbVVVRDUvV3JtN1ZoTkFyd1IyamJUQ0lLRzVTbDNSMHJr?=
 =?utf-8?B?L1pXQ3ZPWTByY1NXSy9XZElyeWEyblRySFBXd3RVS21KME1td29NenhaS0s5?=
 =?utf-8?B?Z0MyU2Q0ckY0VjFqOCtiMjlaMkh3ZzhBeFNFWHVSV2swNFZyNW9Sb2dkY2wv?=
 =?utf-8?B?UTcyTkVwVkMrbWFvcVJwam5FdjNHQ1BDSlhZcGlOQjIrMTJzVm9aekQvTFg3?=
 =?utf-8?B?cTFJYW1nNFcyc0RuTSt4NnNGckhUWjBodmVRZFFRQnYzM1JxRXFVZTBZakk0?=
 =?utf-8?B?czRNU2pOcVRoRDFvUFR4a2krTWU4elBCNERuRlRyMm1LRFU1bHp6TVFwbjFU?=
 =?utf-8?B?b1V3R2NiUXFIdnFzMnlpRmVwa3Z6WURVRjU4TXV5QjdqNjF4T1hWVmZuOTFr?=
 =?utf-8?B?ZmdyaVFmNlpkaCt6NUpMWVN3Wm0ycy9GMFRPdWNGS3lXRmRxaElFWWFsQW9o?=
 =?utf-8?B?TkJXc2NLc0hHT1JRMUtZTjB4K0poNDAwZ0JvMXV5YnA2MjJzWkozMnF0RHZq?=
 =?utf-8?B?dzJxZzJ0S1Z0KzlUbUptR2hWdDY1TlgxYTVrUDZYODlFelo1c1RTd2NxY3hl?=
 =?utf-8?B?T2hYSTlmVGZmb2dvVFp1TmVQRTNSM2tqWWt1NytwUS9PNmRTYTNoUGp4bld1?=
 =?utf-8?B?S0FGQ0dheEJwK0x5MHVIVmJPK2pVYXZiZWNMQStDb1BMWS80aGZEQ3lKckc4?=
 =?utf-8?B?WXQ1ZzB1c1U4a1NKeDVieFd0MU00a3ZTQ3N3RTQxcHA1cTZCTExHcjJTN0Q1?=
 =?utf-8?B?Q1Zxa1VNVmlUUWhJY2RwekR0YUM2ODJpTUFzMmZPVjExRUc0czhYbnZVbDk0?=
 =?utf-8?B?S2F5MmtiZTA4bzVlaGNtOEJGNVBZc2hpUU0xekdIVnRlZHNKYTZZV0VMd2Zw?=
 =?utf-8?B?Qis0bHVkQnhsZkpXT3o0aGhEUGEybWJXY1doNHdsTGRFd2VudlNHejhoTXBY?=
 =?utf-8?B?RVN3bC82aWUvNDIrVjZxVjY0Tnh3RUZaM3VjUXhlT0FyeXUzd1BQdkNpTXNP?=
 =?utf-8?B?NmpETGo5TEFkYi9CYW4rMi9odEFRYnNrRzhrMUwxMElVNENCMXJxZmhPRC9m?=
 =?utf-8?B?bmJVNUVWWHg4aDV1S096TkRVa0J5NlMxZ0dtd1Y3djhvSnpZVXRhODcwc1Qz?=
 =?utf-8?B?cnVGWjFqNzBFaWYrSUJtU0xTalFNeE5tSTVGenBSZHRxcFF5amg4QWJSZTJz?=
 =?utf-8?Q?Ekyj4O?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnlsVGo1OXFMcjdtUGdubXVnVGZLVitRMDlQN0JoQWZ3UktrZDVZV3BVeXdq?=
 =?utf-8?B?NjV1KzIvSlhobnhFQzVjTGRQVG1ldTdid2dUdE1IL1NWNmlLSnVadXp6TTdK?=
 =?utf-8?B?ZHFZSkhFMDY4M2hxVDlIUFd4YlVaRHZrOUE3aFdIeFhGdzFKcmZZUWxsbmEy?=
 =?utf-8?B?dWhRQ2VsblNTaUt6amN1cFBKd1hTSlp6Q0ppdTluSmFvTEpaN291OVVhQitu?=
 =?utf-8?B?TmVHdnBZVmhYWHFUbW1LTkVjdzNJenY5TVdzN3g3ZEM5eDI5cjhKZGNwMm15?=
 =?utf-8?B?OEkyZjdObE4xY2FDNG95UU52UWxjKzZqOXVOMGZpb0l2V0FBSzd4VmJhbkZY?=
 =?utf-8?B?c1VPNElNQ2dzQ2UxSm45ZGZRcWROaHZMRnVPNVRLN1o5ZDNONkhDMVd4SWg1?=
 =?utf-8?B?K293aWkyRitMRmdUak1MZzdXTlExWWlJN2FoaUtYd0J3aTVrVHpFcDBTL1Ey?=
 =?utf-8?B?Z2pqdVVTeHkxSFdiWm5oZFFpRFNGanlQR1p4ZUVwZ1BGV0dtZTloY09uMjZV?=
 =?utf-8?B?S2JVL1RqamdCTTIyZm5kUDJxTHpZV1dGRjltWVdnQXVVTStuZXEycTdVd1VB?=
 =?utf-8?B?ZzEyVzFKdmVUblJNelhUSUc1eFRieFF2b3VHa2JZVWM3L3VmM2FzaVk2Y0sx?=
 =?utf-8?B?NjZ0WklCL0pxZWtidnkzRmxDbVNrdHNWcnlTWHN3S3p4QndndHFSZytsNUFa?=
 =?utf-8?B?NVI4cnJrTk1tMFdpakNCcmVrbWhiRUszSVJ3akw2cnN4MEd3dXNMNzQ0UHFk?=
 =?utf-8?B?Snd2cmViV3FXTDRjb2k1MCtzV1R0SEVuYktHU3M5ckwwbVVBMGhOQUZmdnV1?=
 =?utf-8?B?ZG8zSHNIeStnR08zdTFkSU16bVBFSGdyczFKYWx0dHlBamdYMG1DM21mTWpV?=
 =?utf-8?B?YmYrZlcxK09hWmV4S090RGd3YUJiVlJ1Sk80UjRhRHpoTEErRFlJSW56T0ZY?=
 =?utf-8?B?clAwYkpEVlNUdTQ2QS9YemN6dURnRmNOL0d5MGZQcGU1QitHbVJhUzRQZktQ?=
 =?utf-8?B?U01LWXZwZE9QdW9scWtFUnUxenVhdUZXbmdlNVVrVUxzTGNwNHpmb1pHNW5l?=
 =?utf-8?B?ZXdza1BXZGNTdjNocnNubmVxWStyMVUycGNuNU9xbUx6NzVIa3V5S0lGekZD?=
 =?utf-8?B?elVkd3VwMGVEU242TlBrTVNlOUI1WFk4K2tuM0pRdzVlM2tCYzFoejFocmhN?=
 =?utf-8?B?UXBFQWV1SDZWc1dZbEpzOFdOYittakRhK1N0a1E5eXFPMEYvRjdvd0hoRUFK?=
 =?utf-8?B?eEppTGNFT3hWMHdiRVEydVNSMTVPd1Q0VjlyOGpjbHRQRHJOVm1rWFdCZG81?=
 =?utf-8?B?a0dUZlc3K000Q210OHR1ZjJUNGhDNDJRRlhsV0tXMEJRamxDdVlQQmlERFVz?=
 =?utf-8?B?VEo4elBqRmRWV1ovV2VFSkREWTFncjJuZ2FtVzFOeFJ4amlkeSsxWm9iR2Q1?=
 =?utf-8?B?RXhLT2Rrc2tGcWsvcWFzS1ZLVjdyTEZHcUZSd2Z4Nmpyb3hCejc1NnNNby9v?=
 =?utf-8?B?Yyt2TEpqZ2kzeGdPTmlVZlZhTTQ5VCtmY29sRmZESHJwejhBTTZTdWxDcTQv?=
 =?utf-8?B?YmxORVVTVDBJeTVvejkxd2VyWkpHRzBmd0JmZ3k3RDMvWHB1bzZyb2xObVVr?=
 =?utf-8?B?K01lM2M2U2E5eWxQVjRIK2hGYkNWdG9ZQXlNRlNKRzY5L1hVMVd4SU5ZMWZQ?=
 =?utf-8?B?SHhoRGtuNXBiWmFVQkF4SThTLzVTcGIxYW5wTnZid3g2UENIK3l3VXdoSHp5?=
 =?utf-8?B?ZlZvR1pDS2VBWHhLTVlaU0xLcTNRMjBHZDRDdkFrTk1NSjNWTWY3akFzUnJw?=
 =?utf-8?B?b2hEaG9MVDg2bVk0Y3VEYXpHa29WcDJUWjVSelhOZE1BbWlPaTV3UjVURFdF?=
 =?utf-8?B?dGI1cXk5RFkxWU1LRzhoalZNWnk0dVhjVUl6cFd2UXRrV3pQUTZIbWFORUFh?=
 =?utf-8?B?L1RseHBjVUtkcDdTdHhQdUtRQ2FIc3VoU1F3VkZVQkI5UEltTUZpclZtMVZ6?=
 =?utf-8?B?ejRnWG1qcTNjcW1nQjB5ckhSOFQ3b1ZDbEVuNm5PVkJnWG8rbStvMlNsUVVy?=
 =?utf-8?B?eVp5VGNuSkxQVmVxU3AwR2FHL2hodXp0WUpVVnFxSUxGSjdOaUltN3FQRE9J?=
 =?utf-8?Q?mzjpByN2FrQAwDCiUUe7OCDIx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7a97fa1-ecc4-47e9-30e3-08de1104c59d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 00:48:52.9813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jsvix9NegT5Drl0Ml9YcLZbvuh4zZtYglMYsfnjgvunHMwGSNnoW3zRnMQdAwiJuWWLx8DkftE9XwNP/2WByFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8027
Cc: Peng Fan <peng.fan@nxp.com>, Ye Li <ye.li@nxp.com>,
 Udit Kumar <u-kumar1@ti.com>, Alice Guo <alice.guo@nxp.com>,
 Andrew Davis <afd@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
 Judith Mendez <jm@ti.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Ryan Eatmon <reatmon@ti.com>, Hari Nagalla <hnagalla@ti.com>
Subject: [Uboot-stm32] [PATCH v3 00/12] remoteproc: Add support for
 i.MX8M[M/N/P/Q] and i.MX93
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Q0k6IGh0dHBzOi8vZGV2LmF6dXJlLmNvbS9wZW5nZmFuL3Vib290LWNpL19idWlsZC9yZXN1bHRz
P2J1aWxkSWQ9MjEKClRoaXMgcGF0Y2ggc2VyaWVzIGludHJvZHVjZXMgcmVtb3RlcHJvYyBzdXBw
b3J0IGZvciBOWFAgaS5NWDhNIGFuZCBpLk1YOTMKcGxhdGZvcm1zLiBNb3N0IG9mIHRoZSBpLk1Y
LXNwZWNpZmljIGxvZ2ljIGlzIHBvcnRlZCBmcm9tIHRoZSBMaW51eCBrZXJuZWwgdG8KZW5zdXJl
IGNvbXBhdGliaWxpdHkgYW5kIG1haW50YWluYWJpbGl0eS4KClRoZSBleGlzdGluZyBib290YXV4
IGNvbW1hbmQgaW4gVS1Cb290IG9ubHkgc3VwcG9ydHMgbG9hZGluZyByYXcgYmluYXJ5IGltYWdl
cy4KSG93ZXZlciwgdGhpcyBhcHByb2FjaCBmYWlscyB3aGVuIHRoZSByZW1vdGUgcHJvY2Vzc29y
IGZpcm13YXJlIGNvbnRhaW5zCnNlY3Rpb25zIHRoYXQgbXVzdCBiZSBsb2FkZWQgaW50byBib3Ro
IFRDTSBhbmQgRERSLiBUbyBhZGRyZXNzIHRoaXMgbGltaXRhdGlvbiwKbmVlZCB0byB1c2UgcmVt
b3RlcHJvYyBmcmFtZXdvcmsgRUxGIGxvYWRlciwgZW5hYmxpbmcgcHJvcGVyIGxvYWRpbmcgb2YK
c2VnbWVudGVkIGZpcm13YXJlIGltYWdlcy4KClBhdGNoIFN1bW1hcnk6CgpQYXRjaGVzIDHigJMy
OiBJbXBvcnQgbWVtY3B5X2lvIGFuZCBtZW1zZXRfaW8gZnJvbSB0aGUgTGludXgga2VybmVsIGFu
ZCBlbmFibGUKICAgICAgICAgICAgIHRoZW0gaW4gdGhlIHJlbW90ZXByb2Mgc3Vic3lzdGVtLgpQ
YXRjaGVzIDPigJMxMTogQWRkIHBsYXRmb3JtLXNwZWNpZmljIHJlbW90ZXByb2Mgc3VwcG9ydCBm
b3IgaS5NWDhNIGFuZCBpLk1YOTMuClBhdGNoIDY6IFRlbXBvcmFyaWx5IGFkZHMgQ29ydGV4LU0g
bm9kZXMgdG8geC11LWJvb3QuZHRzaSBzaW5jZSB0aGV5IGFyZSBub3QKICAgICAgICAgeWV0IGF2
YWlsYWJsZSBpbiB0aGUgdXBzdHJlYW0gTGludXggZGV2aWNlIHRyZWUuIFRoZXNlIG5vZGVzIGNh
biBiZQoJIHJlbW92ZWQgb25jZSB0aGV5IGFyZSBtZXJnZWQgdXBzdHJlYW0uCgpOWFAgaW50ZXJu
YWwgUi1iIHRhZ3MgYXJlIGtlcHQsIGJlY2F1c2UgdGhlIHBhdGNoZXMgYXJlIGRpcmVjdGx5CmNo
ZXJyeS1waWNrZWQgZnJvbSBOWFAgTFRTIHRyZWUuCgpTaWduZWQtb2ZmLWJ5OiBQZW5nIEZhbiA8
cGVuZy5mYW5AbnhwLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjM6Ci0gQWRkIGRvYyBmb3IgcmVtb3Rl
cHJvYwoKQ2hhbmdlcyBpbiB2MjoKLSBEcm9wIHBhdGNoIDEgaW1wb3J0IG1lbWNweV9mcm9taW8g
d2hpY2ggaXMgbm90IHJlZHVuZGFudAotIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL3IvMjAyNTEwMTMtaW14LXJwcm9jLXYxLTAtZmI0M2EzZmFmY2QwQG54cC5jb20KCi0tLQpQ
ZW5nIEZhbiAoMTIpOgogICAgICByZW1vdGVwcm9jOiBFeHRlbmQgZGV2aWNlX3RvX3ZpcnQgd2l0
aCBhIGlzX2lvbWVtIHBhcmFtZXRlcgogICAgICByZW1vdGVwcm9jOiBBZGQgaW14X3Jwcm9jIGRy
aXZlciB0byBzdXBwb3J0IE5YUCBpLk1YOE1QL04KICAgICAgcmVtb3RlcHJvYzogaW14X3Jwcm9j
OiBTdXBwb3J0IGkuTVg4TVEvTQogICAgICByZW1vdGVwcm9jOiBpbXhfcnByb2M6IEFkZCBzdXBw
b3J0IGZvciBpLk1YOTMgQ00zMwogICAgICBhcm06IGR0czogaW14OG06IEFkZCByZW1vdGVwcm9j
IG5vZGUKICAgICAgaW14OG1wOiBFbmFibGUgcmVtb3RlcHJvYyBmb3IgaS5NWDhNUCBFVksKICAg
ICAgaW14OG1tOiBFbmFibGUgcmVtb3RlcHJvYyBmb3IgaS5NWDhNTSBFVksKICAgICAgaW14OG1u
OiBFbmFibGUgcmVtb3RlcHJvYyBmb3IgaS5NWDhNTiBFVksKICAgICAgaW14OG1xOiBFbmFibGUg
cmVtb3RlcHJvYyBmb3IgaS5NWDhNUSBFVksKICAgICAgaW14OTM6IEVuYWJsZSByZW1vdGVwcm9j
IGZvciBpLk1YOTMtRVZLL1FTQi9GUkRNCiAgICAgIGRvYzogYm9hcmQ6IG54cDogQWRkIHJlbW90
ZXByb2MgZ3VpZGUKICAgICAgZG9jOiBjbWQ6IERvY3VtZW50IHJlbW90ZXByb2MgdXNhZ2UKCiBN
QUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAyICsKIGFyY2gvYXJtL2R0
cy9pbXg4bW0tdS1ib290LmR0c2kgICAgICAgfCAgIDQgKwogYXJjaC9hcm0vZHRzL2lteDhtbi11
LWJvb3QuZHRzaSAgICAgICB8ICAgNCArCiBhcmNoL2FybS9kdHMvaW14OG1wLXUtYm9vdC5kdHNp
ICAgICAgIHwgICA0ICsKIGFyY2gvYXJtL2R0cy9pbXg4bXEtdS1ib290LmR0c2kgICAgICAgfCAg
IDQgKwogYXJjaC9hcm0vbWFjaC1pbXgvaW14OG0vS2NvbmZpZyAgICAgICB8ICAyMCArKwogYXJj
aC9hcm0vbWFjaC1pbXgvaW14OS9LY29uZmlnICAgICAgICB8ICAxMiArKwogZG9jL2JvYXJkL254
cC9pbmRleC5yc3QgICAgICAgICAgICAgICB8ICAgMSArCiBkb2MvYm9hcmQvbnhwL3Jwcm9jLnJz
dCAgICAgICAgICAgICAgIHwgIDY5ICsrKysrKysKIGRvYy91c2FnZS9jbWQvcnByb2MucnN0ICAg
ICAgICAgICAgICAgfCAgNzggKysrKysrKwogZG9jL3VzYWdlL2luZGV4LnJzdCAgICAgICAgICAg
ICAgICAgICB8ICAgMSArCiBkcml2ZXJzL3JlbW90ZXByb2MvS2NvbmZpZyAgICAgICAgICAgIHwg
ICA3ICsKIGRyaXZlcnMvcmVtb3RlcHJvYy9NYWtlZmlsZSAgICAgICAgICAgfCAgIDEgKwogZHJp
dmVycy9yZW1vdGVwcm9jL2lteF9ycHJvYy5jICAgICAgICB8IDM3MCArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL3JlbW90ZXByb2MvaW14X3Jwcm9jLmggICAgICAg
IHwgIDU2ICsrKysrCiBkcml2ZXJzL3JlbW90ZXByb2MvcmVuZXNhc19hcG11LmMgICAgIHwgICAz
ICstCiBkcml2ZXJzL3JlbW90ZXByb2MvcnByb2MtZWxmLWxvYWRlci5jIHwgIDk0ICsrKysrKy0t
LQogZHJpdmVycy9yZW1vdGVwcm9jL3NhbmRib3hfdGVzdHByb2MuYyB8ICAgMyArLQogZHJpdmVy
cy9yZW1vdGVwcm9jL3N0bTMyX2NvcHJvLmMgICAgICB8ICAgMyArLQogZHJpdmVycy9yZW1vdGVw
cm9jL3RpX2szX2RzcF9ycHJvYy5jICB8ICAgMiArLQogZHJpdmVycy9yZW1vdGVwcm9jL3RpX2sz
X200X3Jwcm9jLmMgICB8ICAgMiArLQogZHJpdmVycy9yZW1vdGVwcm9jL3RpX2szX3I1Zl9ycHJv
Yy5jICB8ICAgMiArLQogaW5jbHVkZS9yZW1vdGVwcm9jLmggICAgICAgICAgICAgICAgICB8ICAg
MyArLQogMjMgZmlsZXMgY2hhbmdlZCwgNzA4IGluc2VydGlvbnMoKyksIDM3IGRlbGV0aW9ucygt
KQotLS0KYmFzZS1jb21taXQ6IDBmODY1YWI1ZDY4NDg0YjRkYzE3MjQ4MDlkZTFiZTA2ZWRjODVk
ZjEKY2hhbmdlLWlkOiAyMDI1MTAyMC1pbXgtcnByb2MtdjMtZDhkM2Q1ZjI1NmQ0CgpCZXN0IHJl
Z2FyZHMsCi0tIApQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApV
Ym9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
