Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 92115C5E54C
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Nov 2025 17:49:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5DBB6C628DB;
	Fri, 14 Nov 2025 16:49:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B81EC628DA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 16:49:40 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEGYrhF2707116; Fri, 14 Nov 2025 17:49:31 +0100
Received: from as8pr04cu009.outbound.protection.outlook.com
 (mail-westeuropeazon11011069.outbound.protection.outlook.com [52.101.70.69])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7pby7c-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 17:49:30 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vPPVGfdGR8n6Cm5j7DA4V6Zob/sNU2n85Qn47d47BbuiThGjhOE4jhQXcU+bJHNLuOsP4CSGSOHiC/ijcgWJkAI0kAlkFJchfkAUu3bs/4ZCFYtQXncc/qEd9G5SnVNdvvXcYDBgiK94Su4OYce1+FTGOyf9VwMuwi1+SBaK9IAKvH/9SlFk678C33ddswzN18ndf/yWnhJBBU8t6DQlRZUATLgUi4zfyo0kw7MvXGlPxlc+dDORrJkry/7FGL1HvybMPQJnmDUzUBjAL7wHRuJpszfNLVZP41g4by6ZadF3Mi8D+cNhBLJ8bmjykvS5Z8QFI4Gb7FEUDJr60nRoXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xA7B8nMGUZyc1zTMVDLFiR0Y1AsMQbKY4jgXfll+fP8=;
 b=Ys+0cQQfwaLVnBgViMn1Ehd5UhTTJxaHYaVmqrNeo7J0pkcoV1VzmHEjr+fXhcFmN3FL7xBkCI2xrcSp6AO7JOtEM7g8tPM6jDq9vidd9TwBphiSeGvn2/EeQ8du1/xMbUnMGIbEFSYsykmf8Tlms1QjcHLAXUokQ01deV//tolLgzknRw3kKQIGgJqyJzvq71tbjUsHRMbKZ/Hzw559ONayStj4OojXcnbtpKfV+glhr9PSYWYvLFpSBpJviYvKCqB59inswCcGYYh0ZWqtgz/AwwgRqOyZkJsCvHMPi9tWuCSHdHd048JyVjfCUqV9Q09NX8x5WxuAr81Q0RDxuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=konsulko.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xA7B8nMGUZyc1zTMVDLFiR0Y1AsMQbKY4jgXfll+fP8=;
 b=KbMHKPlq1P3I8ltfq4aXTzgg/GBgMqQO323xyzmNR4M5sBeM9BS7Jlb6VGGWTGhtvlSiLD26UJT29709HLBrE0qTdY2re8d730FrwZ+aWKZ9rQnxQ3KxGw7KSK3cnjwTqHHO3C8kcJ81sAujybcNhUhV1Q+pdq3+7/1OmNpvqioxwLYJq5lf7Z8axjAlTXKRdGqy1BngcGtVJeJVMoqAu1n5Dy8k8X+JetuT5v2a8IlNEyucUCm+t+vmZDbnmB6wTBRVOTjsV/I7OdIp7xUb2mg25HZSZA+oahSBw1f1UR3fPhGun32h5EUs31fkj486sQ0eTe9Bu0HQnEb3Di9Tjw==
