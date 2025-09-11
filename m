Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAB7B52908
	for <lists+uboot-stm32@lfdr.de>; Thu, 11 Sep 2025 08:39:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2697EC349C4;
	Thu, 11 Sep 2025 06:39:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5820CC349C1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Sep 2025 06:39:05 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B6G3ct011482;
 Thu, 11 Sep 2025 08:38:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 YBo1HC+/JGd5Ngbq1DAVN28tHZFCB5iTTHHJQ7uFLX8=; b=4KwNV+TNN3hixkqi
 KZGOOUc8sxYpeH6c+g///7g7+hLE53HgyeAABeK+WiZg3ekq5cSiw1flJC1WCo2p
 XBjOXattF5pXf9KGzRcZlmwoN3hNESFCzy42yIC3JgFqarR+5/nk0ZidSSeaq0E5
 KzrShK01tIocfFiVz+eNb1UfGfa4nONqcarQXY/xZlmYAmt9u7LZfMufIM3DQwYc
 oC0K+d0RhFm/+UCJgKMyOlk+Im9hc7RphZZ+ChITicgwB6wWiuWsNvBi4B/0bwbl
 mahyVHQJzkQ0Ilb8UMZuniCVzFmFfXheqFE5Rcbwe2+rj3c3sS6/zo/BBebHSoKD
 R+cq0Q==
Received: from am0pr02cu008.outbound.protection.outlook.com
 (mail-westeuropeazon11013070.outbound.protection.outlook.com [52.101.72.70])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 492fr9huva-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Sep 2025 08:38:25 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gitYfKkTG2p73b6mjfRShl2qv3KBAVl3srrOj/mJeiRlE/y8zeRvyE57MopKGKJ2d+wOfiFOyqcWksV1pDfVpUrncn+DiRyj3E5UKvKkihH2aReVLqnljJ3qHT4WFg2CtN7NJJVECIkw6ZqgEmMEt7kDqclU2w80ca8BOXAg6a7AuBq2KvQeIZZyDnQNDDP2nxT7RLE/wIwI+1Q7OwQiTEhlaHX9ACHDsnvyfan6H4wiO8z+bHGRez2OelMHW8M7M5+aXJP7FRAwpiawElMUSM0OTBoGaS4DVvAjzbotlXP9o2ekgKH2JHWMNL4JOted2oxslt3N8UlAnhfqzrToEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YBo1HC+/JGd5Ngbq1DAVN28tHZFCB5iTTHHJQ7uFLX8=;
 b=mpG8D/qNguxDrj9mNkzTiN0GDup08/CjqePJRvaAptYLCmTNMcXuL4z9Gf/vxRf+XH/SoJZV9/zgOmyYfrLoJURWZ+m2iWH+pTO0BKBctBJCfvffMqs6voTRE1WRFI3uGogCfLFdLk6mUYDcuehRv4RaUHBTcM6Kqn2mcczfZASECBtl0kILOdcHwypg4E7V5RVhStyR9YA7fAddYghKKyjmm+lZMiBU1RmZ0brfDtQJctmR3wPPN/ZnKJCLUuKK07meCn21ulLW2I+7L2v/GaSdIk9VveAl/addXs/KeRtNs1SAn3KjDJ4RVq7ypuqPaBF/fQnrVILIZbW5dVbNRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stmicroelectronics.onmicrosoft.com;
 s=selector2-stmicroelectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YBo1HC+/JGd5Ngbq1DAVN28tHZFCB5iTTHHJQ7uFLX8=;
 b=ZLIcCwcPq9DE+eLi4f2xN1w/flt206+xBkZ+limyrvmf3UXtmbRimGSDk66fDTcKmzBtYcN9hLgFsFPTxhBjSFAdxODC7TVVkvexuaZEyB/zGY0nA8tlwsVRzGKezbxnkq8l0T3T+nl2gSkBTdDi+q8HPjplFFownMljdmq5PvM=
