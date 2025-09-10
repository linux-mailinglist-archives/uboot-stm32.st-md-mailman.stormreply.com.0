Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5120B51C20
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Sep 2025 17:43:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 904D0C35E2B;
	Wed, 10 Sep 2025 15:43:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6324AC36B3F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 15:43:57 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AFWDtf032515;
 Wed, 10 Sep 2025 17:43:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 Xm5/VHiJzr4AKUxaZ8LMI4/8BrbvE+4bjawnfBNPtPo=; b=6ekHgqIqTvNE0FhH
 cecrg4CGH8AK+9bBEhgw0KexYpD7V7KB4jA1Lnz4EI4+pA/7bqUr1AdrDd3BGk8Y
 EhS4k7wxijlXVDYJ4fDgxhwmN2nLsn2IAGYooue9s8mjIvY54xTBB5lLoMGE4iFS
 wqx9sSd7NbtiwQdymcf24+I44p+38FeMkPdWVM8Jvi0EN20X4P9M1/vdqPPrshLp
 r737j4sIp3UGjX/c2PQohS+15lWhvkscgPYr3BmcLq0TAuP14RVQkqcYc6W6BPxg
 nTjRSjWl+s13hGn63IZWEwOG7kgxyYXAVdUX65uYdTNZsrdDTn0F4wwAlMqITTtF
 8AF9gQ==
Received: from db3pr0202cu003.outbound.protection.outlook.com
 (mail-northeuropeazon11010039.outbound.protection.outlook.com [52.101.84.39])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 492fr9etac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Sep 2025 17:43:54 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L8iMwF6GlZcKyNniYUFpKfIt698aom38tDLILWcI4LtYiaeyUHXvOjFk3Rwbd4q83ymOCpnRry8NTE+tjVr/1fnaWL07ytziSurIaXMt+HERw/VwJaz84Fxt5eRGXzFM9hbmtzk0joMy8BLjWHMETHR/wI6EhY8eAw7CMmXPMATDLvXonlHvZM3naLoXwlie23OIRBF6EE9yfvInUkgzncFlqkMNxNTk2BrHtaX1kjmQEnSL3XdzYDjje5P/NhC3Z16XMB0neobc2L4LSs7zOm8Jmcfbxrq/a4S/1nxXel5uATD6+w+0RIuYXHAcUxP2fS61gIJNPZbyJBpRBGtCiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xm5/VHiJzr4AKUxaZ8LMI4/8BrbvE+4bjawnfBNPtPo=;
 b=Qn2pFneJlDLhSQa2zJ+aI+xyGEkYG0d8wICdRdkgvQmaem8LI5ZsFJirFbtg+fXAcLsjT3uGvvdsjLAZ88DSWQ2k6AnyWtGrHNsMitUf4CJ93L/NP9RgrDX9vpyqOICpk5YKQfigPsT4UBX7IfE97T2geJHxRzHoJ1mZFPtE/ZDPHNKmdyVMwRayssJHJ7iHtdmO5tQy608nphPtOfIcKjXFDsroEGMcU2clG7ZDQkue1bWGvvmsC4ErD4RqT+v7wPI9v8o48Ha6xfBoFQ7RYhC/960HmD2Ssj1VSaL7ijFmNcJ3LzkVlIw4suFoaF6OXqUze2R6FDekvL78WEzVBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stmicroelectronics.onmicrosoft.com;
 s=selector2-stmicroelectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xm5/VHiJzr4AKUxaZ8LMI4/8BrbvE+4bjawnfBNPtPo=;
 b=dMY0leJY94NTO/J472U8Jy8cdgmYAUX0aL599jaMvzlAJaWCpZOAeYEuoNjpejsYApBU1NIWvdqHzM19cgf6ODcVT6wFmTCulqtvg7/HF95McNRbTifWse9Ad4tAzdIWy/PEOcO7n6y1+Ohh1YI9XzQlpTdvPoLQy0iLRefeXMk=
Received: from AM0PR03CA0095.eurprd03.prod.outlook.com (2603:10a6:208:69::36)
 by VI1PR10MB8279.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:119::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 15:43:51 +0000