Received: from DUZPR01CA0212.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::18) by AM0PR10MB3458.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:15c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 16:49:28 +0000
Received: from DU6PEPF0000952A.eurprd02.prod.outlook.com
 (2603:10a6:10:4b4:cafe::b6) by DUZPR01CA0212.outlook.office365.com
 (2603:10a6:10:4b4::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Fri,
 14 Nov 2025 16:49:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000952A.mail.protection.outlook.com (10.167.8.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 16:49:28 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:49:39 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:49:27 +0100
Message-ID: <4f85a946-bb6e-4f4b-afa1-f22054cdc1b0@foss.st.com>
Date: Fri, 14 Nov 2025 17:49:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yannick FERTRE <yannick.fertre@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>,
 Tom Rini <trini@konsulko.com>, Kamil Lulko <kamil.lulko@gmail.com>,
 Dillon Min <dillon.minfei@gmail.com>, "Patrick
 Delaunay" <patrick.delaunay@foss.st.com>, Anatolij Gustschin
 <ag.dev.uboot@gmail.com>, Simon Glass <sjg@chromium.org>, Sumit Garg
 <sumit.garg@kernel.org>, Philippe Cornu <philippe.cornu@foss.st.com>
References: <20250904-master-v3-0-b42847884974@foss.st.com>
 <20250904-master-v3-6-b42847884974@foss.st.com>
 <7b886fcf-3f2a-48a3-b496-3793d381b6ef@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <7b886fcf-3f2a-48a3-b496-3793d381b6ef@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000952A:EE_|AM0PR10MB3458:EE_
X-MS-Office365-Filtering-Correlation-Id: 14d491e4-ebf3-4a0e-6141-08de239dc6f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WXZ6VnhvM0wvNzBSbU4rYUR2cXhiT3o3V2RsL05aVnNsQWNMYm9nbnZJQW1J?=
 =?utf-8?B?R2V0RmQ3MUhxdHVOdkxMMTFLVWxlZU44WFBjSlZHQ0JyaU9CTWdyYk9FWm43?=
 =?utf-8?B?elFmWjZxcHlveVBGMCs1MURuUFdMWG0va0pIRDVnaDRyVk5FRnhEWkZYeFgr?=
 =?utf-8?B?R1hud3NIVldFTDFBSFFUN3Y5bkp4eWsxanVFeERRcElPNVpJY0JNOSszcmFL?=
 =?utf-8?B?T25JWWF2TGdvWU81NUlvK0k2am1WU3VvV1VZOFgyekxweEN4aGhaR0p5QjRN?=
 =?utf-8?B?a3BJU2lXdlBrSXl4ZWRaVDNXc1A5eURSUnlkbTBsWnd3Tys3dmE1R2drTWQx?=
 =?utf-8?B?MkV4R1MxSVVzMFdJb1R6SGJxM3ZONE5uMHRwVWU5WXEzcEx0ZytKa3dlUGxP?=
 =?utf-8?B?WTlUdUwwRlhtRGQxdkhxOE9icTJPM3VCQTJFdWh1UVZ0eUpLc1V6NVM1cjUw?=
 =?utf-8?B?RWdhaUhQN0lVS1VJVmtYbGcrMnJqVnJ6M2hGUTdkSmtJU05HOERLbzNyb0Fs?=
 =?utf-8?B?ZVl4TXlieEQwa1ZiaTEraGovcnFvYVdSbGdBZmFMbUlleDNwSHpGcEY5MGk3?=
 =?utf-8?B?SDhsUExVNzR5OHhPSjIzbWZlTFBsUWx5SjRoVVUxbEN2WHpZWkk0NkpySS9E?=
 =?utf-8?B?RFpjYi8xYmRBc1NNTHNDUzJMeFMrK2RrOURxOEdQeWd6QW1aY0VKOUlBWVlo?=
 =?utf-8?B?dGRRUUJSclkvN1BTWGwzY3FpcmQwbXRYalJQVVlMVzYybXRTVXlFV3Bia3JW?=
 =?utf-8?B?RkJUQnIrZW9JL2k3S2dRZWtydWY0Q3FzUWtEdFZvam9GTW1iS1Q5WVRtNWxD?=
 =?utf-8?B?WFdTZklJbFpzTGhDQm9sb3ZpRzlBeHMzaSt2T3drUWlLWUdoVmE5OS9GakFC?=
 =?utf-8?B?cnNxejVYUnNobi9TVm54SlJ1dXNEUjMzbDNuMW5xTENvc0FtcnE2SVMvcDhu?=
 =?utf-8?B?c3hwQktkUVdLa2w3YmJqQStyQTFPOW9lc2ZqTlBtcHlZNVdCYW82dFpseEx4?=
 =?utf-8?B?RHM3OStVY0dOeFhibnRwMmFFRi9nMmg4RUEwcXhuRUFvMEdRbWVOSzFJREUw?=
 =?utf-8?B?blA4anZGek14QjlwMk9kaWJaeTB1cWxuWkxsQ0dldFExYktPZGJkUFhwY0Vh?=
 =?utf-8?B?VkVBUmltclFpOVBzbU1UNXpFdWF1WDB4azVyWHhKbnBjVlFvaHVZRi9JQlJu?=
 =?utf-8?B?OXZYZDVCRUZXbEdsWGxudW9xeVMvREg0TWxjKzRXRzZ0QmI4c1Y3b0RmSVlF?=
 =?utf-8?B?ZzIrdVdLdHYreDNodnVzZUJic3NvR0M4RVJ5eTBXUzZvc0xaWHh6cEFVWDFu?=
 =?utf-8?B?ems5TFlmZnpXemlUd1dZaitlcnRlUWFpcWoyRGg0WXJRdWQySDh5NkNjOU1Y?=
 =?utf-8?B?a2tIMEZUZWdtOXVzbnQ2V1RHY3ZEZ2lyczI5eVY3eUpnREdWNXVYWDA1eERP?=
 =?utf-8?B?MHAwWkRIT2RTYWVsY0tud3cxaDRocnpHQ1pIL2R6ejJVcGtMbGhmSkl3ai9N?=
 =?utf-8?B?VTFwMjNyYStrZ3ZXdE5yQis2cWVaTmJrZTJ6dDNVd25ETEd6OHNpYjl5NG4x?=
 =?utf-8?B?M2dQZnVvY25obm9YY3VCMDRBRzluMHdWUDJpTUxQcytqUmgyejBadC81ZFA2?=
 =?utf-8?B?SE81djZHUGNCbzJUYllqR1JFcGRYYk5NU1RiWW5vT1U0VmtQS00zeE92cHJl?=
 =?utf-8?B?SXZpSXNJRFBTRTVheklsN0xKQXM0QXpQQ1ZGdSszeU5ZL1VPUmFFSUJTQVZD?=
 =?utf-8?B?Y3VjbTZWbmxJUjhnSWlpck1vbFJJT2VEQVpucU9VTng5UUNmKzkyMVBzZytV?=
 =?utf-8?B?T2FlbmdvQXp4K09aby95ZFRmcjdtTzM2N0lKN2s1WkhIR0x2NEUrRGczanc2?=
 =?utf-8?B?dng4cjVyOFE5bzhTT00rQ1pSUVVrWkdQQlkxanhOeVdkbUJyL3JEMGJ1QnNn?=
 =?utf-8?B?U2Q5ak1PWEJWU05BWFNJMDVkQXpuWEkybXhwS3p5VGhac2RVamcybW9ONEJo?=
 =?utf-8?B?emtFV21pdVhoalRyNkRPQUF3RHR3bGQxQ1Q4bTR3SEd3cWpKVkhZWlAvWThT?=
 =?utf-8?B?YnRHcGxxVktQUnpqYzZ4dnNwY3d4VVdIbDF3VFlCYUxtV1RkZitUNTJIY2xZ?=
 =?utf-8?Q?xS30ZA/bTp0Rx9lgCpXcaB+IN?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(921020); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:49:28.6948 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14d491e4-ebf3-4a0e-6141-08de239dc6f7
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000952A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3458
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEzNSBTYWx0ZWRfX0/N1u7ewyyQs
 op+8jVpigzAwc8VtqRU3ZL9qefWEfVUMDoBmi9ZLclWl/4o2L3SMZhgajj+vgRmJ4Y0ZYXw/SgI
 4D3fTFRdnAlcvN7dBYLThL0NHXPDrQ9Pf5dYE2Pm4fjQR9BuEj1enkPvjDbdPz38bS6pwjH/pMF
 MjUmY7KMuPsANJm+rgT22d/+/aw8VXG3Od/x0wZQ+heUX29ynsUG4rOQCwZ71r4+uDbFgQI+Q8j
 ykRru39xWC50ZwLdcfUVv5Aol3qHevD4sZle8J81nhawvGI/qbTnxZ0n8ZyNCmqnfdQVnxfv2HS
 ji3rVvxKR+/jgRSnK2oWhDuf2oz8PrPEDcYswqK6k/weKPCU9JjI1XOpmfSB+4JwD/Mq2yv0Qn5
 pST90yyscvo/BHSC5PrLIUaLToUjXA==
X-Authority-Analysis: v=2.4 cv=avi/yCZV c=1 sm=1 tr=0 ts=69175d9a cx=c_pps
 a=p0FW1gfgMMgpKxjma+OggQ==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=-wlswuwspTsSGKsllXoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: nnumv0DTvfc9BXPqCMO6HWEl9fzwL5Ch
X-Proofpoint-GUID: nnumv0DTvfc9BXPqCMO6HWEl9fzwL5Ch
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140135
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH v3 6/7] ARM: dts: stm32: use LTDC and LVDS
 nodes before relocation in stm32mp25-u-boot
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

CgpPbiAxMC8zMC8yNSAwODo0MywgWWFubmljayBGRVJUUkUgd3JvdGU6Cj4gSGkgUmFwaGFlbCwK
PiAKPiBUaGFua3MgZm9yIHRoZSBwYXRjaC4KPiAKPiBBY2tlZC1ieTogWWFubmljayBGZXJ0cmU8
eWFubmljay5mZXJ0cmVAZm9zcy5zdC5jb20+Cj4gCj4gTGUgMDQvMDkvMjAyNSDDoCAxNDo1Mywg
UmFwaGFlbCBHYWxsYWlzLVBvdSBhIMOpY3JpdMKgOgo+PiBVc2UgTFREQyBhbmQgTFZEUyBub2Rl
cyBpbiBhbGwgYm9vdCBwaGFzZXMuwqAgVGhpcyBpcyBzcGVjaWFsbHkgdXNlZnVsCj4+IGJlZm9y
ZSBVLUJvb3QgcmVsb2NhdGlvbi4KPj4KPj4gUmV2aWV3ZWQtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8
cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+PiBSZXZpZXdlZC1ieTogWWFubmljayBGZXJ0
cmUgPHlhbm5pY2suZmVydHJlQGZvc3Muc3QuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBSYXBoYWVs
IEdhbGxhaXMtUG91IDxyYXBoYWVsLmdhbGxhaXMtcG91QGZvc3Muc3QuY29tPgo+PiAtLS0KPj4g
wqAgYXJjaC9hcm0vZHRzL3N0bTMybXAyNS11LWJvb3QuZHRzaSB8IDggKysrKysrKysKPj4gwqAg
MSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9h
cm0vZHRzL3N0bTMybXAyNS11LWJvb3QuZHRzaSBiL2FyY2gvYXJtL2R0cy9zdG0zMm1wMjUtdS1i
b290LmR0c2kKPj4gaW5kZXggZDlhZWViNmQ1MTBkZjlkZWE5NzAwMTQ4Y2Y4YThhZDVlZmNmZDRm
OS4uM2FjMzVjNGE2YmMyN2M3MmVlZWI1MzI3NDJmZDQ0MTJiN2FhMWI4NSAxMDA2NDQKPj4gLS0t
IGEvYXJjaC9hcm0vZHRzL3N0bTMybXAyNS11LWJvb3QuZHRzaQo+PiArKysgYi9hcmNoL2FybS9k
dHMvc3RtMzJtcDI1LXUtYm9vdC5kdHNpCj4+IEBAIC05Myw2ICs5MywxNCBAQAo+PiDCoMKgwqDC
oMKgIGJvb3RwaC1hbGw7Cj4+IMKgIH07Cj4+IMKgICsmbHRkYyB7Cj4+ICvCoMKgwqAgYm9vdHBo
LWFsbDsKPj4gK307Cj4+ICsKPj4gKyZsdmRzIHsKPj4gK8KgwqDCoCBib290cGgtYWxsOwo+PiAr
fTsKPj4gKwo+PiDCoCAmcGluY3RybCB7Cj4+IMKgwqDCoMKgwqAgYm9vdHBoLWFsbDsKPj4gwqAg
fTsKPj4KQXBwbGllZCB0byB1LWJvb3Qtc3RtMzIvbWFzdGVyCgpUaGFua3MKUGF0cmljZQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBt
YWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1z
dG0zMgo=
