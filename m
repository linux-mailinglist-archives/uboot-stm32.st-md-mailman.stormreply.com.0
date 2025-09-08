Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D7DB484B2
	for <lists+uboot-stm32@lfdr.de>; Mon,  8 Sep 2025 09:03:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34977C3F959;
	Mon,  8 Sep 2025 07:03:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37796C3F958
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Sep 2025 07:03:00 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5886vmwB009833;
 Mon, 8 Sep 2025 09:02:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 QQrM4oVhi/oD7LdmNMOh19F9RPMIZw/t6/0FVKwZFhc=; b=q3K04noT4wLLGdvo
 k9yD0b6Cj15D8TjaXWrMte1T01jGxtqT4CCGH+36G4ZwWTkXU1eQaCcK58Jhm2jp
 Z/jWSxQqfk2mjxkJI/OJM9B9QvHrjEDbtrFepXO4Ofkymm+x2f2RlXPGRpIv6bZS
 6TnZgjsDvznsHQnOxw6XLL74f8xrU3RtS2/CIkZBR8ELnReb0WnomtuMOwBqu7E1
 viTQsuWw7Ed1u/zADC8BGxloDk/AVTsYoNpupipfMdM6BTCb6QGZWIfdOfajmBA+
 uhJrEL72SdFdFyUcPTF+vYk5BeLvWItCgto/Bt9/wJzsCnxzqV/GYb9gqmVJ46ff
 qx3alg==
Received: from pa4pr04cu001.outbound.protection.outlook.com
 (mail-francecentralazon11013005.outbound.protection.outlook.com
 [40.107.162.5])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 490a37we21-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Sep 2025 09:02:43 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lWdye00s34BhJnPtL5Bs91t8VBWOUP7W1m7/Cc+WoIu8v3K3G9w1fvfocHETrumjc/irgOIfhxffRsfMddwZg+HlHCveV6HH4aPcyQNKUJbPW7Am6MBfgI+BJZdKj0jJv6x0s36GRs7mCZM8jCJ8Wsr57xCIZkyS9/e5OJF27mbKEDV/1xZpZ3Vchvnk3HE2fNIK1EIl5+/3/uDtb4vkSZlWUaxkbXdIL3sRzA8UhA0GToTWI4MFXDHsZSq+nc4wPDVzbEq3InMh8BURAQYl1I8+sgYMGViISvrOXLqiJb1M4+tXc8eNHuy3CSyYlq0tqZci4tBK3vK5tyX6o5PIgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QQrM4oVhi/oD7LdmNMOh19F9RPMIZw/t6/0FVKwZFhc=;
 b=gOXPOSK1Uzz1ah5nF/BkgwuK3uJ3ARNlHzbrCqVapOioYIEy75lzEeVZU5CukJptq43HJ/Bc07jYgOclfrlTb+2TwDhnPUvrV15id+W4ncLtADsw4OBjiI6L49bzUJFOqjB4W9K65HsT5mFy67bRFa4XqLDAkNl1WI5H/JFqwUaio3EgcBCqR4d3EWKBifItFvVdcicptifquSXbsH/aruL1EVOZt37ClfhIbNaBLPVjIsYwHOAtc0TpANgtuoF3wuPdIZSl8+Oavik7v3UsLAJeBrmJRLXLIa1tKShgf/EllOPg+eN5NkA+3aKRngrYDBPqeW7jl1CDpsCBsdWD4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=mailbox.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stmicroelectronics.onmicrosoft.com;
 s=selector2-stmicroelectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQrM4oVhi/oD7LdmNMOh19F9RPMIZw/t6/0FVKwZFhc=;
 b=X6ShYLKElk7K5Tqx2g9UyKyw8HkJKZgzbNR963461hnaj47V9Dk0JPNNo/zlYBcetEE+6MOmiX/CBxUI98kzFiVVADAO5imR6mK/JbcmZSTt02fXMQfdwNsVpPViWKLbZerSacXrXQKFJyj8Ckg2wU7r1YWN/esasK2h5m3tLzg=
