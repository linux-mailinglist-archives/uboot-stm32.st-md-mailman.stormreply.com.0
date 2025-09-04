Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 665B4B43353
	for <lists+uboot-stm32@lfdr.de>; Thu,  4 Sep 2025 09:06:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26987C3F93A;
	Thu,  4 Sep 2025 07:06:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47AAFC3F939
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Sep 2025 07:06:21 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5846pEoO006787;
 Thu, 4 Sep 2025 09:06:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 JPqdIfIfv1bFgi1xBiOJoYfkIkV68DCSv2+/nqDLzS8=; b=lmLau88+ebcGE918
 ucQearfRr7bMDR3EWzTDzakdhFq9fn8eOx0uQJN6J1FFVIBypv44W51jIsGeKb2j
 c486F8fiM5Dr5VXpNuFnhVZMOkOQrO+NQAkipe8+MjSX1hsnRcHID0gBl8AT1UO1
 8Va/CvVWM1pgA7HEmCQX7RA4Uo9NKPIoUhWi44/RRxrFbHJ1TvlZbEc1+7xtQfpU
 84IUAUUFuItu8h+3ybY5z+1xUNde48Z30hUCykDc4VzQS//8AxMudnKvPwWSl59T
 2vWHxQcwFZGrT9SyIBmpPxmT7ICPiWV8pdm7NcB0Fq/WYUhljCCAgjWWND1t942g
 jl49ng==
Received: from gvxpr05cu001.outbound.protection.outlook.com
 (mail-swedencentralazon11013056.outbound.protection.outlook.com
 [52.101.83.56])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48vav2t4de-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Sep 2025 09:06:11 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TMQL+6aUZwzofRPnaooTdHARNh01y/q37US8ZUkoNi6L+LxeWE6QbQOhnBdsbbNkv07vSPxxN5PZVCC92eFEPubKCE/WzAq7eTPClC5bxiaja/HJjslS4xGfouUrxMP44OG5P6SuX7fJ3dXAGov5lPKyfj6tEKG3ninQYh7olZc3Y8cYgKvWc/dL8C9oNra1kfRF0Mlb+0vbfB4I69QoFBlCsL19b+E6941qVzDBayunu+MbU99YrqbJdEWm8r8Dmsqdj+ZNOEAtrGti/vJsyrl/NsdjMpVd2ebSRvfWv70prvctoG/N4xDUU/hKaReyQV1z2s+rrN9hJWhqdqKQfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JPqdIfIfv1bFgi1xBiOJoYfkIkV68DCSv2+/nqDLzS8=;
 b=jQhHO3+SBX6nxd8ylQXxkOVygaJshR8CEZVpsAlfdshYEj/X7BINVuIu/lV7i+LI4V1kRvzoz8Ae+WdwYLkYP5YBtbYfcH3BKUUrZLpkTokBrI0tQ+5tBeWFCCs858ssCnDDNxAHOrwe8DXOjO2IC33PvCaI5sJhfr/cqN23B81ll7GooZFBYBXcM1E+0xgPgWCqhEZHspu7i8ZaxbSpgAknm8kwRkndOK3Ftw1yAyCkpao4couS2EaSKI1OqfuiYTO/x4c8TRdmB6FF2kSmytGo6fyLBiREvv1UEkIyoXs0JZZ1HRwTs/tVMwHWFJ7nJaSUiBOevw1JPdqJH43O7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=konsulko.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stmicroelectronics.onmicrosoft.com;
 s=selector2-stmicroelectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPqdIfIfv1bFgi1xBiOJoYfkIkV68DCSv2+/nqDLzS8=;
 b=Vy0ezifL3gdfXWo0WVBXhrvU4rN52oKSIVrh4BsUXe8ASkuUEuWVGF7Oi4jH2WA2ECQQuiq3VQfNQ8TX1G7tHoAhRpaCxgjnjRRAvatHhTY2xCmxXY5TZ/MdpMmW4jip8pV98WnwvUU17ZzepqloXLlBBSOlmQruD5C/1tyL7Dk=
Received: from CWLP265CA0433.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d7::19)
 by DU0PR10MB7553.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:425::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 07:06:08 +0000
