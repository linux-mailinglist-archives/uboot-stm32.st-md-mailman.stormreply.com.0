Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F687B58EB1
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Sep 2025 08:54:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3763C35E3F;
	Tue, 16 Sep 2025 06:54:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56ECFC35E3C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Sep 2025 06:54:27 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58G60Str016675;
 Tue, 16 Sep 2025 08:54:11 +0200
Received: from duzpr83cu001.outbound.protection.outlook.com
 (mail-northeuropeazon11012020.outbound.protection.outlook.com [52.101.66.20])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 494yy1268c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Sep 2025 08:54:10 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iqPYORy2iOkVP3ZIJWBYrKco1yVNaTFeFiL+UmpmsqC+MqiC1QtW8MWAD5hrBfdcIyKIQKvsOMJ8xHBuRNcNVQa6Usa0+xm7/DKWR9w1edhX1S8M1v5dko+PpV0rnAS/zl2Bf2bWPCyAACBOPnbJeGs38vkxtbi60PW9j+Is6ZXlmi2HS/aW+z8g/rMesKRotvXFyy7/4foAdXPULw16QUYjeL9yTbf3TJxljI74G3ACPmD34aJrOKIhbh/8Ctuhl/ZEyKgNpYeThSX/aFuVA7zgSC7de0nMNfeHduy5d1cKyuhumVflCCEyyWLU+yf/plgn9OPLENTzgqmf9F2zEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MBzkCT4HcnQfHK1xelzXfPOYO/4IS8ovID4mJZ31s0I=;
 b=DXReCbvwXKt5w20cP13lZJmFqkmsror2yD21eacnYt9vys4AiS7abh9z/E257OTUp7doGFHTu3hGsM702gDuD+wN4tf2YfVn8y3+L0XU9aSY9x8a7BZC/DYm71IhtlBoCnyFOcr2AsRTu81qNbbqL2BVSqe5sE1hvK6D6jgd/ruTw2PF1ch/R0Eg37HFy3sG37CAZb62opgjuOWORMfrFnkIS3y55nX2PB7zM3PfwNbZhYDW6EMHUk76Trd6ddIuZk1vhauaf81/gm1hU8Rf990l7djpqFeA2BSU3ofIEtGPwhbXw8vnQHutiv256yDYjP4MphMZqGr0l99kQ5rIxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=mailbox.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MBzkCT4HcnQfHK1xelzXfPOYO/4IS8ovID4mJZ31s0I=;
 b=Z+b6D4eZTRc4RcrdzZaA0v0ygcEDpcwu5/0IVsAj5w2fUGkunZvdpbSGsQUT/wO4QDm+msLMhqIGcfAoEG7KatTXVyHA8jpko4Kfauihk5f3+k3QhGbVpgFtJiYeLJtr6T0sGxvAAnUhhR0bTK16ylf5wvRk4yTaJFS7+Q7PXwo8l4ijU0nRihY9pPzAlIUZR0AeYmACrRp1bxlzNz+DbTlNMQ5tAU9LaXqVmJFMUKUkpDqVYKW7hGCxaDzFzgF2XfGAhm3fpw4vszSnYdQM8Kk+fyD8YBOXIVBaKjjDiToCKAoNLszphjEvDHmkU/TMf2pspX4LWTqpp1y51Y5tAw==
Received: from DUZP191CA0059.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::13)
 by AM7PR10MB3828.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:17c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 06:54:08 +0000
