Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7314CA7A6B
	for <lists+uboot-stm32@lfdr.de>; Fri, 05 Dec 2025 13:53:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81B68C628D4;
	Fri,  5 Dec 2025 12:53:46 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27676C01FB6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Dec 2025 12:53:45 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B5Ci5ex2574912; Fri, 5 Dec 2025 13:53:23 +0100
Received: from osppr02cu001.outbound.protection.outlook.com
 (mail-norwayeastazon11013051.outbound.protection.outlook.com [40.107.159.51])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4autdg1gt3-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 05 Dec 2025 13:53:23 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T4m7SzEEEJqtvh8lXpE+zyRfyCGbG5da+alGI5zC6oXkmlSubamZx3LtgRgghzBl5glxpJFYINB8YGM/Rla/KBU30Uso3RHoPfmK5Ug4C3075Tff3OVA07sQwooWo7fT8c6NApwYM27SlBPCTK+AYny8oO1F9sO+/3swScXerUM6PmkQT9obvQGwXoRdBJAbF5HLdjcmxdpWnVbBCV0FAzV0XpLDSlLyta0nKPwqhsE1twVrRGp3rXQOr7QW93ORonq+yLpeHQmhJMEt1kkVr6VfYbpZbkhluMcTNP/eKEluAzClIZQSwOuYGcA0gvv3+tFpg9k1TIk2LuW82DWY5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kyA6BsNmboX+xNbc5W7W+ATOoDuDhD7S96d72yuI/xU=;
 b=hoxAVf9yl5+Az50mivxAUDgWej/lO/KHc991y5GiCsMj3KdfM6b5CD6Z7bnXJV/sNMP45wIouHOSbHEDBGsB34Ssr193KbYpOs5g87y2ksgFfxOEw5CQ22MGb2BfpIlRDS0okKvmR8ZfqWd0TxG1ZdsyKyfm6NABPgB9nmzfhk3mN80UIW6Fs6sxFQuvKulVXsfGsikY/N+UDQC326ZRQvS+nLWcwKcUSH2RjUk4wCP0F9iMf88dc2qe/CqHYglcfnIQqpDKxDlngWPFSwE8HncNiCJ7sxL6vj/aWY8nxzPLfby7Md3RuhkbgZZ+Tdtz3LU8aiK57C6129QsfkKASg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=mailbox.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kyA6BsNmboX+xNbc5W7W+ATOoDuDhD7S96d72yuI/xU=;
 b=A0Yf7Rl1r2GMN/xnghZr2ZE5mwhT8gnG6P/OMD5FRbkl/p+8xuOtL7sO4336SjNugp9AO9YGyHCujs72T3UiGRpFh+a0WPojsGKJOXUT29bFgV4/EtpPxBKAuus69hyWiIYDdTn9BZKmdRIIZHnHwU/7//QAzw7TpuJJpf3fNnHKhi/7mgT5kTWUuJlSBxtx9czM8+OmQEWPf4nvAIwbIm5zC9PwOMI7FjhKnP9P9ivzXM1HZACdNoJeGWaIZ65tJCzVAYVjyCAzR1uiTA5QOPrCWcTkOIE6L2KeXlF3yPzhNkTSwFrMjwLJw+aA12ZWNjvyn1/GOKFi35DcYDm9FQ==
Received: from AS9PR06CA0551.eurprd06.prod.outlook.com (2603:10a6:20b:485::12)
 by VI0PR10MB9010.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:232::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 12:53:17 +0000