Received: from DUZPR01CA0020.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::16) by AS5PR10MB8122.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:654::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 06:38:24 +0000
Received: from DB1PEPF000509EF.eurprd03.prod.outlook.com
 (2603:10a6:10:46b:cafe::fa) by DUZPR01CA0020.outlook.office365.com
 (2603:10a6:10:46b::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.17 via Frontend Transport; Thu,
 11 Sep 2025 06:38:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 DB1PEPF000509EF.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Thu, 11 Sep 2025 06:38:23 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 11 Sep
 2025 08:31:14 +0200
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 11 Sep
 2025 08:38:22 +0200
Message-ID: <c94f267d-9e06-45d5-b7d2-77ad5362e208@foss.st.com>
Date: Thu, 11 Sep 2025 08:38:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20250808151154.472860-1-patrice.chotard@foss.st.com>
 <20250808151154.472860-4-patrice.chotard@foss.st.com>
 <0d0fd822-fbe7-41b9-9c82-e9ffe4b911a2@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <0d0fd822-fbe7-41b9-9c82-e9ffe4b911a2@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EF:EE_|AS5PR10MB8122:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ef2969f-d6f0-4dd9-6927-08ddf0fdce57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YlFCRG5oSzE2Qk5HUnlKYVkxcVRkMlNyN1VadjFmdzZLc1A4dm03MEZRWHJD?=
 =?utf-8?B?b2NsejRnK1dlb3ZVY1ZocU5oeVdSTjd5eHp5TW4rb1gzZ0U4Q2lEcnRqRmJx?=
 =?utf-8?B?cWZ1MXZ1MmoyR091dGdva3o3L3NudzZ1ZEFMZjduZWpPZFNzeGZ0YWJWZ1NU?=
 =?utf-8?B?bGZ1b2VrU21ROUhId1ozKzZVWUU2UUl2TG52UjRCSVN1MG8wWFllNWtRVU1U?=
 =?utf-8?B?dTZaRkpPZFRBakh0Q0FVQWE2Y1N2d2FZS2dJTDR2ZlBjcmZ5bDRJems1ZUlz?=
 =?utf-8?B?YVpiTEVHc1EwSlpLMzZlSWMrdmRiQjlKamFYcGlzdVYyZW5iMHM3Smp3T2hE?=
 =?utf-8?B?Z2E0bTQ3RGFPb1BveDI5bU1mUURzY3pVYlB5S2lBN2NQbno1RFYrRHdlRXhU?=
 =?utf-8?B?MStTSkVOc1RLRi8rbWRZZDhIa3QwaVdCQnhlclBHdDNGRjRjOTEwekxUTjc3?=
 =?utf-8?B?S2FnSXVMSk8yaEx1MFF4SVcwUTQ0TkdoUGV2QXBJTVdUZDZKdldGSGVYRGpC?=
 =?utf-8?B?eEJFcnpzYXQ2dC9USEc5WGhWZktUaFJYM3lZajhZWG9yRUlGL3VoeXpUajI2?=
 =?utf-8?B?TVhabUsyZVk3bGtsVG1VYmlScmYwd0orMHN1dmo3Wk4xUjE5L3QxODQ1ckRE?=
 =?utf-8?B?NUVOYnVRRXJOVWVrUDE3S2hNT2NnMDdYSUxJVitHSGh5QUJYMC9GeEZwOXhO?=
 =?utf-8?B?MTVaMGpMWCtaVVJ5c3VFM1V2dURFeExtQ3AzcXdWd0V4UndwYlF3TVBnQVR6?=
 =?utf-8?B?b0FJNE1jaEFYbnEwcjlBa1p5TFlQSnd0YXV1YlNJMi9ZUXdPeWhRSzE3OHVn?=
 =?utf-8?B?SllWV004WVJIUTEvSnIreUd4VGI1eUhHbWFBL3RjNnREWGlQS1FPMlA1TEFp?=
 =?utf-8?B?eWZldjZzYzd0bDF1ZHhGcnJxeXVEcitRWFBjYWsxU0pBS3lhWTRVaElGeXg0?=
 =?utf-8?B?M2tFTGNiMUVsT3k2ekZ3aDNLNElhSHFGVDJmRlFMcThEQjN4bzlwWHZmSzQ1?=
 =?utf-8?B?UGF3N0F1SWZKZ2N2UmpYcUtJNVd1UTRlZ3dobWZKUUVKNGxLay84M01uZ3VE?=
 =?utf-8?B?ZFBsZ0xvYUFuTzVlWXFnTDZUZHRoc1B5QWtna1lROWpWSlEwTDZYaVE3T2dH?=
 =?utf-8?B?Y2JWUWJ2eFBWTGRMM3pPa3JER05HNlpRWjRTaERwYlhJTlBLeDlRcGE0UGhB?=
 =?utf-8?B?UFhmZGU5RlZ2b25OL1F0UHVvUDZkZTllVWoydFI1Qjg4eVQ5aHRoemdKZXAr?=
 =?utf-8?B?eEw3WWE3ZDBVVjBmMXhVcmI3MGtQbjJpeHdWVWYzbklvbnJYN3gxN0N0bWIw?=
 =?utf-8?B?Y2lNQnkxSklUNWM3MUs1bTZBNEY1bjNEb3NKdEJCNGRqK1A1a1IvbThKRm5p?=
 =?utf-8?B?VmxWaFluTjN6ay9kb0JPMXZrVU5tMmJ1N1NYc01iRlQ5WkpjbWNtZXJQMnZk?=
 =?utf-8?B?YmpIRzV0Nm5qc3NyQ1F0a0JZRHhmdFU3MlQ5YnBnUGVzNnlseDFCK2c3Tmdn?=
 =?utf-8?B?K1NRYnV0d2l6Q1ArL3lwaGdFOTJaN1VRclRLdU1jVi9yOEJGSkIvVVNqTDNB?=
 =?utf-8?B?a2tKOXhlU21kcWtvOHBPQ2VDems3STI5dUNPcmtxUDFwS052QVJKTytpSkJP?=
 =?utf-8?B?T3VqMHhjTVZLZGxRQlA3WkdwNE9EbzdlUXlmdGZ6NGJNWG5PUDhRanJTalFr?=
 =?utf-8?B?dHlnZ3pEekNBTmFCTmo5eHFlWWVWMERpVWlYaXFMZkZaMWg3NU9yWlpnR3l2?=
 =?utf-8?B?eTdrdkhtc1ZvMTVKVkkwYmpXUU9mVk5MRUdEZjhnOHN5TnkwaEJDeU1BZWpP?=
 =?utf-8?B?bHRIdVV1K3pMNmdHcmRjYy9Cc1ZNZmJwQ3dBNlN1WHMxYzZDMGJIUFJkaDVO?=
 =?utf-8?B?VTB0dVFIYW9ONXhISDhBSnNWK1c1SEZzVzR1UEk5dnZLL0xZbVBKNzMrUG42?=
 =?utf-8?B?eVhzUEttNWtwSnNDRnhZOTljM3U5UXBJTElVQ2hKZjE2OE9oY0J3a1NWaVVp?=
 =?utf-8?B?OTFCODIxak5nPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.44; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 06:38:23.4523 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ef2969f-d6f0-4dd9-6927-08ddf0fdce57
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.44];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509EF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR10MB8122
X-Proofpoint-ORIG-GUID: IvZgMfJhuvkeA4Cq6UsS52lDE2n7RQ2n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA5MDA3MCBTYWx0ZWRfXzTrBsa58nGzQ
 JVW8BCsrGj82nddoSz74aG8k1KMlKqWFDOxGegIHf8A3ZtswxxcE2sLfaGgqHT7kQLvsBTHi/TD
 MWVj9X2vsrUQ4vT8wGuFfbnqUoLyNbFFcQs50bbEqO5le/aNtmBD8f0yigd6F/v7Tyy9f9q6sCC
 6IB2JifqcTL2is1wjvp0V5E1iWxkQuvi+4SVV40DZGDe9j2EqrhVbFvUlKUxASavXp70thdsq3t
 iwVV1Wi2EIRvvLMtp0uOB2cPXHTVib9b/7Wj7ltNlaaIj1Pde4/Pp1/CMkbIkLLsga6kM0mmVxd
 vvuIpfoNK6v9LJ2oG5OYE7eqPfB2HSHqJ83n5aoJqdKLx6v7AGWoxVGvsgly5wYQor8PCiEkRD5
 miqru78d
