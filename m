Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E780DB43337
	for <lists+uboot-stm32@lfdr.de>; Thu,  4 Sep 2025 09:02:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADDE6C3F93B;
	Thu,  4 Sep 2025 07:02:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 916BFC3F939
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Sep 2025 07:02:48 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5846YF7b009920;
 Thu, 4 Sep 2025 09:02:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 ly8cVADNlIEQ48JE1bO7ly1qv9bQnSeUZSfDyRqOZwk=; b=wkS6sbLaDZHFtmHC
 WnRq/O4IHYPnbI8jb4d0Gotte54vXFuPWGNZuAi0rMkzZkhdzUKtkYWt0cdaaayp
 4R7JMgipt/MJg7YBPLuM+K+eVX5KqJ7eLXq8QWXQpo2xaszBP0RozTW02YvwXgjY
 UNOr/ly4PtB1ut3rDSHjKeuA8AjA+IrOxV1q6VyMNBXubhd1dZ4RKsDhq3/9HKtJ
 XGVK9EWj+jQy9oe5QD48nmL46WshnndqMg5P1ebQjIfd5AvHrCTR5eOHwyyEVU58
 YD+yp3r4ZC0RfUbHeuIcYz9RPhIMrN2hpWooinLretsIcqEVOICc59diuVHv32Po
 gfxKCQ==
Received: from pa4pr04cu001.outbound.protection.outlook.com
 (mail-francecentralazon11013002.outbound.protection.outlook.com
 [40.107.162.2])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48vav2t3n3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Sep 2025 09:02:39 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=McUAaaN/Pu0ApB38Vm8mOu4mGZmjOQ/ee7xUYJH8x9HgDGvz6nwYiAggj34f377bKtL2qtAqQlWroVAtTvodRZh03R+OcpkrawzzlQOykjvcDZS9HKeJ8zLmZaU4yXL8egFjDJ2aqmBdDfb8JGEZQhKDYZPrUFNacf9g3O6Z/qX2InUlrWjao9cN9x7ICK33z9DxG9M0Qu5yJTCWy4TRBmpuwe4xy4grgkTSygWoUlmPgmIgYZLBzzPUfCcHSbTehMgFlbzEIcaEVRSWyWANS9UuuU2e+YymhKSIu3eo6cu3UeY71rRxX6BXtXfwMnu/sQkd6kEf2QJ357a+7QkpnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ly8cVADNlIEQ48JE1bO7ly1qv9bQnSeUZSfDyRqOZwk=;
 b=pgF0gR4tMOH9WAoXPJoBlKuTH5+s32+br1PI0QDvmdvTXdjNNdTKVnp2eiDpVmFRkSHVy9RNwjXeYNe/tiuQWsz0LXOx1KkpAN+p4iFDtaGmMsUQphzzqHBu+Z+5QhteCjg6/tebbBcOU4IA4zQzGAu2VP2sZRqFh8nm+Zlik4U2Y7Pp1qWTr7S1PJUTwPc2I78Q/I1aqba86mn5UFHANSiGM6bTgBNq0bAF55LkU8kVK9p+OWvPr/rqCJjTxgqXqXQDw/J0QjpbxQSId5V49CrWgbZ+fw6pJocONgtU/Eusm8uGMzOI2allkvPWYhriZyADV9O4egdiugx0XTVsAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=konsulko.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stmicroelectronics.onmicrosoft.com;
 s=selector2-stmicroelectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ly8cVADNlIEQ48JE1bO7ly1qv9bQnSeUZSfDyRqOZwk=;
 b=maZe8ul+ChgZYNHajGGpw02tq0zs83NKfeqqCNHuGXtWzTBvZb1igL/AM4IVLjOF2D06H5g02hx8kLH0WtHJG80zfbk1jW4znadZjzh3U4FFnhjipFQdhMHeV2NNu3aUPsNWHg912fEcdDpZj9KEfPggjn9D9MiFj9MUIQSxPYU=
Received: from AS4P191CA0001.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d5::14)
 by PAVPR10MB7115.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:316::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 07:02:37 +0000