Received: from DB5PEPF00014B8F.eurprd02.prod.outlook.com
 (2603:10a6:10:4fa:cafe::f1) by DUZP191CA0059.outlook.office365.com
 (2603:10a6:10:4fa::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.12 via Frontend Transport; Tue,
 16 Sep 2025 06:54:08 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 DB5PEPF00014B8F.mail.protection.outlook.com (10.167.8.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Tue, 16 Sep 2025 06:54:07 +0000
Received: from SHFDAG1NODE2.st.com (10.75.129.70) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 16 Sep
 2025 08:51:42 +0200
Received: from [10.48.86.164] (10.48.86.164) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 16 Sep
 2025 08:54:05 +0200
Message-ID: <7355aea1-17af-477d-84b3-9f47ccbb35ee@foss.st.com>
Date: Tue, 16 Sep 2025 08:53:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>
References: <20250915005331.222677-1-marek.vasut@mailbox.org>
Content-Language: en-US
From: Christophe ROULLIER <christophe.roullier@foss.st.com>
In-Reply-To: <20250915005331.222677-1-marek.vasut@mailbox.org>
X-Originating-IP: [10.48.86.164]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8F:EE_|AM7PR10MB3828:EE_
X-MS-Office365-Filtering-Correlation-Id: 14b1886a-de78-4c24-ab02-08ddf4edd51d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024|7053199007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UWw0WmwwN09YTkpTOWg0YVJpL1dlTU9ydlpUNnprMjF6czRidFNHTzNJZmNm?=
 =?utf-8?B?ZjlHMUZkSUhqeWtDSklrbjdUM28wT3NKWFJhOEtIVjNjVVh4VVV5QkdGVnAr?=
 =?utf-8?B?RERnM1lUQWtwcUVjMEhsZEdWcmpXU0JMMVpYQzZwM3dvWXVIWXVVQmtGOURY?=
 =?utf-8?B?aU9vczZLUWRlQUY0NWQ1NEk3dkYvK3pod0w2VHk5SThjT1RvVzZJZ1pWajlm?=
 =?utf-8?B?cUFkV1M3NWRjNFJ5QThLMnR2NUV5RzgyZjVXRXZ1aDRwcUFCNTJReStCVGVP?=
 =?utf-8?B?OEpsVUx1VjBwVmhMZEpTcitrRUtid1RrT2lFb2N5SzI2KzlnemZjTGs1ZW4v?=
 =?utf-8?B?NHdDUEZHeEIwZmJPQTd2M0Z4MDJiTFQ3VFpHTFBDbjJhZUVJSU1aWDRMMEdM?=
 =?utf-8?B?SzZsaEg3NTFCczZkaVQ2NzRIcXNHZ1U5enJrd1RXYzdZSmZDTTdrRG5rWUhU?=
 =?utf-8?B?Q2tmNzlORTZ5L2E1aUhvMkVlT3FOYU9Cd0Q3MkYybVBSQ1FYaDBBV3MzYUxy?=
 =?utf-8?B?ZlQ4bStCMkp4NEJvaFFULzNMMi9lY291U3FNRHBsbXpPVDJZcEtQaU1LYm9J?=
 =?utf-8?B?RkVxdzg0bGZYd2JpMzg0MEF3YXJNb0lUSjFzRldpZllPVGJpYnJxSWY4d3Jy?=
 =?utf-8?B?UnJVcytYeTZhNnJadHUyalpFT3N5d1ZKeGZ2NFJzVnZvR29uaXBrOFJocUZJ?=
 =?utf-8?B?a21EcXVOQlF3M1pGdEVMY0FYSUxMRnozbGNJLy9VV0d0UjZHWGRoSEcwdmxy?=
 =?utf-8?B?M1gzd3o4WS8rRk1hcVFXMFZvWXNrVEJDQnhIUG5XZkNhL3FhNXVnd1EzRjRF?=
 =?utf-8?B?dFZ6N2IyK2hpdDRZWUtPRjlGRmRWMkwxQmFhaXZNWlZZejA4VFZwL1lkdEFH?=
 =?utf-8?B?QmQzeEFOTUR0UUg5SW1TbWxQSnNqQXJNMEljZEtLN0xqdlFMY2hWTHdManBm?=
 =?utf-8?B?ZjZ2UzU1MkprN2lqaTBPWlBneHlvaGtDOStTWXVNdXBTWllvZGNZVlVrYWg1?=
 =?utf-8?B?dGsyQUtUeGN6amtwWHIrK2RSUUpZeGpVKzQwUEllcDZiaFRFOGE4Ry9qREFr?=
 =?utf-8?B?WWhqcE1KYlNGcHc0OEoyNGZjdi9KRHdhMm9iTFlqZWJBWUl6MlA4TDJpaW4v?=
 =?utf-8?B?cEpFTU96dnRINmxRY0g4MWlkQXpmcTVTTk51UnlzMnNnTkNLdkd3Q0pPaWtr?=
 =?utf-8?B?TWM5cEhqaW05dkJQMEh3bHVpUEt1dTR3MUV1ZU11MnhqQXlTR2Jic0pIeHhl?=
 =?utf-8?B?ZFJNUU1zYnhQMXVZazlHdjZrZFJkQnVtZEVBZnhLMzF2cUJMcFJJVFhycTUx?=
 =?utf-8?B?MzhaWGdQQXZTOEgyODJHd2hxK2pTL2pBUDVmY1JlLy9od3I0RTVLTnhPMzdl?=
 =?utf-8?B?YVJ0QkthZ2RPMWtWdVpveCtsanU4cXBVQXgrckkwK3NSREVDNXdSRmFQZzNk?=
 =?utf-8?B?aVhzck5ITlBIV1dRNzZjeCtOTnJrV1Erc05nVnBMZVhFV3g3ZTBEMnR3amNT?=
 =?utf-8?B?UVJSZ0MvUVlGckdYTFgzVnhXRW9wZG5neWhyNml6b0lTSUdLYVBTdUpjL1FK?=
 =?utf-8?B?eVdsQkk2Q2tJR0Fpd3VJTkdyNmhGN0JGR3FxSG91SDVFRW5aNnVNZUFwTzJE?=
 =?utf-8?B?T3lLSGJUT1IzZ0pidmpaSHFVNHRuNnRvVW9pclAvK01iaWdJNVcveWQxOUN5?=
 =?utf-8?B?NWFydDZ0V3B6VmtqdHlLSTJ3Y3NKZE5JRXhVVkhTRFJ0QUY4ZURNaWZ0ZVJ4?=
 =?utf-8?B?SjI4UExjd1ZvNHEyUWE3cHA5eWV0c1lTL0hlbTNGQzdpNTBWcW55bVZJOTBY?=
 =?utf-8?B?UVhJRDd5aEVENGF4YVYrMGNncjZsTEFTbjlxQWRGaG9GMmo2RGNFMGo4Q1k1?=
 =?utf-8?B?dXlYQ1JDQy9NYUpDQlpOOVBNU05BdWU4a2Q3dzdlNUZGN2JOdmJxNHJBNHQx?=
 =?utf-8?B?eGNScUFadEwxWlFWaXl2VlIwWDRTVTJTTHB5MTJ1QUg3eUkrNDJHR0wvU1VY?=
 =?utf-8?B?NzlRN1NjVXBEejFBTTNWYjNaLzFrYzk1KzlRVWcyR1BDdjY1U3QyT3Z4RDBy?=
 =?utf-8?Q?gNYuj7?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(7053199007)(8096899003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 06:54:07.5132 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14b1886a-de78-4c24-ab02-08ddf4edd51d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3828
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyMyBTYWx0ZWRfX1cfJZNxO5dHd
 JufH85YnZQmEEC3FvF2bi8cEtZITv04BmhTqYBd+tylJBK5UOYT8soSk0wjwnxH6JqIKCqsymzJ
 LB3mPGt880jl52dmbkzC/9PKRAh67W1wi4WPKV6XT6A9V6aDS7YETb2XO0+lv4JM4jIEpdmy2p3
 pomJqQqEVGQN27Kq1WuF44uAsidMcfq7QhEBfzvhH0xG8ktYQLtw0GDWoUSsUilXKjvDWdxCWXr
 io0CqcFK/Qoggvd3z/nAwBfzTQJgd3OOQvlHKkUr/RXqgvjQU8jq0tPr+URKMJZP6IwdJYGpIJy
 Ubm9RGugvjMY8zAdokaBLDZ5TgmqU8wwyOPZxUYD+K9gIyohI1ASys7lCtBB9d/lE6aqVbSpbIZ
 525OhCvx
X-Proofpoint-ORIG-GUID: QxPZXZG-qgNwK_NwXdejrm-l-kJzkota
X-Proofpoint-GUID: QxPZXZG-qgNwK_NwXdejrm-l-kJzkota
X-Authority-Analysis: v=2.4 cv=X+9SKHTe c=1 sm=1 tr=0 ts=68c90992 cx=c_pps
 a=zBo0Hn18DklVKBP/19+Pqg==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=Su15o2SJOdkA:10 a=yJojWOMRYYMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=b3CbU_ItAAAA:8 a=8b9GpE9nAAAA:8
 a=gVGD3344AAAA:8 a=pGLkceISAAAA:8 a=k-42gJp3AAAA:8 a=phlkwaE_AAAA:8
 a=mt9yJrkggKRqU94j67QA:9 a=QEXdDO2ut3YA:10
 a=WNj6xPxDx39IkADCwcMA:9 a=DqOT5d7piJGlU3_B:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=Rv2g8BkzVjQTVhhssdqe:22 a=T3LWEMljR5ZiDmsYVIUa:22
 a=xQEvYfgLW3QvObN0DhJi:22 a=uCSXFHLys93vLW5PjgO_:22 a=uKTQOUHymn4LaG7oTSIC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 spamscore=0
 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1011
 suspectscore=0 adultscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130023
Cc: Tom Rini <trini@konsulko.com>, Joe Hershberger <joe.hershberger@ni.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Ramon Fried <rfried.dev@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v2] net: dwc_eth_qos: Fix support for
	stm32mp2 platform
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
Content-Type: multipart/mixed; boundary="===============4692296675924785742=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============4692296675924785742==
Content-Type: multipart/alternative;
	boundary="------------7qY5yfDz3ktwHfW4j9dgVFGQ"
Content-Language: en-US

--------------7qY5yfDz3ktwHfW4j9dgVFGQ
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 9/15/25 02:53, Marek Vasut wrote:

> The layout of SYSCFG_ETHnCR on STM32MP25xx is slightly different yet again.
> Add missing swizzling to program the correct register with the correct content.
>
> Fixes: 20afca89ed53 ("net: dwc_eth_qos: add support of stm32mp2 platform")
> Signed-off-by: Marek Vasut<marek.vasut@mailbox.org>
> ---
> Cc: Christophe Roullier<christophe.roullier@foss.st.com>
> Cc: Joe Hershberger<joe.hershberger@ni.com>
> Cc: Patrice Chotard<patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay<patrick.delaunay@foss.st.com>
> Cc: Ramon Fried<rfried.dev@gmail.com>
> Cc: Tom Rini<trini@konsulko.com>
> Cc:u-boot@lists.denx.de
> Cc:uboot-stm32@st-md-mailman.stormreply.com
> ---
> V2: Gate off SELMII bit on both MP13 and MP2
> ---
>   drivers/net/dwc_eth_qos_stm32.c | 44 ++++++++++++++++++++++++++-------
>   1 file changed, 35 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/net/dwc_eth_qos_stm32.c b/drivers/net/dwc_eth_qos_stm32.c
> index 7a28f2a3e83..57ac528ebf5 100644
> --- a/drivers/net/dwc_eth_qos_stm32.c
> +++ b/drivers/net/dwc_eth_qos_stm32.c
> @@ -137,13 +137,15 @@ static int eqos_probe_syscfg_stm32(struct udevice *dev,
>   	const bool eth_ref_clk_sel = dev_read_bool(dev, "st,eth-ref-clk-sel");
>   	/* SoC is STM32MP13xx with two ethernet MACs */
>   	const bool is_mp13 = device_is_compatible(dev, "st,stm32mp13-dwmac");
> +	/* SoC is STM32MP25xx with two ethernet MACs */
> +	const bool is_mp2 = device_is_compatible(dev, "st,stm32mp25-dwmac");
>   	/* Gigabit Ethernet 125MHz clock selection. */
>   	const bool eth_clk_sel = dev_read_bool(dev, "st,eth-clk-sel");
>   	/* Ethernet clock source is RCC. */
>   	const bool ext_phyclk = dev_read_bool(dev, "st,ext-phyclk");
>   	struct regmap *regmap;
>   	u32 regmap_mask;
> -	u32 value;
> +	u32 reg, value;
>   
>   	regmap = syscon_regmap_lookup_by_phandle(dev, "st,syscon");
>   	if (IS_ERR(regmap))
> @@ -163,7 +165,7 @@ static int eqos_probe_syscfg_stm32(struct udevice *dev,
>   		 * acts as a selector between 0:GMII and 1:MII. As STM32MP13xx
>   		 * supports only MII, ETH_SELMII is not present.
>   		 */
> -		if (!is_mp13)	/* Select MII mode on STM32MP15xx */
> +		if (!is_mp13 && !is_mp2) /* Select MII mode on STM32MP15xx */
>   			value |= SYSCFG_PMCSETR_ETH_SELMII;
>   		break;
>   	case PHY_INTERFACE_MODE_GMII:	/* STM32MP15xx only */
> @@ -213,15 +215,39 @@ static int eqos_probe_syscfg_stm32(struct udevice *dev,
>   		return -EINVAL;
>   	}
>   
> -	/* Shift value at correct ethernet MAC offset in SYSCFG_PMCSETR */
> -	value <<= ffs(regmap_mask) - ffs(SYSCFG_PMCSETR_ETH1_MASK);
> +	if (is_mp2) {
> +		/*
> +		 * STM32MP25xx SYSCFG EthernetN control register
> +		 * has ETHn_CLK_SEL and ETHn_REF_CLK_SEL bits
> +		 * swapped, swizzle them back in place. Bitfield
> +		 * ETHn_SEL is shifted by 1 right, fix this up.
> +		 */
> +		value = ((value & SYSCFG_PMCSETR_ETH_SEL_MASK) >> 1) |
> +			((value & SYSCFG_PMCSETR_ETH_CLK_SEL) << 1) |
> +			((value & SYSCFG_PMCSETR_ETH_REF_CLK_SEL) >> 1);
> +
> +		/*
> +		 * STM32MP25xx SYSCFG EthernetN control register
> +		 * bits always start at bit shift 0 and there is
> +		 * one register for each MAC, shift the register
> +		 * content in place.
> +		 */
> +		value >>= ffs(SYSCFG_PMCSETR_ETH1_MASK) - 1;
> +
> +		reg = dev_read_u32_index_default(dev, "st,syscon", 1, 0);
>   
> -	/* Update PMCCLRR (clear register) */
> -	regmap_write(regmap, is_mp13 ?
> -			     SYSCFG_PMCCLRR_MP13 : SYSCFG_PMCCLRR_MP15,
> -			     regmap_mask);
> +		return regmap_write(regmap, reg, value);
> +	} else {
> +		/* Shift value at correct ethernet MAC offset in SYSCFG_PMCSETR */
> +		value <<= ffs(regmap_mask) - ffs(SYSCFG_PMCSETR_ETH1_MASK);
>   
> -	return regmap_update_bits(regmap, SYSCFG_PMCSETR, regmap_mask, value);
> +		/* Update PMCCLRR (clear register) */
> +		regmap_write(regmap, is_mp13 ?
> +				     SYSCFG_PMCCLRR_MP13 : SYSCFG_PMCCLRR_MP15,
> +				     regmap_mask);
> +
> +		return regmap_update_bits(regmap, SYSCFG_PMCSETR, regmap_mask, value);
> +	}
>   }
>   
>   static int eqos_probe_resources_stm32(struct udevice *dev)

Reviewed-by: Christophe ROULLIER<christophe.roullier@foss.st.com>

--------------7qY5yfDz3ktwHfW4j9dgVFGQ
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre
    style="font-family: monospace,monospace; white-space: pre-wrap;">
<span style="white-space: normal">On 9/15/25 02:53, Marek Vasut wrote:</span></pre>
    <blockquote type="cite"
      cite="mid:20250915005331.222677-1-marek.vasut@mailbox.org">
      <pre class="moz-quote-pre" wrap="">The layout of SYSCFG_ETHnCR on STM32MP25xx is slightly different yet again.
Add missing swizzling to program the correct register with the correct content.

Fixes: 20afca89ed53 ("net: dwc_eth_qos: add support of stm32mp2 platform")
Signed-off-by: Marek Vasut <a class="moz-txt-link-rfc2396E" href="mailto:marek.vasut@mailbox.org">&lt;marek.vasut@mailbox.org&gt;</a>
---
Cc: Christophe Roullier <a class="moz-txt-link-rfc2396E" href="mailto:christophe.roullier@foss.st.com">&lt;christophe.roullier@foss.st.com&gt;</a>
Cc: Joe Hershberger <a class="moz-txt-link-rfc2396E" href="mailto:joe.hershberger@ni.com">&lt;joe.hershberger@ni.com&gt;</a>
Cc: Patrice Chotard <a class="moz-txt-link-rfc2396E" href="mailto:patrice.chotard@foss.st.com">&lt;patrice.chotard@foss.st.com&gt;</a>
Cc: Patrick Delaunay <a class="moz-txt-link-rfc2396E" href="mailto:patrick.delaunay@foss.st.com">&lt;patrick.delaunay@foss.st.com&gt;</a>
Cc: Ramon Fried <a class="moz-txt-link-rfc2396E" href="mailto:rfried.dev@gmail.com">&lt;rfried.dev@gmail.com&gt;</a>
Cc: Tom Rini <a class="moz-txt-link-rfc2396E" href="mailto:trini@konsulko.com">&lt;trini@konsulko.com&gt;</a>
Cc: <a class="moz-txt-link-abbreviated" href="mailto:u-boot@lists.denx.de">u-boot@lists.denx.de</a>
Cc: <a class="moz-txt-link-abbreviated" href="mailto:uboot-stm32@st-md-mailman.stormreply.com">uboot-stm32@st-md-mailman.stormreply.com</a>
---
V2: Gate off SELMII bit on both MP13 and MP2
---
 drivers/net/dwc_eth_qos_stm32.c | 44 ++++++++++++++++++++++++++-------
 1 file changed, 35 insertions(+), 9 deletions(-)

diff --git a/drivers/net/dwc_eth_qos_stm32.c b/drivers/net/dwc_eth_qos_stm32.c
index 7a28f2a3e83..57ac528ebf5 100644
--- a/drivers/net/dwc_eth_qos_stm32.c
+++ b/drivers/net/dwc_eth_qos_stm32.c
@@ -137,13 +137,15 @@ static int eqos_probe_syscfg_stm32(struct udevice *dev,
 	const bool eth_ref_clk_sel = dev_read_bool(dev, "st,eth-ref-clk-sel");
 	/* SoC is STM32MP13xx with two ethernet MACs */
 	const bool is_mp13 = device_is_compatible(dev, "st,stm32mp13-dwmac");
+	/* SoC is STM32MP25xx with two ethernet MACs */
+	const bool is_mp2 = device_is_compatible(dev, "st,stm32mp25-dwmac");
 	/* Gigabit Ethernet 125MHz clock selection. */
 	const bool eth_clk_sel = dev_read_bool(dev, "st,eth-clk-sel");
 	/* Ethernet clock source is RCC. */
 	const bool ext_phyclk = dev_read_bool(dev, "st,ext-phyclk");
 	struct regmap *regmap;
 	u32 regmap_mask;
-	u32 value;
+	u32 reg, value;
 
 	regmap = syscon_regmap_lookup_by_phandle(dev, "st,syscon");
 	if (IS_ERR(regmap))
@@ -163,7 +165,7 @@ static int eqos_probe_syscfg_stm32(struct udevice *dev,
 		 * acts as a selector between 0:GMII and 1:MII. As STM32MP13xx
 		 * supports only MII, ETH_SELMII is not present.
 		 */
-		if (!is_mp13)	/* Select MII mode on STM32MP15xx */
+		if (!is_mp13 &amp;&amp; !is_mp2) /* Select MII mode on STM32MP15xx */
 			value |= SYSCFG_PMCSETR_ETH_SELMII;
 		break;
 	case PHY_INTERFACE_MODE_GMII:	/* STM32MP15xx only */
@@ -213,15 +215,39 @@ static int eqos_probe_syscfg_stm32(struct udevice *dev,
 		return -EINVAL;
 	}
 
-	/* Shift value at correct ethernet MAC offset in SYSCFG_PMCSETR */
-	value &lt;&lt;= ffs(regmap_mask) - ffs(SYSCFG_PMCSETR_ETH1_MASK);
+	if (is_mp2) {
+		/*
+		 * STM32MP25xx SYSCFG EthernetN control register
+		 * has ETHn_CLK_SEL and ETHn_REF_CLK_SEL bits
+		 * swapped, swizzle them back in place. Bitfield
+		 * ETHn_SEL is shifted by 1 right, fix this up.
+		 */
+		value = ((value &amp; SYSCFG_PMCSETR_ETH_SEL_MASK) &gt;&gt; 1) |
+			((value &amp; SYSCFG_PMCSETR_ETH_CLK_SEL) &lt;&lt; 1) |
+			((value &amp; SYSCFG_PMCSETR_ETH_REF_CLK_SEL) &gt;&gt; 1);
+
+		/*
+		 * STM32MP25xx SYSCFG EthernetN control register
+		 * bits always start at bit shift 0 and there is
+		 * one register for each MAC, shift the register
+		 * content in place.
+		 */
+		value &gt;&gt;= ffs(SYSCFG_PMCSETR_ETH1_MASK) - 1;
+
+		reg = dev_read_u32_index_default(dev, "st,syscon", 1, 0);
 
-	/* Update PMCCLRR (clear register) */
-	regmap_write(regmap, is_mp13 ?
-			     SYSCFG_PMCCLRR_MP13 : SYSCFG_PMCCLRR_MP15,
-			     regmap_mask);
+		return regmap_write(regmap, reg, value);
+	} else {
+		/* Shift value at correct ethernet MAC offset in SYSCFG_PMCSETR */
+		value &lt;&lt;= ffs(regmap_mask) - ffs(SYSCFG_PMCSETR_ETH1_MASK);
 
-	return regmap_update_bits(regmap, SYSCFG_PMCSETR, regmap_mask, value);
+		/* Update PMCCLRR (clear register) */
+		regmap_write(regmap, is_mp13 ?
+				     SYSCFG_PMCCLRR_MP13 : SYSCFG_PMCCLRR_MP15,
+				     regmap_mask);
+
+		return regmap_update_bits(regmap, SYSCFG_PMCSETR, regmap_mask, value);
+	}
 }
 
 static int eqos_probe_resources_stm32(struct udevice *dev)</pre>
    </blockquote>
    <br>
    <pre
    style="font-family: monospace,monospace; white-space: pre-wrap;">Reviewed-by: Christophe ROULLIER <a class="moz-txt-link-rfc2396E" href="mailto:christophe.roullier@foss.st.com">&lt;christophe.roullier@foss.st.com&gt;</a></pre>
    <blockquote type="cite"
      cite="mid:20250915005331.222677-1-marek.vasut@mailbox.org">
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------7qY5yfDz3ktwHfW4j9dgVFGQ--

--===============4692296675924785742==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4692296675924785742==--