Received: from AM3PEPF0000A78D.eurprd04.prod.outlook.com
 (2603:10a6:400:1d7:cafe::95) by CWLP265CA0433.outlook.office365.com
 (2603:10a6:400:1d7::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.18 via Frontend Transport; Thu,
 4 Sep 2025 07:06:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 AM3PEPF0000A78D.mail.protection.outlook.com (10.167.16.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.14 via Frontend Transport; Thu, 4 Sep 2025 07:06:07 +0000
Received: from SHFDAG1NODE3.st.com (10.75.129.71) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 4 Sep
 2025 08:58:53 +0200
Received: from [10.48.87.178] (10.48.87.178) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 4 Sep
 2025 09:06:06 +0200
Message-ID: <97acf44f-a1ab-42ed-a088-518c4bb92ec3@foss.st.com>
Date: Thu, 4 Sep 2025 09:06:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Tom Rini
 <trini@konsulko.com>, Kamil Lulko <kamil.lulko@gmail.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Dillon Min <dillon.minfei@gmail.com>,
 "Patrick Delaunay" <patrick.delaunay@foss.st.com>, Anatolij Gustschin
 <ag.dev.uboot@gmail.com>, Simon Glass <sjg@chromium.org>, Sumit Garg
 <sumit.garg@kernel.org>, Philippe Cornu <philippe.cornu@foss.st.com>
References: <20250903-master-v2-0-5cdf73bff42c@foss.st.com>
 <20250903-master-v2-7-5cdf73bff42c@foss.st.com>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <20250903-master-v2-7-5cdf73bff42c@foss.st.com>
X-Originating-IP: [10.48.87.178]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A78D:EE_|DU0PR10MB7553:EE_
X-MS-Office365-Filtering-Correlation-Id: e8992e9c-ae12-4fc5-9087-08ddeb81852b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MjNhTTFVUDdZVm1zRVBKNGwxRVFTQzVlQWg0dnFtTnJVQVFYdkdocDlpekZC?=
 =?utf-8?B?MDlWY1RuZktkWGhWanNTVzdzL2FEb1RPa3pPakJaSVd6SEpqekFLRlkxRGYr?=
 =?utf-8?B?WUQwMzQvdTF2Q2pIcmU0Y1ZZSTFLRFUydUdndzllZ0I2NkhacitrRHpKTVB2?=
 =?utf-8?B?Ym5BRGtvbzFxTkdhVEN2TFlSZ1pLNzRtZko5cS9YdHpSM1dGSFlsQU5Xd2Vy?=
 =?utf-8?B?MDl3eExVcGxVV3BnaVBQMWZiN3dwMzJIVnAxY0F3RUFnVmd1S1Y2Umt3ZS85?=
 =?utf-8?B?ZlE4ZDdIZkIrT0FhVTBXYzZBQXJyb3BtL2JwSDVTZ2cvVi9oOFY4RjduVlVu?=
 =?utf-8?B?VW45SmNWblMrUkVOTFJLMURETWM1UFZobHFCQXkwZWh4b0U3K21EaDdXclQ0?=
 =?utf-8?B?UU1wVUN2eXVlTS9SOWR4ckhVWkd2WldnaGtGS0RQNkxwaDY5d3hJZlpKOHJN?=
 =?utf-8?B?TUU0eHNxQVE4TDBvVmRaWkllN20rWFRtS3I4TE9wNEt6YmhIY3BMVG9aREw1?=
 =?utf-8?B?Wk8xeXRMZGtqaWdRbWU2WFNobXpUcFVHSS8rQjVIdmFqMTIxSnFVK0ZlY2Mz?=
 =?utf-8?B?UUUySk5TV1ZmQlpMTzRxWkJXNFFXY0lSL2FHRkdCN1FreHhpNWtUUktaSVJn?=
 =?utf-8?B?dUQyaHB6ZjFCOS9GTWE1YUNQWDVYa05ldk9qNjRBZGxaWFFIeG1ydmtuVzh5?=
 =?utf-8?B?YkoyOGdjTG5OZXRtZjlRWkFwNnF3WDhZb2J6aVRYRXNqV1dkVDRUYmdwT1Ri?=
 =?utf-8?B?QWRMY3Urbi8ybWsxZHcreG5pMkhLZzdiSWZRd2U1QXpxYUlZcEZzMHpMTzh1?=
 =?utf-8?B?V3JMWnk2Tnd4Y0RBb0U0ek41RTYySVR3MjV2dENSRnkreVY0VG9ISjJtWVNH?=
 =?utf-8?B?NnBIalNDODRLK2dsbStsWUlUMXJlQzB4N1lQajRmbDVWR3FuS2RQVHhPaHRy?=
 =?utf-8?B?M3laaW9TL0dyWjEzMWFHWVk3Zy9xQTVnekhjZm81TFNqbUhTSFEzZ3lRNDVZ?=
 =?utf-8?B?enVXNFBMK1A0MHBzK3UvYUFuMTM2NlRsNkx2MnU3d3RTU2N4Y0hwRHJkdkU4?=
 =?utf-8?B?emZ1cVo2Z3NuNiszV1pvQklIaXBJWEhPV3ZlS3FMWkdhc0hjVFo1aXNYd1Mr?=
 =?utf-8?B?b2YwcEZUM3R5OFB0UnpRN0xqc0JyaDhUNnh5MCtOdW4xY3JrUk1EWEV2TlIy?=
 =?utf-8?B?am8ybW9CaDBGa2FFeG9CTXB3M2ZzRGsvb1NNbTR3SmN5WUZzUWpOczJJd1Ra?=
 =?utf-8?B?Y2FyUHBBd3poNS9HM3E5TDVPdnFlU2pGMUkvVmVPU01qOUN2YUQxNGw5aDl3?=
 =?utf-8?B?S2JsR3VabFpUZ1ZJdTdJb0xoZDdMbkY5L3BNUWFDSmo5ZVRwdDVKSGVkVkkv?=
 =?utf-8?B?Vld6ZnhOTVlobVNaR0hYZGllK09TcWtuWFdGNEhDdzQyUlMwSGN1U1FITjlk?=
 =?utf-8?B?WThoMWhjaThQK1NsT3ltYlJaU2FJV1NLYkhGN09UWU82S2NtQXZDVGdBVXRC?=
 =?utf-8?B?eXI1TEZNM3BiSEdabElSY0hHODJWeUZOSUFud3lWL0xWYW1IMjMvMUgzZ1No?=
 =?utf-8?B?OUJpc295UFB4NHVsV28rSTNQVlYweW1RdWUrekJHTko3amlzVVYyWThMdDRt?=
 =?utf-8?B?N0c2eFBmUXl0bUQyNi9XWVdJQXlhVWsxdXU4RXhkS256UGFjazlYc1pHdGd2?=
 =?utf-8?B?aDJFbXo5L1BjVkxmMi9BYXJjRWhlVnltbkZDK2xBV1NvdS9kYVZ0Mk1YdmFP?=
 =?utf-8?B?TzNRak1VTXRaZEs2dldxbUoxaDFuZTR1N3ByM0owUjdsYXlGbXN4b3BBTkgx?=
 =?utf-8?B?dGtwTHNibXpLVXFiTVlLUEhoaExKWjRGaVpiZytqdCt2a2szU21DWFdCT29t?=
 =?utf-8?B?elNOM1dFZUxRVC92U3N4TkhJSTBIWmhHc0cvSnNyaG9IRHFHNjJpdThqcTZI?=
 =?utf-8?B?YVZ5c01Fd0QrOEF2QW1MckNiY2xSZSttWDI5eDRydldqU0tQbFlpQmc2Zmg1?=
 =?utf-8?B?Wjh3NXZDUGJ3MGp5ckRpQTAzYkJuQVNBQWEySlFnUjhWdzBRcGt1UC9VN1ZI?=
 =?utf-8?B?TXlhRHFJR3Y3MWxtZ21Kck5CQ1lVV0dOUFU4Zz09?=
X-Forefront-Antispam-Report: CIP:164.130.1.44; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(921020); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 07:06:07.3165 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8992e9c-ae12-4fc5-9087-08ddeb81852b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.44];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A78D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7553
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDI1MCBTYWx0ZWRfXwOmaWsKz1Bln
 hloTgBDsghtI5rY4aKsF+6Of+PoJSAKSdoP7PSKK2X15jHVhnseYNP8YnhJD92tTxuaLV1fE4Tc
 F9EC7DqKMw5T7YwoViNEhnX5dC23WcX0S8uR9XOL8rRWev5B/QpXGsTV21EM8ZP9lQkQ32ekMwz
 L3J8vmqNugL1mNUWHZX6kSpfcLEBNq3avQYxHz3DmFuD9RTUJgUX9Np35GeDHOcY6Ov3FHTplOE
 Sgdhhnsk7Ts3oqTPm/QnUEBRm4pe5ZmPOPmrJ5zI+TuBOOfaZBX5qVLQFyCJb6W5ue1hQWsTUOH
 zGcyxsqgakp1uijH90vM7H7PFFbxwoFrioeeCRapmrCpVD2a5hn2r/m2kdy+dHtmeqaXJr+gYcQ
 zH4ox97p
X-Proofpoint-GUID: BXAZDxUqP1NkciV-2Reh5OQznvU7WRWu
X-Proofpoint-ORIG-GUID: BXAZDxUqP1NkciV-2Reh5OQznvU7WRWu
X-Authority-Analysis: v=2.4 cv=bchrUPPB c=1 sm=1 tr=0 ts=68b93a64 cx=c_pps
 a=QECycBtlB5c96Rqh0X4T/A==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=P2A4Zi-lJHsA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=FUbXzq8tPBIA:10 a=8b9GpE9nAAAA:8
 a=mEGgFpeMVL09x6plPeYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 clxscore=1015
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300250
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH v2 7/7] configs: stm32mp25: enable LVDS
	display support
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
NSwgUmFwaGFlbCBHYWxsYWlzLVBvdSBhIMOpY3JpdMKgOgo+IENvbXBpbGUgVklERU9fU1RNMzIg
YW5kIFZJREVPX1NUTTMyX0xWRFMgYnkgZGVmYXVsdC4KPgo+IFJldmlld2VkLWJ5OiBQYXRyaWNl
IENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBS
YXBoYWVsIEdhbGxhaXMtUG91IDxyYXBoYWVsLmdhbGxhaXMtcG91QGZvc3Muc3QuY29tPgo+IC0t
LQo+ICAgY29uZmlncy9zdG0zMm1wMjVfZGVmY29uZmlnIHwgMyArKysKPiAgIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9jb25maWdzL3N0bTMybXAyNV9k
ZWZjb25maWcgYi9jb25maWdzL3N0bTMybXAyNV9kZWZjb25maWcKPiBpbmRleCAyYjAyY2Q4NmQ2
MTM0NDk3MTUxZTM5OGViNTQyMzBmMDhkNGU2MjcyLi5lODRkZjRhMmE4ZjUyODkwMzc2Zjc2ODli
MDFkM2RjYWI1MDc5ZWQ5IDEwMDY0NAo+IC0tLSBhL2NvbmZpZ3Mvc3RtMzJtcDI1X2RlZmNvbmZp
Zwo+ICsrKyBiL2NvbmZpZ3Mvc3RtMzJtcDI1X2RlZmNvbmZpZwo+IEBAIC03OCw2ICs3OCw5IEBA
IENPTkZJR19TRVJJQUxfUlhfQlVGRkVSPXkKPiAgIENPTkZJR19TUEk9eQo+ICAgQ09ORklHX0RN
X1NQST15Cj4gICAjIENPTkZJR19PUFRFRV9UQV9BVkIgaXMgbm90IHNldAo+ICtDT05GSUdfVklE
RU89eQo+ICtDT05GSUdfVklERU9fU1RNMzI9eQo+ICtDT05GSUdfVklERU9fU1RNMzJfTFZEUz15
Cj4gICBDT05GSUdfV0RUPXkKPiAgIENPTkZJR19XRFRfU1RNMzJNUD15Cj4gICBDT05GSUdfV0RU
X0FSTV9TTUM9eQo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL3Vib290LXN0bTMyCg==