Received: from AMS0EPF00000194.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d5:cafe::2c) by AS4P191CA0001.outlook.office365.com
 (2603:10a6:20b:5d5::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.18 via Frontend Transport; Thu,
 4 Sep 2025 07:02:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 AMS0EPF00000194.mail.protection.outlook.com (10.167.16.214) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.14 via Frontend Transport; Thu, 4 Sep 2025 07:02:36 +0000
Received: from SHFDAG1NODE3.st.com (10.75.129.71) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 4 Sep
 2025 08:59:22 +0200
Received: from [10.48.87.178] (10.48.87.178) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 4 Sep
 2025 09:01:39 +0200
Message-ID: <cb1b3a0e-8909-43a4-87cc-81bf293726d8@foss.st.com>
Date: Thu, 4 Sep 2025 09:01:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Tom Rini
 <trini@konsulko.com>, Kamil Lulko <kamil.lulko@gmail.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Dillon Min <dillon.minfei@gmail.com>,
 "Patrick Delaunay" <patrick.delaunay@foss.st.com>, Anatolij Gustschin
 <ag.dev.uboot@gmail.com>, Simon Glass <sjg@chromium.org>, Sumit Garg
 <sumit.garg@kernel.org>, Philippe Cornu <philippe.cornu@foss.st.com>
References: <20250903-master-v2-0-5cdf73bff42c@foss.st.com>
 <20250903-master-v2-2-5cdf73bff42c@foss.st.com>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <20250903-master-v2-2-5cdf73bff42c@foss.st.com>
X-Originating-IP: [10.48.87.178]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000194:EE_|PAVPR10MB7115:EE_
X-MS-Office365-Filtering-Correlation-Id: 16baac78-0db0-4add-11b9-08ddeb810793
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NUtxZzJNRXRsNjhSbUF3NmxodDFxVU12dHMyN1NCaVpXNHVBOW9DUWhWNkJB?=
 =?utf-8?B?aVB2MVg1UitITjNiQ01qSUFzMFMxWWFydDNDb1pXL0czbVZDL0xMRk1wcDVt?=
 =?utf-8?B?TkttSmZrZDVoM0taNjdQTWdvUmwxZkp3cVFRYlU0ZHJoT1E3YkliajdTZURQ?=
 =?utf-8?B?a0p0WUxjVFFObnNOQTMyTm5ieWkyWGxRelZQU3pTRGp6b1VQQnpkNVFTVmNP?=
 =?utf-8?B?eXJEQmtEM1hJUnAyYW5WY3N6QjVROGY4M0F2OHR2NFhRRTduYWw5YWEwU25q?=
 =?utf-8?B?TzBhWjlQVmFGc2E0TnZBODk5S1NFWVhqQUlDSHZFaHF1RkxrdzNnOVZ0YWd6?=
 =?utf-8?B?WFEyK2pvWVVUbHI5SDg1OFlKc1pzQmxvanlSeFQzalVSUzlobkhENWtnaitU?=
 =?utf-8?B?UFBvdlVVTkFhb1FoODhnVGI3UlQ2eUZKM2V4dTdIcXpoMStxR3RuSDhmRk53?=
 =?utf-8?B?bkRGV3Mza0pET2pSM3JWUzRDeXVla1JZUEpZVFRTT1lvSXdHR2g2cEU5dkxl?=
 =?utf-8?B?T3lSaENlYTI1ZFlGZHB0dWVGREszZ3g0S2t0enJrTVE3QnlQVzRKbFlUcTZH?=
 =?utf-8?B?Z0pTWFBpRWl6VXVDNU1Jd3VWOE55RWVMZ0pSNVRPd2tUVWlWTzE0UXZmeENL?=
 =?utf-8?B?RU1PUTdJTnJLQUlhaENkZGlyTFdZZWpFZE4wcGRsU0I4TlpPYzd4emthQmFj?=
 =?utf-8?B?MkZHQTh5SUpmK044SGNsWXppanhTeFExYVF6Nlh6WEd2Ry81cTh3RExTbktN?=
 =?utf-8?B?bHBJekZtQTBnVDNVcm1VRGQ0N2JtTHhLSWwzMkxxVTM0Q2JOZWpQbXZXdktS?=
 =?utf-8?B?TXo3aDdscXZzN2VvZmNWMlRPOEZxb0NCM2tFS1ZBZWNwM2ZrSStHUmIyMDgr?=
 =?utf-8?B?SEhSWkZSVW5xY0xwNmxyclpTUHRjUEI2cGpESjU0NjV1a2d5Qmc4VUxpdTJC?=
 =?utf-8?B?dU9CQi9RVDlSdXlNaVFrYytSUlZEbTQ2NS9aMTF4YUV6TDJtNzdMR0Vaa2hY?=
 =?utf-8?B?S2FUT1hQdVEwSm5Nb2xhVEdNL1hpS1E2djZVejJmVjZSWlc5c09tSEdGMlNF?=
 =?utf-8?B?SkNKbDQ3R09WdU1XK1JTMVVlWGQyM3dUVmt4OURQUDg4enkwRlVnTWVlQmRz?=
 =?utf-8?B?bTdic21Ocy9Ua3h1ZmdjOHQxOWZUSzVkT0ZWZnVDZXR0eFZKVVZKTVJTdGJv?=
 =?utf-8?B?RnV2ZUxUSGtHejZhTStxV2o4Mno1NFBEaTY4U04zRUR2VHc1V2llNXBXV3lW?=
 =?utf-8?B?bGN6ZjRJZm1BVnZFaFlra2k4akNYVmVicElDOGg4VlJTVW1jcHhyNDZQd0NH?=
 =?utf-8?B?dkVZemJSOEhzaitrM0lRQ2ZVV2c4ZzEwTk56d0pKSVZLTGRML0M4NG5SV21H?=
 =?utf-8?B?VmNlbFVaNXdDQWExQUJWSDVtWWNhdzYzWGQveXpYOGVHZ0RMMUs1VFBaei82?=
 =?utf-8?B?T3dtaXBHSzlVWEI0SEhzeFlENkFLOUV4SjJ4ek5wYkpQVVNITm9SMi8wTXFs?=
 =?utf-8?B?T1orRW5nbEdueENXS2tjbnd2Tkoxd0tTbVltQ3hMZThqYXRoRURvTjJaVGJx?=
 =?utf-8?B?RUFiQXdCNkl6RVhlK3dHYWovQmlCYjBrenVTbDBQY0hEK2NaVXJOc0dCc1pj?=
 =?utf-8?B?OVFTVXVSMlpaTEJwZjVVQ3l5Uk5QdUhPOE43MHFqdllPNkJzWHh5SGF3eWxU?=
 =?utf-8?B?aGJ5Sy9tVEg0cXRIc2FHUzMwbDZ3SjNvMUw0UTB3NDVZNGt4eWZybFZ5Sk5S?=
 =?utf-8?B?SnRVRU5tT0ZvejdIWkZHeGNDKzU1VVJ5bGdNNkN0K1NCVTdJc3R4c1BkcUtx?=
 =?utf-8?B?RDA5dmZhTEcxM1hIUW1kVFYzL2F4cml2UnBEeFRuUGRtS0VKMkViTjAwaTA1?=
 =?utf-8?B?UHMwMCtJeUFhSzVEQlpBUXFiSnFwZXlDbFA2QWZjUldDQzZrWlVKc2x5RnBj?=
 =?utf-8?B?LzNhOWlHaVBKRWNVcWVjcUJwT280emFJNmI5UnRwN1ArMlJ6UkFrNEt6ejY4?=
 =?utf-8?B?cnJTem9wSnpqazcrWGZKcG8rQWdLZFIzWXJpcVU0bjFxYStKRWR3TytIaHdX?=
 =?utf-8?B?b29LMENlY0JUeWJuelNvSjVaYVNkUW5UajdIQT09?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(921020); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 07:02:36.6016 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16baac78-0db0-4add-11b9-08ddeb810793
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000194.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7115
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDI1MCBTYWx0ZWRfXz5ktLc+qiHUS
 WjdoyMFgE0wQp1ViB3R/D5QhVr1XuzX742lDihcb9aeldGFQgCSjSkBex/LF0RMHCsZsW9DQtFv
 tUZZSnHBismjluHAhzt2IZ71ztbSW97tcI1icc54VQXK/8RY2WcedChU38WH5Zw1zvBjlJ1ld6S
 E8vbeW0Sro7+Oekz1id1ILTtO8GzH0lpAY0aUhIiftbqlyntciryxrdre6KAe+epo7cYwWgKXSc
 3EEXtmNmXPy7Zo9ZBSRSQIeuAfRMF77dNXB8PUv6/brcvF8xcGl/GcDAK/mvzZkSXbTu04Hgd4C
 l1XMdK0zeb9jFsivZPp0DcSrMHvz6gTfGAgFhkNcUBd570bxZoQM2WYremCwEz4rq66dUDRM19E
 NTZ9AFLF
X-Proofpoint-GUID: o8AeUg9wcNmBdb8ARfx_TCAAYkwAlB99
X-Proofpoint-ORIG-GUID: o8AeUg9wcNmBdb8ARfx_TCAAYkwAlB99
X-Authority-Analysis: v=2.4 cv=bchrUPPB c=1 sm=1 tr=0 ts=68b9398f cx=c_pps
 a=hVkbKOSgbXxpVlUS3DC2SA==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=P2A4Zi-lJHsA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=FUbXzq8tPBIA:10 a=8b9GpE9nAAAA:8
 a=5-UEqyCUgD__VgFuBE0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 clxscore=1011
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300250
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH v2 2/7] video: simple_panel: add support
 for "panel-lvds" display
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