Received: from DU7PR01CA0006.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::6) by DU0PR10MB7214.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:44a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 07:02:39 +0000
Received: from DU2PEPF00028D10.eurprd03.prod.outlook.com
 (2603:10a6:10:50f:cafe::36) by DU7PR01CA0006.outlook.office365.com
 (2603:10a6:10:50f::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.22 via Frontend Transport; Mon,
 8 Sep 2025 07:02:31 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 DU2PEPF00028D10.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Mon, 8 Sep 2025 07:02:38 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 8 Sep
 2025 08:55:27 +0200
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 8 Sep
 2025 09:02:37 +0200
Message-ID: <fc2696fa-04bb-494c-8c48-7cf7eb09d70c@foss.st.com>
Date: Mon, 8 Sep 2025 09:02:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>
References: <20250906230016.582577-1-marek.vasut@mailbox.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250906230016.582577-1-marek.vasut@mailbox.org>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D10:EE_|DU0PR10MB7214:EE_
X-MS-Office365-Filtering-Correlation-Id: 89f8bd15-6a01-4081-6b5b-08ddeea5b27f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1JwdjN6UW9TT1ViNldVU3pENnVtSjNIUnVCWTBOWHIvSlpibUFSRSs3TGtJ?=
 =?utf-8?B?d2MvN3YzeFlVMjNTY1c1RW5XaS90RXhNbXUvQnBlRlNjTmRUdjgvaE5oajJp?=
 =?utf-8?B?clpBM2pCb2I1TDd1WXZlc3NyYlduUkVVWXZ1cSsvakJaTG9oNmI4ZiszVGRU?=
 =?utf-8?B?blNSdnM2MUpkd2NiRk16WXA1aGF6V2JBbFNuSldJQU45Y0NTT05BUzlJbitw?=
 =?utf-8?B?MEo1Q1Byd1ltMlJJcUJidnVuV0N2cHJRTHBIZERkamlNcm1NNEdnSWhqRnln?=
 =?utf-8?B?YitTR21GaFhyVUU2Z2owSTBTQjRyMkgwazNQOTg2Tkp6RGNUM1UyZXptN3M3?=
 =?utf-8?B?YXJXdVNlTUtRaVhld2ozdXA1RTJTOXZSTmxuMEMwNzNCYmtRTFZKVlZabUtU?=
 =?utf-8?B?UExKWGhqYUVNTWFubGNQTnRDYkJCODhPWGYvenpDRHFVT01aVnBaL2hjbEhn?=
 =?utf-8?B?MVgwLzU5NkhpSmdsRmtJZjVNcGcxOGsyaXU3Sk52d2IxSElTRWNrVkJ6clV2?=
 =?utf-8?B?R2MwSjgrdzN0aUJodFdneFJMVDRmeXl5ZklZU2QrK1dyajBKMnlUalF5SWh3?=
 =?utf-8?B?cDVEVE5qY3NObnBtYm4zMWI1UVN0VWg5ZGN4L2xCWUFqVWZWYURNL0xvNTZH?=
 =?utf-8?B?R092L21weDhmWG83RWVyL2Y0OEM2NzVzMTE0UEVta2tXa3E1MHZ0eFRwK0g3?=
 =?utf-8?B?Yi80cE1DazBMNm91THIwMkllTXZKOUVNM1RMNnNqSkZtekFVL04rTDllTzZM?=
 =?utf-8?B?RnlkaHhqaTVpZVBwK1ZNSlJnc3JjUUhGejhrVFNxb0s2cWQzMlN5c1F1VFJP?=
 =?utf-8?B?eG1PaWcvQkl3TEtEMmpnQ0g0ZUoyS1FVdm1XN29KUFF4dEl0dkZVV243WWFW?=
 =?utf-8?B?OEZBdHpDa3M1aEJleG1keFJrZkV5MTNTRUlDK0dZeXJPTWg1NDBDOUswV0Nt?=
 =?utf-8?B?dmVEdnNXY2FBNTBOSm1PL09pUVpYNnd5RkNUV2k5MmgwVlU5MEFReEVBbGda?=
 =?utf-8?B?WnBzaUtPb2Y5UG9JMXVQZUl5U0IzeWpqRkZYMUV3VFNlbEo3UHVEa1dCQ2ow?=
 =?utf-8?B?YUNvSDdxYW1RTXJPNkdBRUtBSWFkSnZmOUJjbTU4WmxKUlJRUXNYZTJ0Q1ox?=
 =?utf-8?B?SjNDaUJFRFdXYU1mWGtFL3lLVk05T3c0VE5hRkdJQTVDdFF1QXJXN3U4VUQ1?=
 =?utf-8?B?UXZwTWdLTlZrcXl3RGI5SXZrMTRLaTE1bWJIUDB4cXRmNjBVYWJSRE5QcTR3?=
 =?utf-8?B?aWdZdHNRTkhvbnN2OHk0RTZZMy8zdSt1N05tRXIydC9ENFBFU2R2NFluU1Fi?=
 =?utf-8?B?OC9hNXdPb3VXR2piYTJCcCsrQ1hOVHB1UmZUUDFYb1BuQkh6TXN5SG5tYjZ6?=
 =?utf-8?B?UjBkcFFDSlR1S3BWUTE0UUU2Z3RIM0NjTzh0ZnAzcUNFaTRaKzRtZVZLa3Zn?=
 =?utf-8?B?Q1AyQXpvZVNTQ2NOREFoQytuYmxKdzV6MWJuUlkzNkI4YmsrUG5mT20zRVl1?=
 =?utf-8?B?aU1TR0pZQ1M1UnRpNXJBYlhzTmlHV1Y0U0l2NmxtZWplempQUkNYVGlHSVpz?=
 =?utf-8?B?czA4OEVvdHZ1L3FST2lmNXZzaEw5NlJ0bWVsRTFxZ0xYN2JIRXAyQXVCSTkx?=
 =?utf-8?B?QWtXYVByV3ZTMUUrTzR5bWwydDN3czhpTUhRT0V0MVVqMmwxS1plc0g2QUtV?=
 =?utf-8?B?M0VDdU51R0V3MWhybzF2OTR6aUI3eC9rT1ViQzhYRlh4dHZOYzBHVTFkaWtm?=
 =?utf-8?B?M0NWQlJmN0RrTGZsSmNDRGVsQXV1R3pDQ2E4bGEzZzdRUjVEMnhaTDR3dWo4?=
 =?utf-8?B?OExRaytEbmRITUdsL2dya3NUQ3AyY3A5aUVjSHdFdTBxZW52ekZlWG9LLzUx?=
 =?utf-8?B?TkhTd3RYTHYzcmNsbGVRNUowVTUxT1ZxbjVRSkcyMGMxK01sSVVmQUFwZFVt?=
 =?utf-8?B?N1NJOU5kd2xEOXFKZy9EbFRDUlpncSsvckVEK3hwUXhBb3VzM01DK3lsWDVl?=
 =?utf-8?B?Tld2OFhGbDE0V2Z3VGI5cSt2VWhpV1BYeVR4SDMyNkdnVEdrelI0SlFIa2Ru?=
 =?utf-8?Q?hT+5P7?=
X-Forefront-Antispam-Report: CIP:164.130.1.44; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 07:02:38.7227 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89f8bd15-6a01-4081-6b5b-08ddeea5b27f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.44];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D10.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7214
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDIzNyBTYWx0ZWRfX35a87J4cXObk
 EuJoCXftfCubc1nQS6mHCfdlNtl2cwKmwahgKurK9teMMNVEQOATnhNafJ2Z6SKyN3jpAj7ym1+
 FC73G2EZjVzdsv4jFuDUeDncXCNEBksdGwNice661x0iQnw7kT1lz7uP1mtUPLKQ+qak6nF0hzZ
 ag5xM/kgYJebSS0wS+HEoxzQEZn+UEzAR5i4+hP2OJMgIzi+T0fBXbK6qCq0I878Qq/47ZdkGNy
 qUmo3D+9vqYexesFcmU1pqBKgbGCguj0YIBU19vhbd8PZIrSZvWACRS+j8NpwPGLxy3HFRg8oCF
 1CydpUc6y3Y2cZrKIGije4znd8DIkBdX5rj6PjeXM0t7xtqlvXViF70W4ehkRp5cNjYxPs48Ze9
 auwbPh6z