X-Authority-Analysis: v=2.4 cv=We8Ma1hX c=1 sm=1 tr=0 ts=68c26e61 cx=c_pps
 a=qZ5lPaVr8+k0L2nLbUVKrQ==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=SAHXIHsbQyQA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=FUbXzq8tPBIA:10 a=YfCOm-DyAAAA:8
 a=8b9GpE9nAAAA:8 a=phlkwaE_AAAA:8 a=fRgJqisy1nVYZ_GOdb8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
 a=zQLMK8awuJ6_Hvp-_9Ux:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=uKTQOUHymn4LaG7oTSIC:22
X-Proofpoint-GUID: IvZgMfJhuvkeA4Cq6UsS52lDE2n7RQ2n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011
 spamscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 impostorscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509090070
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Alexander Dahl <ada@thorsis.com>, Simon Glass <sjg@chromium.org>,
 Utsav Agarwal <utsav.agarwal@analog.com>,
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
 Oliver Gaskell <Oliver.Gaskell@analog.com>, John Watts <contact@jookia.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Vasileios Bimpikas <vasileios.bimpikas@analog.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Christian Marangi <ansuelsmth@gmail.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Subject: Re: [Uboot-stm32] [PATCH 3/5] spi: Add STM32MP2 Octo-SPI driver
	support
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