Received: from AMS0EPF00000190.eurprd05.prod.outlook.com
 (2603:10a6:208:69:cafe::d3) by AM0PR03CA0095.outlook.office365.com
 (2603:10a6:208:69::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Wed,
 10 Sep 2025 15:43:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 AMS0EPF00000190.mail.protection.outlook.com (10.167.16.213) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 15:43:51 +0000
Received: from SHFDAG1NODE3.st.com (10.75.129.71) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 10 Sep
 2025 17:41:30 +0200
Received: from [10.48.87.108] (10.48.87.108) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 10 Sep
 2025 17:43:50 +0200
Message-ID: <33729f77-5042-4a01-91ac-623792b14e18@foss.st.com>
Date: Wed, 10 Sep 2025 17:43:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20250808151154.472860-1-patrice.chotard@foss.st.com>
 <20250808151154.472860-6-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20250808151154.472860-6-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.87.108]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000190:EE_|VI1PR10MB8279:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f71de61-70f4-491f-9cd1-08ddf080d766
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z2d2cVZZNHlvZlFVRk9XRjcweTc3bmlrRWw1Z2sxeFVpaWJpZGsycWtnYXZt?=
 =?utf-8?B?M2kyREtVbXpsQkk4YW8xYTNCQ1pFNjI1bnF1V1FNUlVPd2NHT1k4VS9FUnJj?=
 =?utf-8?B?d1ZxemxpSmhXMGVFWm5rRHFtRFk2TWxVU3Rsa2dUTUwwMG5ySnI3bE1lTWxK?=
 =?utf-8?B?Q05YN21SYzdVb1Y2anFTTHJ0USswblhFazNaMGtMY3U1VTAybVhPTFRuZ1d2?=
 =?utf-8?B?bFZrK0Q3cm50QS9qeWtjYlpJOE9mdksrYjlQYWxyUFMrZ1FWRWFCV2twS3pW?=
 =?utf-8?B?MzJRYm5Ha0NxV1hxcUZWQXM5elhia1RVYzVjUHllb0ZGN21vTDRTbWRQaFlh?=
 =?utf-8?B?dk9ncks4eGh3NG5rb0N0VHoybVhuRlp4UW96ZVQ0ZU9Zc1FoYVlNdnJMZy9r?=
 =?utf-8?B?WGhhUHMraVI1a24zejBYS1JPSlRzRTBtL3BDdFRmVWZIY09tbUxya21aZEZh?=
 =?utf-8?B?U3lPTHFYUFVURWFOaEpFcGpDakJuanZvdHdaSVZUdXc3dSs4Zm9VTGJESVVK?=
 =?utf-8?B?QllxbWpsT1RENzFpaEYrU095WFdFSFRkSTBzRTdnNUxmVTVkSFJXNVdDZ1lC?=
 =?utf-8?B?MjRSbDFvbXg5bEdnajdZVWswL3kzSlh3OW5wQ2g5RElMTmw0aVArdGxUYWN5?=
 =?utf-8?B?WjY0UXc2WHpjUXQ3VEo1MVdlaThaNlU2cnFQc1VuMzI5dUpsZnJOdU1VTmNJ?=
 =?utf-8?B?VXRWSE9aWWFTeWJFdlBHLzJBWTRQMm83RlloUzl2MjVxOXgxemZpL2UvbVR2?=
 =?utf-8?B?TlNyeHYyRXlNUk1GeStQbW9NT25rYnhIZjBOOWYxcno3Zk93SzEra0ljSXM3?=
 =?utf-8?B?ZEJuOE5XZXF3L1RNMkRkRUNZK3JjeFFWeTNzYm1VV2NpaFFtNkRZRmowbzUz?=
 =?utf-8?B?eWM4ZS9FWE4xZWpzWmVmK2xITmR3ckR3eWoyek92VDBzWlVqUHpUUHRIaWZa?=
 =?utf-8?B?ZTRRMEJRT1I2WTN6ZUdtWloxdVJTbjEwOGF0S2dlaWEwOWhFZm5GYkJua1lt?=
 =?utf-8?B?WmJ2WXNOODR5YzNKUDZvNi9MY2RrOTd3SmpLclU5WGpabGtQdzZDRlg2bVJo?=
 =?utf-8?B?T0lqamtweFJDZ2tHbnJ6TDVGenVzT0hZc21TMGduZjArdDdHR2ZCdzcwOVdh?=
 =?utf-8?B?ZWZFeW5DUDd3L2NEcTFXRGpuNXpDK3F4amdoQlZ2Q05hcUlic0pmMXpBckRV?=
 =?utf-8?B?alhrVzhkMkJzN0h1OE9uaDFrSDdwKy8zVkRFWFZtWFVRT0xwV1d2OXc3cWJi?=
 =?utf-8?B?WHhLMyt3NTlmaHdoVjhST1J0S1RVSi84NXVKT3grMTRhZmFHTE81TjJnRnY0?=
 =?utf-8?B?UnlpMlVzWU5ETzJDRjE2S1ZnbDUwc0ZScDdxWGxvNkRiY1V4UlVxV3J5a1hK?=
 =?utf-8?B?SW81UzNUS1J0aHE4UnU5NmhTU3RLQ0lUYTdKSExxanNmbmVNR2tMVWM4QW5P?=
 =?utf-8?B?Mzk1emFEc2pCNXlqVlJGUkpLNy9qc2FOWURienZwdjV1VVM0K1EwWlc5eHQ3?=
 =?utf-8?B?U2xFL0xPazJVU244YUxLNzI5VDZIZWRVQ2NOYm0zU01PVjduS1JVN3dKSGJp?=
 =?utf-8?B?SENCMFBGV0NUeDkwQlZqSlVsTmhPSjFPN3FpY2dBL2MwdGxYMmRxK0VzdXJZ?=
 =?utf-8?B?U0wwSjdJTzJFSnk5eTJiSE44U2hWcGQ4UFE3OEYxTUFOa0dlcnlTRVNJNXZN?=
 =?utf-8?B?aWlHNnVWUHVQTmg2WGo2ZHhZNzNZZjR5eVd5cHRCSEZtb044U2wxZnJOWDhZ?=
 =?utf-8?B?TlVVckkxa3lQRXBROXVSWHAxSkNhSkpDYkxrY3kwRHZXd3NXaWw5R3ZJNW9W?=
 =?utf-8?B?Tkt3VTVJS2J4MWJjdGZmWjdOL2pCZzhqMlhGMVM4QTd2TnpmYmJzb0RvTmR6?=
 =?utf-8?B?QmxXUUhHMzY4ejgwY0NRektaNzRObFpjeEVCVTZjS2ZQZlQrYkNHYk1pbWRE?=
 =?utf-8?B?b3VkZllNYmEzZEhrYTRXMk1YZEI2VWYrSWhBaW8zbVZMQ0xXVVFLVEtyMTRp?=
 =?utf-8?B?YzVIY0VJaWV2eVUwYVdkV1RqM1puWHdGRWE4bFU3N1czTjhzYmtvQ2taYi95?=
 =?utf-8?Q?eQ9J7t?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 15:43:51.5881 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f71de61-70f4-491f-9cd1-08ddf080d766
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000190.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB8279
X-Proofpoint-ORIG-GUID: 2es9n8J5IuJePKH4H9vjt001vkT-CVT6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA5MDA3MCBTYWx0ZWRfXxkzKptX49dNi
 pqkx+hD2qAL7FjrzLcEaN+rbKPCUTNWJbtLvEDvJkvebo6ylXDiwFLwPAHMRDJ0ghg6QXw1ZmqV
 NNFE5cGjySDxsaVE1T+uwpzlaSDV+an9+osnL+VuuFmr1O3AVcKdI2pA+JYXk2nTV51t8jCopAF
 Z12N3tFPTGdL5MKCS1RAX3ek7ey63ldaHqn5F15vYbzns+3MAFgGcPJ7otVKfExz/lOOQm8w21p
 585naE2bPm1byGi9RtMEMzhghnf7ulswq4XCVYa9DbhrUntCKoLXH2tgUxSLnEMKx0ZmNEqXvc/
 ROhKgj6z4ld8vih6yXOx8aD9LipWz2m6dRds2Y9mRPCawxj0j7Lw0Uwb7xnTVku4/RjsMTJL6aj
 Wbq9rB36
X-Authority-Analysis: v=2.4 cv=We8Ma1hX c=1 sm=1 tr=0 ts=68c19cba cx=c_pps
 a=omxK8WE9k5hlHSC7TbkbQA==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=q6CKDgr7omsA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=FUbXzq8tPBIA:10 a=8b9GpE9nAAAA:8
 a=j2lEg8c7CST_zQYFhOgA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: 2es9n8J5IuJePKH4H9vjt001vkT-CVT6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_02,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 spamscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 impostorscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509090070
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 5/5] ARM: dts: Add flash0 partitions for
 stm32mp257f-ev1-u-boot
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

On 8/8/25 17:11, Patrice Chotard wrote:
> Add flash0 partitions for stm32mp257f-ev1-u-boot.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>
> ---
>
>   arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi | 41 ++++++++++++++++++++++++
>   1 file changed, 41 insertions(+)
>

Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