X-Proofpoint-GUID: WoTko_D11LA2hCVYcbJJwrM3P2XBR-Jr
X-Proofpoint-ORIG-GUID: WoTko_D11LA2hCVYcbJJwrM3P2XBR-Jr
X-Authority-Analysis: v=2.4 cv=WLB/XmsR c=1 sm=1 tr=0 ts=68be7f93 cx=c_pps
 a=MXECSllGvYgIsX+BZe3N1w==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=SAHXIHsbQyQA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=FUbXzq8tPBIA:10 a=b3CbU_ItAAAA:8
 a=8b9GpE9nAAAA:8 a=pGLkceISAAAA:8 a=k-42gJp3AAAA:8 a=phlkwaE_AAAA:8
 a=UqXVGP2rzc_oCBmQQvEA:9 a=QEXdDO2ut3YA:10
 a=Rv2g8BkzVjQTVhhssdqe:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=uCSXFHLys93vLW5PjgO_:22
 a=uKTQOUHymn4LaG7oTSIC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 clxscore=1011 adultscore=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2507300000
 definitions=main-2509050237
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] clk: stm32: Pass udevice pointer to
 clk_register_composite()
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



On 9/7/25 01:00, Marek Vasut wrote:
> The clk_register_composite() does clk_resolve_parent_clk() look up,
> which requires valid udevice pointer. Do not pass NULL, pass a valid
> device pointer to prevent hang on registering ck_usbo_48m clock on
> STM32MP13xx.
> 
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Sean Anderson <seanga2@gmail.com>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: u-boot@lists.denx.de
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  drivers/clk/stm32/clk-stm32-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/stm32/clk-stm32-core.c b/drivers/clk/stm32/clk-stm32-core.c
> index a0ae89d0912..858f122db1a 100644
> --- a/drivers/clk/stm32/clk-stm32-core.c
> +++ b/drivers/clk/stm32/clk-stm32-core.c
> @@ -309,7 +309,7 @@ clk_stm32_register_composite(struct udevice *dev,
>  		gate_ops = &clk_stm32_gate_ops;
>  	}
>  
> -	clk = clk_register_composite(NULL, cfg->name,
> +	clk = clk_register_composite(dev, cfg->name,
>  				     parent_names, num_parents,
>  				     mux_clk, mux_ops,
>  				     div_clk, div_ops,

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