CgpPbiA5LzEwLzI1IDE3OjU3LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDgvOC8yNSAxNzoxMSwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBBZGQgU1RNMzIgT1NQSSBk
cml2ZXIsIGl0IHN1cHBvcnRzIDoKPj4gwqDCoCAtIHN1cHBvcnQgc05PUiAvIHNOQU5EIGRldmlj
ZXMuCj4+IMKgwqAgLSBUd28gZnVuY3Rpb25hbCBtb2RlczogaW5kaXJlY3QgKHJlYWQvd3JpdGUp
IGFuZCBtZW1vcnktbWFwcGVkIChyZWFkKS4KPj4gwqDCoCAtIFNpbmdsZS0sIGR1YWwtLCBxdWFk
LSwgYW5kIG9jdGFsLVNQSSBjb21tdW5pY2F0aW9uLgo+PiDCoMKgIC0gU2luZ2xlIGRhdGEgcmF0
ZSAoU0RSKS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNo
b3RhcmRAZm9zcy5zdC5jb20+Cj4+IC0tLQo+Pgo+PiDCoCBkcml2ZXJzL3NwaS9LY29uZmlnwqDC
oMKgwqDCoCB8wqDCoCA4ICsKPj4gwqAgZHJpdmVycy9zcGkvTWFrZWZpbGXCoMKgwqDCoCB8wqDC
oCAxICsKPj4gwqAgZHJpdmVycy9zcGkvc3RtMzJfb3NwaS5jIHwgNjIzICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwo+PiDCoCAzIGZpbGVzIGNoYW5nZWQsIDYzMiBpbnNl
cnRpb25zKCspCj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3NwaS9zdG0zMl9vc3Bp
LmMKPj4KPiBQZXJoYXBzIG5lZWQgdG8gYWRkIHRoZSBPU1BJIGRyaXZlciBpbiAvTUFJTlRBSU5F
UlMgZmlsZSBmb3Igc3RtMzJtcCBkcml2ZXIgPyBhcyBhbHJlYWR5IGRvZW4gZm9yIHNwaSBhbmQg
cXNpIGRyaXZlcnMuLi4uCj4gCj4gQVJNIFNUTSBTVE0zMk1QCj4gTTpQYXRyaWNrIERlbGF1bmF5
IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+IE06UGF0cmljZSBDaG90YXJkIDxwYXRy
aWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4gTDp1Ym9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tIChtb2RlcmF0ZWQgZm9yIG5vbi1zdWJzY3JpYmVycykKPiBUOmdpdCBodHRw
czovL3NvdXJjZS5kZW54LmRlL3UtYm9vdC9jdXN0b2RpYW5zL3UtYm9vdC1zdG0uZ2l0Cj4gUzpN
YWludGFpbmVkCj4gLi4uCj4gRjpkcml2ZXJzL3NwaS9zdG0zMl9xc3BpLmMKPiBGOmRyaXZlcnMv
c3BpL3N0bTMyX3NwaS5jCj4gLi4uCj4gCj4gCj4gYW5kIEkgbWlzcyB0aGlzIHJlbWFyayBmb3Ig
cHJldmlvdXMgcGF0Y2ggd2hpaCBhZGQgdGhlIGRyaXZlciBPTU0gaW4gbWVtb3J5IGRpcmVjdG9y
eS4uLi4KClJpZ2h0LCBpIHdpbGwgdXBkYXRlIE1JTkFUQUlORVJTIGFjY29yZGluZ2x5IGZvciBz
dG0zMl9vc3BpIGFuZCBzdG0zMl9vbW0gZHJpdmVycy4KClRoYW5rcwpQYXRyaWNlCgo+IAo+IAo+
IEFueXdheSBmb3IgdGhlIGRyaXZlciBoaW1zZWxmCj4gCj4gCj4gUmV2aWV3ZWQtYnk6IFBhdHJp
Y2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4gCj4gVGhhbmtzCj4g
UGF0cmljawo+IAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
