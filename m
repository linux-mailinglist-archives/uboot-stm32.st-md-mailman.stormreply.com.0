Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 29290C30699
	for <lists+uboot-stm32@lfdr.de>; Tue, 04 Nov 2025 11:06:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CBDCCC62ED5;
	Tue,  4 Nov 2025 10:06:19 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011058.outbound.protection.outlook.com
 [40.107.130.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE403C030AF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Nov 2025 10:06:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uS3yAbO9Sg41+Vmld1w9OwJquptNuFAKUQDoo8X/4pjDX4/MwuIFOA5bSLjsNRLqCrorphwSyJJ0HmXXZEEhaJTRL/LbMIXlagZw5wHObzH97u8vTAy2iAwRpHPtAvFVPjLCZuh06iGCET6TOUhudyGUyW3EA2K8JCmDo8JJ3XtlEzhb9pPpfWLQrwKi1ma08GayjgS0HM1mIRbsWhpJ2l+U73JjYBYrrlw9eiqLaBgG4SibkbxX8KJmlwxjgB6UL/MSOn5XbfdICr4SRPpJzMwN63PxjAGEHoyr3i6f9sebd16bhPVs2MdeiXNwROEVWOhYkm6VHHB2e2qvMnLmRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c0eN+SIvgWMM+yqPhnlnwZBdTcKfFAhiAXfAnPWGtI4=;
 b=E4Z6i+WgwRNc8cgjAV9GKGYqw2SDKkl0bkyak1cLbMR94EJjUmp1AqLjE76xmL1QIheIVqMgB5QZ6rxkUXGtmpVLKwk/wMn6IKmu4wINkMMDaFJkjmFiuqMW3vntpS1QGBLBunX5TiUK3OWh/gNkeI+SRW2dd8Q2cHuwchpZkeiPsZ/BMYkruxJbIfiXD4q4MNhAgDJlt49THTFyPbf8LBVnQWwKtEwMXMwLfDw3WMiA3XubC2bIBZtsMRQ7uQSheR8Wj2pAMPqHsI5frWZr3yBvDZx1b+zlv2yqDLQK/fNJ5KEjWfbnnZF5oxgD5KItmiZ0lORPDKoBejE77IFWJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c0eN+SIvgWMM+yqPhnlnwZBdTcKfFAhiAXfAnPWGtI4=;
 b=fyOTRHRUPxjCSkyhhojXlwBkx50T7fmoZuZDg8+VqX/P033JNkNoh27Ect/4fWrG8Ba72lV8stkmylsIGx2h1mY2qnphVolThWo+L9mIC1xiJE7zeb2CnAHAxoFd67bI5owfnTIiE07N2ul+b88qznKEwSY9yYF4dYYntLH2aKAOLG6DPLjmBskHzW+T5Ty9XGwD/8sLwdPA7ehCvt1VgNXL+v30DqDUYpIEaS4inb5XFSDVBo0jpZtRRzbD9upUYxrrFX6JQTzgUZU2Lkj5wLsoUiFXyKBj8KTqIeELqtln4uQcd/TByDrbq+Rzb9tSgX4/2BwF/6QzzOIYhXKdlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS5PR04MB9969.eurprd04.prod.outlook.com (2603:10a6:20b:67c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Tue, 4 Nov
 2025 10:06:15 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9298.006; Tue, 4 Nov 2025
 10:06:15 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Tue, 04 Nov 2025 18:05:49 +0800
Message-Id: <20251104-imx-rproc-v4-v4-0-8bbc7b886737@nxp.com>
X-B4-Tracking: v=1; b=H4sIAP7PCWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHQUlJIzE
 vPSU3UzU4B8JSMDI1NDQwNj3czcCt2igqL8ZN0yE11jkzQLU0tzA1ML8xQloJaCotS0zAqwcdG
 xtbUAIEcOBV4AAAA=
X-Change-ID: 20251103-imx-rproc-v4-34f85970587d
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com, 
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, 
 Stefano Babic <sbabic@nabladev.com>, Fabio Estevam <festevam@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762250765; l=3696;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=EtnHgnPwg+QCi19rdI5HsjHpn/2/ljTj+w4KYApYpXk=;
 b=HYTWGXymNOqqh+sk9fgU9Ch/NwSuQW8PcbaURJmnWULP+nqWPfke+Qm3fQzoI3u9MDa0JClS7
 zwP+nj3HouEAGnHOaQyH/IONC5NTMSuAdGJyvC7cVqvcKjbJLjpCdiV
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::20) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS5PR04MB9969:EE_
X-MS-Office365-Filtering-Correlation-Id: b2bad989-b635-4d00-bc1e-08de1b89ca79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|7416014|376014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TEFINi8vdGdndFdMMHFIN0ZNbUlhT21XbU03cmF4eWlJck9RQlpPQ3lOQ2RM?=
 =?utf-8?B?YjBSUDFpK3lCSXhqazBldzhTdWxyZitYU3lPRUhENDZ4Q0JFQ2lLU29zVFRy?=
 =?utf-8?B?cUc3aW5haWFJdFRqd0dCUmJxL0ZQOEVrSzFnNTdUdHMrRXZBd2NXNHRoQnVa?=
 =?utf-8?B?aTdvcVRnWFViYytLdUN4Ym1HUlptU2dBU1hWcEdXYXRjdUhiWXlTTmFPQ2lN?=
 =?utf-8?B?STlUR29LUWlmam03WEo0UEJOTmYzYkFKSjlIWlFhOGcvanh5OW9GU01lV3lW?=
 =?utf-8?B?TU51TFdMY0lXajJtRnlabGs3TUxIQUFLeGFNbzA5dUhaekNwWk5BeHFlL20r?=
 =?utf-8?B?VGpvdE5rQTVNMEVxd0dZVEVHZXo2SU8xZzl6N1Q5cWlQc1g1dXJuV2o2WUl5?=
 =?utf-8?B?dlVpS2d6NE1XNVhVOGZQUU1LeE5OdUFyeDZ6QXl6NWlpci9zdXhNcGIyT3Zn?=
 =?utf-8?B?aXBESmFyb1Ria1FnS3BnSWh1dk84dG5EbjFPWERoMlRUZWQ0eEVQb2xkNEdR?=
 =?utf-8?B?RU1tbm81dm4rSHlGblJNTmI0SVR1eWttY3JHNUJzN0MvQWtidTlpNGg1M09v?=
 =?utf-8?B?T2g4bmQ1VnUwd0hKM0szWExNNzRZOXZtODYyOFNQRmRCcDk4ejRSRHlsemJ3?=
 =?utf-8?B?QXdIaWVFaHZmNjFHcGJuK1F1VDRVb2h5VDFxRkpTaDFLaGFoSFdaR0NVTllB?=
 =?utf-8?B?b3RxbEFGREp5bWJDazJFTHkzQ1ZscDF4K211eEt6V2YxVmtmdGxKZ2JRWjFR?=
 =?utf-8?B?TXAySGdJbjV2Ung0bUVzcTdTS2tCbDc4eFcxV1loODhRNjJiNnZuV21WcG9L?=
 =?utf-8?B?MUh0SHU4SEI0TityRC84RGRhZGhCL0hrdHFtSENlbmlVcjAvTGovanhDODNl?=
 =?utf-8?B?OTVEYlJ1K0wzeDhCUlJKWWx1a3J1RFFSK2VMNkdXa1FqUzhlOThrWmtFTGNV?=
 =?utf-8?B?ZWhueFp4Q3ZFSjlpRGtrRDJaUTlrd3FXdUlqSlhYMisySkRJc0R3RTYwRkVv?=
 =?utf-8?B?MmpLTEx5eHN6QkphVndKVGwxaHdTZS9xMnNRWmxQRGRFRDdBakZ1MjQ1dm85?=
 =?utf-8?B?aTFsNzdXdm01cGQyU01YcTkrYm0zUTRoazdJVlJlLzE2S1RLZ3BQWTVyRndK?=
 =?utf-8?B?WFVScDFJUGl3dUV3QnloWm5BVXB4L2dDUVg3U1FOajV0UWVwR0Q5d1NkcGpS?=
 =?utf-8?B?R013U3VZOTFrSjhJRDd2dmJORmcrUTlmQ0J5QW5KZWlFTm9QRnFIYjZONXBZ?=
 =?utf-8?B?ZzFnYy9reGVLUi9ZWWt2NXdFOExKSHhhTW9JaHlyQzFIWUpOd05WZ0wxL0Zp?=
 =?utf-8?B?c0U2WFB5Zi8zUllPUG5pZUwrdEFsZ21FZ29NejIxS0hkVHYrSWVTVzllRS9s?=
 =?utf-8?B?V000U2ppUjVnSHVidXNVQ21oRWFQVEp5T2xpNTZmSnZlMlZleC85NitBNklJ?=
 =?utf-8?B?RURLMnhQNmpQVE9uR0NncStyZURybXNlS2psK25NcDExMWlaM3B6RGdRaWN2?=
 =?utf-8?B?YUxwZjNBbndHdXo1TTdjejBqdHlrSXovRGdVckkxMm0wMzJFLzNmU05BVGxW?=
 =?utf-8?B?NWJiZEJ1NEkzWlFNQ3lLc010dktFTUlSK0dndmk5ejFvbmJrRXNaR3JtQk4z?=
 =?utf-8?B?QUNwekxRRlREdEc3eXJTMEJIMUZKalptYkQ5MDk3ejJqaUdUZUd2RlozZTAr?=
 =?utf-8?B?WGFkTHpsVTVhODZtNTBwY2JpTmtOaVpHanJaUEUvQ04wUVJKcE93a280UWZE?=
 =?utf-8?B?VmtLRHZTZTYxR2h4QnFBVHNKVVBzdjhSb3NNbFY3b0xBOXlxem54WXJ3aEF6?=
 =?utf-8?B?UG1wM25pTTVHSDlFYkFKZ0Y4MkFibHlrbUhRcTI4OTVtTnBCdjRKbmxzeE5E?=
 =?utf-8?B?N1puMnNFVmRMMU5vazBxQUkvOGcrdlZRY2ZjU2w1NFp6TDBiRFplQ2V1b2Nr?=
 =?utf-8?B?TkpaOUdVQUVJV2dTWDZKd1pMZzN3UzhCaElBa0lyaVlKSVdnQWZuVGxPTDdV?=
 =?utf-8?B?NC84c0xYRHZxYW5MRUZLMnJzbStqSkxWMVBzc05nNVBncmJGVStUYUNhaExu?=
 =?utf-8?Q?g0TIHH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(19092799006)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzdNTlcyOXJ0dHRUbmZaMGxhMlVzbStBcjVlc3YxZWEwL05kNG9CS0VLMXFI?=
 =?utf-8?B?eEVxMGo0ejNpSnJsS1JUZkVuWDduemtLSm11eXVJTU1iY3Y0ZTNhaTlSbUNE?=
 =?utf-8?B?c1RXVU5ZL3RJUndIZWQ5VHpTQzdSNG5MT3hVMm9McE5ZTFlUK2ZHcWFtZ1hB?=
 =?utf-8?B?bURBTVRXNjNyMy9mUVFRNHVPUnZKNGdjbEtUcklFVTJNWkxaeDVUcWR3SDZC?=
 =?utf-8?B?R3Fma3NvS2IwOWYzS0dUaHVjRXFGQVZMRUwrWURMN1UvVFUxR0FnaHczZ1F3?=
 =?utf-8?B?Rm8xQ3ZwdmE4dkk1M2FlczJLQ3JsN3FMMnRXamRtUXRkNUdLNGhTSGRranZr?=
 =?utf-8?B?NXd6VDVKcGpTTzVNNVhoRFBjcHNKeExyRk5lQ1o0WjJzZjQrRWdQSGM0K2w3?=
 =?utf-8?B?TEpnNXlkWCtVeDVpM2Q0a3lYajBiUlpOVDdwSjhuRnJRQWdOR1BxTEwwVVRM?=
 =?utf-8?B?NitPUnoyZW5KYXhXd0I1eG1qNHpLWHU0Q0RadFpWQUNyVE1UR244V01jQUpy?=
 =?utf-8?B?MDN3emZ5djEweHlYd3JIOUJ2QlVLdnhlUDIyVmJ5aVJCeUVIdXh2cnNTOWla?=
 =?utf-8?B?clpDb0FmdVNKQmF0ZFl5UXAyWURWSWFUTVdyN3hjUGU4MkNHZWNFME1yUGJr?=
 =?utf-8?B?RGw1TU5nN05VeHVHbHI1THZkNWJGckpyd3pDTGVJTlVXbXhUSWlzNHJQTHJM?=
 =?utf-8?B?RThJRDgwb3dqemxXcEFDcDhGdU1KTmwzeEFFa3VhZC9zQi9vQzdsbFpleGZU?=
 =?utf-8?B?a3c3b2VhenhjZ1NtNnZzSkZiMXhLR01zSDgrZm1ZNmU3WUorRmtLTlY1TEhl?=
 =?utf-8?B?b2J4TXo5ak5VNXA5Z1VpdjdqQ0gwd2FGbFZZMU9xZUFwZWo5Z0pxb3VJMjly?=
 =?utf-8?B?L3E5MjQ3NHJOREtibHVaUzVNMW53TmRvNzNPdDlQOWFqYnRXb2JJazkyekts?=
 =?utf-8?B?MHhLTDhhN2txMDlPaktMaVJ4NmlucVJSRFdlTTJOdTRTLzRFZzIrenVSZUV4?=
 =?utf-8?B?bithNmZZWTVtSW9FZ0pnT0NQOE1jMU16MzhSekttenFxZWIzRDhZR0hKVmZr?=
 =?utf-8?B?aW0wUUpLOWZYdUt1MmFqcG42Z1cyM3Y1TUZ5WjVLbE1HMm5oY2dlaE10cjZI?=
 =?utf-8?B?YXZiWGN0NGoyZlI0eEUxVmRTTGlFMGZ2NlA0OUo4WHNBcUJGN0NsbC83RVN4?=
 =?utf-8?B?TXFCWUxYQjNYUDNaRXQwSk9nNG9WcDFYYUdJOGFXRU1EN3B4MUczMFJwdWJj?=
 =?utf-8?B?STVvcTZib3lMV2czMTJXZzdrU0tZT1VSWDhMV1pzRWxjR3JtS2xWZXVRaTN6?=
 =?utf-8?B?dkVOOEc4VS9tZktpeUphbU1rM3lsQnhQV2E2TGlhWDMvNHZiUUo2czVFZHNo?=
 =?utf-8?B?NllmZEwxclNzV2Q4WGlDbEtTb1dPTGFRSkNsMUJSczN0RnNvbXpSaWIyTDFT?=
 =?utf-8?B?bU5LdEhDWTNadUdLMzRuTit2Q1A2U2t3bHhzVDNOZngrdnlueXluWk5LRkZa?=
 =?utf-8?B?SnR4c0d2OVIvZERBWnp4OVJha2NPODhCL0F5QTZ2VG5xL1dFc3NEeUNYbUt4?=
 =?utf-8?B?REZvSUdLa1Rac01ROUpOcVhQTmhPNGcyTmM5RmxiSzlBOVE4Rkd0USttei9K?=
 =?utf-8?B?UGFxanNKbng4MS9RS0YrblpzY1dEclhUZmY3d0I5VUMvbzJOdUprb011UGxE?=
 =?utf-8?B?SWtDcWJrUFRWTmdtaXF6L1pkc2tMWmNrb3pxZ0xsN3BhZmFRWUEzeitmYUs1?=
 =?utf-8?B?a1I2YnYrL0RqTnIxUDlWeGdwT2R2Wmo4WE1mQ3FLSVp2K2p2OVNkUmNQZEUz?=
 =?utf-8?B?bEVkbDBQTVlDWCs2SklyZ1JmcGR3Sjk1WFJ5UzRJeWp2UWQwbFZjSUhRK0RR?=
 =?utf-8?B?SjVZQXZXZXdIWWxORTJJeThSbFhNeHcySi9MZTFreCtFU3hlVTY2akMwUEdK?=
 =?utf-8?B?M0dzL0ZDcG4zZk92Tm1tYmJ6SkhMelhhLzhlRXRmRXlRYlpIUjVuajJjTnp6?=
 =?utf-8?B?bk9tTnJIRGNnZTd4SU9LUmx2bi8xN2JBMmpkaDB4dEV0YXZMRjVHaVpOWjFT?=
 =?utf-8?B?UWR2NHZYWGZCaUV3ZjBKenJYZGdVUEJ2V255R0VwS3NMWXh4NDgwVWlnNldw?=
 =?utf-8?Q?AUy0gX5H3Skbm+1Rfj2i2ZKxq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2bad989-b635-4d00-bc1e-08de1b89ca79
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 10:06:15.7052 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qf1epcnPHFY4DTsSN8QV52wlkGn7RnPqcjVw5mwz/t1+oVTwzincmgUARljcuMpKGgNiKO4OK5ZnyQiMdIvvFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9969
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Ye Li <ye.li@nxp.com>, Udit Kumar <u-kumar1@ti.com>, Andrew Davis <afd@ti.com>,
 Beleswar Padhi <b-padhi@ti.com>, Judith Mendez <jm@ti.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Ryan Eatmon <reatmon@ti.com>,
 Hari Nagalla <hnagalla@ti.com>
Subject: [Uboot-stm32] [PATCH v4 00/12] remoteproc: Add support for
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

VjQgcGF0Y2hzZXQgcGFzcyBDSToKaHR0cHM6Ly9zb3VyY2UuZGVueC5kZS91LWJvb3QvY3VzdG9k
aWFucy91LWJvb3QtbW1jLy0vcGlwZWxpbmVzLzI4MTM3CgpUaGlzIHBhdGNoIHNlcmllcyBpbnRy
b2R1Y2VzIHJlbW90ZXByb2Mgc3VwcG9ydCBmb3IgTlhQIGkuTVg4TSBhbmQgaS5NWDkzCnBsYXRm
b3Jtcy4gTW9zdCBvZiB0aGUgaS5NWC1zcGVjaWZpYyBsb2dpYyBpcyBwb3J0ZWQgZnJvbSB0aGUg
TGludXgga2VybmVsIHRvCmVuc3VyZSBjb21wYXRpYmlsaXR5IGFuZCBtYWludGFpbmFiaWxpdHku
CgpUaGUgZXhpc3RpbmcgYm9vdGF1eCBjb21tYW5kIGluIFUtQm9vdCBvbmx5IHN1cHBvcnRzIGxv
YWRpbmcgcmF3IGJpbmFyeSBpbWFnZXMuCkhvd2V2ZXIsIHRoaXMgYXBwcm9hY2ggZmFpbHMgd2hl
biB0aGUgcmVtb3RlIHByb2Nlc3NvciBmaXJtd2FyZSBjb250YWlucwpzZWN0aW9ucyB0aGF0IG11
c3QgYmUgbG9hZGVkIGludG8gYm90aCBUQ00gYW5kIEREUi4gVG8gYWRkcmVzcyB0aGlzIGxpbWl0
YXRpb24sCm5lZWQgdG8gdXNlIHJlbW90ZXByb2MgZnJhbWV3b3JrIEVMRiBsb2FkZXIsIGVuYWJs
aW5nIHByb3BlciBsb2FkaW5nIG9mCnNlZ21lbnRlZCBmaXJtd2FyZSBpbWFnZXMuCgpQYXRjaCBT
dW1tYXJ5OgoKUGF0Y2hlcyAx4oCTMjogSW1wb3J0IG1lbWNweV9pbyBhbmQgbWVtc2V0X2lvIGZy
b20gdGhlIExpbnV4IGtlcm5lbCBhbmQgZW5hYmxlCiAgICAgICAgICAgICB0aGVtIGluIHRoZSBy
ZW1vdGVwcm9jIHN1YnN5c3RlbS4KUGF0Y2hlcyAz4oCTMTE6IEFkZCBwbGF0Zm9ybS1zcGVjaWZp
YyByZW1vdGVwcm9jIHN1cHBvcnQgZm9yIGkuTVg4TSBhbmQgaS5NWDkzLgpQYXRjaCA2OiBUZW1w
b3JhcmlseSBhZGRzIENvcnRleC1NIG5vZGVzIHRvIHgtdS1ib290LmR0c2kgc2luY2UgdGhleSBh
cmUgbm90CiAgICAgICAgIHlldCBhdmFpbGFibGUgaW4gdGhlIHVwc3RyZWFtIExpbnV4IGRldmlj
ZSB0cmVlLiBUaGVzZSBub2RlcyBjYW4gYmUKCSByZW1vdmVkIG9uY2UgdGhleSBhcmUgbWVyZ2Vk
IHVwc3RyZWFtLgoKTlhQIGludGVybmFsIFItYiB0YWdzIGFyZSBrZXB0LCBiZWNhdXNlIHRoZSBw
YXRjaGVzIGFyZSBkaXJlY3RseQpjaGVycnktcGlja2VkIGZyb20gTlhQIExUUyB0cmVlLgoKU2ln
bmVkLW9mZi1ieTogUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+Ci0tLQpDaGFuZ2VzIGluIHY0
OgotIEZpeCBzYW5kYm94IENJIGZhaWx1cmUuCi0gUmViYXNlZCB0byBsYXRlc3QgbWFzdGVyIHRv
IGFkZHJlc3MgY29uZmxpY3QgaW4gZG9jdW1lbnRhdGlvbgotIExpbmsgdG8gdjM6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL3UtYm9vdC8yMDI1MTAyMi1pbXgtcnByb2MtdjMtdjMtMC05MjI3M2E4
MmM1ZGFAbnhwLmNvbS8KCkNoYW5nZXMgaW4gdjM6Ci0gQWRkIGRvYyBmb3IgcmVtb3RlcHJvYwot
IExpbmsgdG8gdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3UtYm9vdC8yMDI1MTAxNS1pbXgt
cnByb2MtdjItMC0yNmM2YjNkMTZjMzVAbnhwLmNvbS8KCkNoYW5nZXMgaW4gdjI6Ci0gRHJvcCBw
YXRjaCAxIGltcG9ydCBtZW1jcHlfZnJvbWlvIHdoaWNoIGlzIG5vdCByZWR1bmRhbnQKLSBMaW5r
IHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjUxMDEzLWlteC1ycHJvYy12MS0w
LWZiNDNhM2ZhZmNkMEBueHAuY29tCgotLS0KUGVuZyBGYW4gKDEyKToKICAgICAgcmVtb3RlcHJv
YzogRXh0ZW5kIGRldmljZV90b192aXJ0IHdpdGggYSBpc19pb21lbSBwYXJhbWV0ZXIKICAgICAg
cmVtb3RlcHJvYzogQWRkIGlteF9ycHJvYyBkcml2ZXIgdG8gc3VwcG9ydCBOWFAgaS5NWDhNUC9O
CiAgICAgIHJlbW90ZXByb2M6IGlteF9ycHJvYzogU3VwcG9ydCBpLk1YOE1RL00KICAgICAgcmVt
b3RlcHJvYzogaW14X3Jwcm9jOiBBZGQgc3VwcG9ydCBmb3IgaS5NWDkzIENNMzMKICAgICAgYXJt
OiBkdHM6IGlteDhtOiBBZGQgcmVtb3RlcHJvYyBub2RlCiAgICAgIGlteDhtcDogRW5hYmxlIHJl
bW90ZXByb2MgZm9yIGkuTVg4TVAgRVZLCiAgICAgIGlteDhtbTogRW5hYmxlIHJlbW90ZXByb2Mg
Zm9yIGkuTVg4TU0gRVZLCiAgICAgIGlteDhtbjogRW5hYmxlIHJlbW90ZXByb2MgZm9yIGkuTVg4
TU4gRVZLCiAgICAgIGlteDhtcTogRW5hYmxlIHJlbW90ZXByb2MgZm9yIGkuTVg4TVEgRVZLCiAg
ICAgIGlteDkzOiBFbmFibGUgcmVtb3RlcHJvYyBmb3IgaS5NWDkzLUVWSy9RU0IvRlJETQogICAg
ICBkb2M6IGJvYXJkOiBueHA6IEFkZCByZW1vdGVwcm9jIGd1aWRlCiAgICAgIGRvYzogY21kOiBE
b2N1bWVudCByZW1vdGVwcm9jIHVzYWdlCgogTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAgMiArCiBhcmNoL2FybS9kdHMvaW14OG1tLXUtYm9vdC5kdHNpICAgICAgIHwg
ICA0ICsKIGFyY2gvYXJtL2R0cy9pbXg4bW4tdS1ib290LmR0c2kgICAgICAgfCAgIDQgKwogYXJj
aC9hcm0vZHRzL2lteDhtcC11LWJvb3QuZHRzaSAgICAgICB8ICAgNCArCiBhcmNoL2FybS9kdHMv
aW14OG1xLXUtYm9vdC5kdHNpICAgICAgIHwgICA0ICsKIGFyY2gvYXJtL21hY2gtaW14L2lteDht
L0tjb25maWcgICAgICAgfCAgMjAgKysKIGFyY2gvYXJtL21hY2gtaW14L2lteDkvS2NvbmZpZyAg
ICAgICAgfCAgMTIgKysKIGRvYy9ib2FyZC9ueHAvaW5kZXgucnN0ICAgICAgICAgICAgICAgfCAg
IDEgKwogZG9jL2JvYXJkL254cC9ycHJvYy5yc3QgICAgICAgICAgICAgICB8ICA2OSArKysrKysr
CiBkb2MvdXNhZ2UvY21kL3Jwcm9jLnJzdCAgICAgICAgICAgICAgIHwgIDc4ICsrKysrKysKIGRy
aXZlcnMvcmVtb3RlcHJvYy9LY29uZmlnICAgICAgICAgICAgfCAgIDcgKwogZHJpdmVycy9yZW1v
dGVwcm9jL01ha2VmaWxlICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL3JlbW90ZXByb2MvaW14
X3Jwcm9jLmMgICAgICAgIHwgMzcwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysK
IGRyaXZlcnMvcmVtb3RlcHJvYy9pbXhfcnByb2MuaCAgICAgICAgfCAgNTYgKysrKysKIGRyaXZl
cnMvcmVtb3RlcHJvYy9yZW5lc2FzX2FwbXUuYyAgICAgfCAgIDMgKy0KIGRyaXZlcnMvcmVtb3Rl
cHJvYy9ycHJvYy1lbGYtbG9hZGVyLmMgfCAgOTUgKysrKysrLS0tCiBkcml2ZXJzL3JlbW90ZXBy
b2Mvc2FuZGJveF90ZXN0cHJvYy5jIHwgICAzICstCiBkcml2ZXJzL3JlbW90ZXByb2Mvc3RtMzJf
Y29wcm8uYyAgICAgIHwgICAzICstCiBkcml2ZXJzL3JlbW90ZXByb2MvdGlfazNfZHNwX3Jwcm9j
LmMgIHwgICAyICstCiBkcml2ZXJzL3JlbW90ZXByb2MvdGlfazNfbTRfcnByb2MuYyAgIHwgICAy
ICstCiBkcml2ZXJzL3JlbW90ZXByb2MvdGlfazNfcjVmX3Jwcm9jLmMgIHwgICAyICstCiBpbmNs
dWRlL3JlbW90ZXByb2MuaCAgICAgICAgICAgICAgICAgIHwgICAzICstCiAyMiBmaWxlcyBjaGFu
Z2VkLCA3MDcgaW5zZXJ0aW9ucygrKSwgMzggZGVsZXRpb25zKC0pCi0tLQpiYXNlLWNvbW1pdDog
YzlmZGI5YWM0ZDUyMzQ5NTNmZmFhZWYwY2ZjOWQ0Y2NiMDNmMGNlNQpjaGFuZ2UtaWQ6IDIwMjUx
MTAzLWlteC1ycHJvYy12NC0zNGY4NTk3MDU4N2QKCkJlc3QgcmVnYXJkcywKLS0gClBlbmcgRmFu
IDxwZW5nLmZhbkBueHAuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