SGkgUmFwaGFlbCwKClRoYW5rcyBmb3IgdGhlIHBhdGNoLgoKUmV2aWV3ZWQtYnk6IFlhbm5pY2sg
RmVydHJlPHlhbm5pY2suZmVydHJlQGZvc3Muc3QuY29tPgoKTGUgMDMvMDkvMjAyNSDDoCAxNDoy
NSwgUmFwaGFlbCBHYWxsYWlzLVBvdSBhIMOpY3JpdMKgOgo+IEFkZCB0aGUgY29tcGF0aWJsZSAi
cGFuZWwtbHZkcyIgZm9yIHNpbXBsZS1wYW5lbCBkcml2ZXIgaW4gVS1Cb290LiAgSW4KPiBMaW51
eCB0aGlzIGNvbXBhdGlibGUgaXMgbWFuYWdlZCBieSB0aGUgZHJpdmVyCj4gZHJpdmVycy9ncHUv
ZHJtL3BhbmVsL3BhbmVsLWx2ZHMuYyBidXQgaW4gVS1Cb290IHRoZSBzcGVjaWZpYyBMVkRTCj4g
ZmVhdHVyZXMgKGJ1c19mb3JtYXQvYnVzX2ZsYWdzKSBhcmUgbm90IHN1cHBvcnRlZC4KPgo+IFJl
dmlld2VkLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4K
PiBTaWduZWQtb2ZmLWJ5OiBSYXBoYWVsIEdhbGxhaXMtUG91IDxyYXBoYWVsLmdhbGxhaXMtcG91
QGZvc3Muc3QuY29tPgo+IC0tLQo+ICAgZHJpdmVycy92aWRlby9zaW1wbGVfcGFuZWwuYyB8IDEg
Kwo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy92aWRlby9zaW1wbGVfcGFuZWwuYyBiL2RyaXZlcnMvdmlkZW8vc2ltcGxlX3BhbmVsLmMK
PiBpbmRleCBiNmM1YjA1OGIyZTk2N2JiYmQ0N2FiM2MzY2U1Y2E1MmM3ODA0NDA5Li4wZjIzZGY3
MDFiYzNjNDBlYTQ5MzgwYmJmYTM3NDNlZTU5MmQ4YmQzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
dmlkZW8vc2ltcGxlX3BhbmVsLmMKPiArKysgYi9kcml2ZXJzL3ZpZGVvL3NpbXBsZV9wYW5lbC5j
Cj4gQEAgLTE5MSw2ICsxOTEsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG1pcGlfZHNpX3BhbmVs
X3BsYXQgcGFuYXNvbmljX3Z2eDEwZjAwNGIwMCA9IHsKPiAgIAo+ICAgc3RhdGljIGNvbnN0IHN0
cnVjdCB1ZGV2aWNlX2lkIHNpbXBsZV9wYW5lbF9pZHNbXSA9IHsKPiAgIAl7IC5jb21wYXRpYmxl
ID0gInNpbXBsZS1wYW5lbCIgfSwKPiArCXsgLmNvbXBhdGlibGUgPSAicGFuZWwtbHZkcyIgfSwK
PiAgIAl7IC5jb21wYXRpYmxlID0gImF1byxiMTMzeHRuMDEiIH0sCj4gICAJeyAuY29tcGF0aWJs
ZSA9ICJhdW8sYjExNnh3MDMiIH0sCj4gICAJeyAuY29tcGF0aWJsZSA9ICJhdW8sYjEzM2h0bjAx
IiB9LAo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVi
b290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL3Vib290LXN0bTMyCg==