Received: from AMS1EPF00000049.eurprd04.prod.outlook.com
 (2603:10a6:20b:485:cafe::3a) by AS9PR06CA0551.outlook.office365.com
 (2603:10a6:20b:485::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.11 via Frontend Transport; Fri,
 5 Dec 2025 12:53:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF00000049.mail.protection.outlook.com (10.167.16.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Fri, 5 Dec 2025 12:53:16 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 5 Dec
 2025 13:53:54 +0100
Received: from [10.252.31.202] (10.252.31.202) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 5 Dec
 2025 13:53:15 +0100
Message-ID: <d6cf3bbf-3539-4dd0-a1a6-99379d1d1a95@foss.st.com>
Date: Fri, 5 Dec 2025 13:53:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Marek Vasut <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>
References: <20251118231933.577980-1-marek.vasut@mailbox.org>
 <d6a28dfd-9b28-4231-8dbb-8c5c09f0bc9f@foss.st.com>
Content-Language: en-US
In-Reply-To: <d6a28dfd-9b28-4231-8dbb-8c5c09f0bc9f@foss.st.com>
X-Originating-IP: [10.252.31.202]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000049:EE_|VI0PR10MB9010:EE_
X-MS-Office365-Filtering-Correlation-Id: d0748f23-31c8-458a-052a-08de33fd4261
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z2p6S1dBNHJwbmNxTDZ3MG03RUg4ODhtTWNoNnFGaDN1Y0tuRkkzeVU2ejU1?=
 =?utf-8?B?N3NQVktlTEdYTEh2M2Jtcmk5YUVBY0ZsaHBJWUJmZ0JZUnJnQ0JYbU1hUnZ5?=
 =?utf-8?B?b0FZWVVKcnViNk8vVVkrdUxkNXFYQjg1SlBQWTZWN3ZVQjNGSVVzMnFlZXU0?=
 =?utf-8?B?TXBlNGRVd3hvdnlJelVCRWROb0pybmtVQkZINWFpNUhkNWEwTWY2SkdqTW0v?=
 =?utf-8?B?TkN1REYrSzV4UmtrUmJVQjM3MWk4OWw0TEJjUS9XOVkzY2dKUTBRNHRZSVB4?=
 =?utf-8?B?dHMvQnFwMjVQM09RUWhLZWxqd0RGTU9IdDVBZXJGcjVyWHdVbUJJMHF2MGcr?=
 =?utf-8?B?ZFZDM3NRakdPUUs5REYwcGRaRERFeHB4dWloNXhLNExTZTVtTmg2bmk4OUhv?=
 =?utf-8?B?dFRla29tREdZUyswTzRnc0ZMS0paa0hxY1JVU08rR2RSNjN1ZkhZSVRnRFEv?=
 =?utf-8?B?alMvWWdpWVU4RnhtR1IwZ0paTjd3b0NXd0lnSWE1WHdBaTVZWFAzVUY3aEJ3?=
 =?utf-8?B?RnJ2MmRydENlYTNIeVlVTWhteEFRcUhFQjhJV0hlNFIxZ3hQVWZTTm5kb3Vn?=
 =?utf-8?B?TlpBdmlXSGsrSkNJNitpeXcvT2dQM1JFS1o4b0RIMHE0WEZMNW9jWjFXNFoz?=
 =?utf-8?B?NmVhZmtmRWQ1ZnZESUtPRElTVGdreGhzakx5dEtPK2tnenZFNVhEYWlRZ2VM?=
 =?utf-8?B?ZXhVd3YwSjFtZTNqQ2F3K1lrMG5nMkdxcE9Dck9zQnRXa1pPV1FrM1A3ek5H?=
 =?utf-8?B?aGZqdFc2LzU2NldaK2d4LzdCMmlqdkp1ajd3WTZ0OHJwQ2I5dUVTcVI2cWRR?=
 =?utf-8?B?Qmd5T2NBa1lQMFFDK1NxL2JsUXRuNTY2aGEvbldrcnh0QVlUMkxtVUhCaUdU?=
 =?utf-8?B?djYwYmdUYlphNlpYb3VaSWhyQm5oRGR6aXVvd21TM1pQNCtsZjhaQ2cyTlkv?=
 =?utf-8?B?dUREZkhJU1NTWlRhelNWQmdyMUw3L05EUUc1Q0dNVUVNajB4ZjB3aUo5Y1Ex?=
 =?utf-8?B?VnNobW5zWGZmbEEyYy8ybDZoRmNycjk5Rk5yY2htdGNQdEJZR1J3VVExTi8x?=
 =?utf-8?B?MnRPODNaQXROY0dBOTJJTmRTT25JZXBnb1FaZnZ3bGpoN0VRTWNjRm8xaXpL?=
 =?utf-8?B?VWJ1RWUwREFZT0pEeGtFa01xcVhyWmNuaXJ2eEQxOU4rdXJEZEFQRDd1MkNx?=
 =?utf-8?B?KzVHNjNvQ3U1MWVFd1ZDS3oxNnNidUx0YzhtV2F0SWlxQmZpck95MHF1OGRW?=
 =?utf-8?B?OThlckhZT0Y1S3o3Z0lIMjcvdGQwREhTQmhORU9DNXZoL3oxZGVyWGpXREUv?=
 =?utf-8?B?TmtoMzZIZm5qVlFKS21mWHhmdWZReGsxTWMwYW8yeGVkNFlndG5FYTJna0hS?=
 =?utf-8?B?ZFc2clYwYXhHT1lIc1NtVDB1R2JIR3RYaENORlBlODd1UVQzUGRoQ2RXc3U2?=
 =?utf-8?B?ZHBKUkNnRW1xWHlnVW5JQUVUeTFTdHFnS3kzWEovdU5kYndPY242K3lPa0d5?=
 =?utf-8?B?N25oRTdoRzRDTHdzUVZ6YXVNVEpPY3R1ZkNwdnFIblZ1OE13c01WbXNyUjBv?=
 =?utf-8?B?YUwrckd0elBzSjBabG9XTm9vR1ZNSERBWVhmQVNzNkxKanZwakJ4dWEweFFW?=
 =?utf-8?B?TWxDMFZob0ZwckJOc0VNczBud0N5ZlZ1RTFnekdJWGdvajkxNnhCL01ZeVlj?=
 =?utf-8?B?K2VQTFFVbWdYVFlpMWdkUjU1amV5Q1kxb0JJc0gvVlpGeEpqL1kwWmFvZUJP?=
 =?utf-8?B?Z29pVXVFcCtBK0VTQ2M5ME1kcG14M2pOSVN1QnFHbTNSMjhjd1Z4RFJtQmNy?=
 =?utf-8?B?VzVuVXBJVU5Xd3RLN2kwTWI5Y245eEVHMXlvS3MvelY1Ky8rOU9VWFNNekdp?=
 =?utf-8?B?ZGl1SC9aNHJSUllMSWFnR3c0dEJpZUJ4dTRIQzRBN0pLVFdhOHVEeWlwcEJO?=
 =?utf-8?B?ODY2NFhxWjRTTG0veWRxNFczZkZSREFyT1ZsVXpzQ0RiVGFGNkxZaWhWUXlQ?=
 =?utf-8?B?Q1pLNmdmbHBQS21XQkJldWVSSVNPdTEvM0JNenAxMG1aMldLejdsYXU0OFFE?=
 =?utf-8?B?Y3I4Mm5tR09CeEorQWhPRndxTmJvVlUrcTNQMGhGZnlxOEtmWkRCY2pIN29X?=
 =?utf-8?Q?Qu0M=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 12:53:16.5722 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0748f23-31c8-458a-052a-08de33fd4261
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000049.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9010
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA5MiBTYWx0ZWRfX9PikH1sEQXYA
 7oQUX5yazZeV7h5Yjnia7iGxkyhc3NS7H25hOMGPXwxeHOfAXLrOwWJG4q2iSXB2KijB56dZoMX
 7SNG9CpI80eRSdxgfu+k6a2ilA6HbiHujhG4yjhohAjio2GwSX08rkXbW/GveZtuDA4LalJx2eV
 M4O4M94S/Ltv1gucvzRWcolY6eFO0e7yAIvwBpMEYDebY50Go4WPwqKEgMI/FS18z3oty4NmrmL
 GC79kKsQW4wPBAV+EcfvDNLdEpmtn/FtCRf3oXigJqX8d2bQPDqZ8wZLMywrnWmrkXxHeLZYfvT
 /JxGfu1RC0DE5vULPsn0Pca3YXat1OhLu+YD6z+6+fJWjm9W6TEYJhCVGoad48ymHJ28RTsl726
 YoR7twieSK6iNiqtpnQ7GU0+hEJN8g==
X-Proofpoint-GUID: LOUtJOmRfmXoJdCluk7g1YImCF0okC8z
X-Proofpoint-ORIG-GUID: LOUtJOmRfmXoJdCluk7g1YImCF0okC8z
X-Authority-Analysis: v=2.4 cv=YrEChoYX c=1 sm=1 tr=0 ts=6932d5c3 cx=c_pps
 a=caHvpjIXtg0psX5ICJsGNA==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Uo5EeBN78AAA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=b3CbU_ItAAAA:8 a=8b9GpE9nAAAA:8 a=k-42gJp3AAAA:8
 a=zk4-lHRcAAAA:8 a=phlkwaE_AAAA:8 a=IiL2mMM7yhYR1oWEKKwA:9 a=QEXdDO2ut3YA:10
 a=Rv2g8BkzVjQTVhhssdqe:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=uCSXFHLys93vLW5PjgO_:22
 a=7cv85riZL9-k45RWW8P6:22 a=uKTQOUHymn4LaG7oTSIC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 adultscore=0 malwarescore=0 suspectscore=0
 spamscore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050092
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32: Fix 512 MiB DRAM
 settings for DH STM32MP13xx DHCOR SoM
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



On 12/3/25 15:20, Patrice CHOTARD wrote:
> 
> 
> On 11/19/25 00:19, Marek Vasut wrote:
>> Update DRAM chip type and density comment for 512 MiB DRAM settings for
>> DH STM32MP13xx DHCOR DHSBC to match the chip on the SoM. No functional
>> change.
>>
>> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
>> ---
>> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
>> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> Cc: Tom Rini <trini@konsulko.com>
>> Cc: u-boot@dh-electronics.com
>> Cc: u-boot@lists.denx.de
>> Cc: uboot-stm32@st-md-mailman.stormreply.com
>> ---
>>  arch/arm/dts/stm32mp13-ddr3-dhsom-1x2Gb-1066-binG.dtsi | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm/dts/stm32mp13-ddr3-dhsom-1x2Gb-1066-binG.dtsi b/arch/arm/dts/stm32mp13-ddr3-dhsom-1x2Gb-1066-binG.dtsi
>> index 7b344541c3e..b464c04aa2b 100644
>> --- a/arch/arm/dts/stm32mp13-ddr3-dhsom-1x2Gb-1066-binG.dtsi
>> +++ b/arch/arm/dts/stm32mp13-ddr3-dhsom-1x2Gb-1066-binG.dtsi
>> @@ -3,13 +3,13 @@
>>   * Copyright (C) 2025, DH electronics - All Rights Reserved
>>   *
>>   * STM32MP13xx DHSOM configuration
>> - * 1x DDR3L 1Gb, 16-bit, 533MHz, Single Die Package in flyby topology.
>> - * Reference used W631GU6MB15I from Winbond
>> + * 1x DDR3L 4Gb, 16-bit, 533MHz, Single Die Package in flyby topology.
>> + * Reference used W634GU6RB11I from Winbond
>>   *
>>   * DDR type / Platform	DDR3/3L
>>   * freq		533MHz
>>   * width	16
>> - * datasheet	0  = W631GU6MB15I / DDR3-1333
>> + * datasheet	0  = W634GU6RB11I / DDR3-1866
>>   * DDR density	2
>>   * timing mode	optimized
>>   * address mapping : RBC
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
> Patrice


Applied to u-boot-stm32/next

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
