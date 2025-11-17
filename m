Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CE6C62A69
	for <lists+uboot-stm32@lfdr.de>; Mon, 17 Nov 2025 08:06:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 708EDC628B2;
	Mon, 17 Nov 2025 07:06:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81F36C030AF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Nov 2025 07:05:59 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AH75dcJ489048; Mon, 17 Nov 2025 08:05:39 +0100
Received: from duzpr83cu001.outbound.protection.outlook.com
 (mail-northeuropeazon11012043.outbound.protection.outlook.com [52.101.66.43])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4af3y5377r-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 17 Nov 2025 08:05:38 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b7i2QLDonDxyUYsubkH3Ff5IwTODxd90+tfyFCWHKxgfyU6rLFeOCkOoy3fq3Z90UX+BN0RZr4FCl0g58FTmYn9xZiap8Ms3Sgk3mUk71KD5IDehOfLtHAH+s5ESv7NO4N1TbcqCA3Hr2QqfkNF5pXy4LyIB+7UTyX4Z8gh8LRdTC2MPJr/0q9HU3TrMXQIOg5vBBlG+Qj0l/bAVr4EfNPZ9DuCilx6DEelhXeEBHgB/ypKQrNHljLAQMCr4s/C8up/CbbOX+4tpKle0FXOxxQlX/li3BHAlcGTlwTrlkxXsoJ3I7tmkzwfzSQx33+cHA8iHztDlLqN2XnYf+7Q4jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mvQjWqhPk0IVjmgM6uHZA6uxQ3WN9W4gwFdfPXukvbs=;
 b=S5a8vxx7bBiTPpEuInjJsxRA4Jy/Q2rro9Q8m5StsiOhovI9fMjW9B7KHP5KqvSINptvPbiQxI/o1g1RRkkTFxgAeIJweoZlvvfM9U2oEdaVT41vKioZe2jEFWzzrWNikVhEnYu75owE6icQ35PB088cpbBxCqXK9Pl1dLX1GLi3gkgm8Eiym3CxEdTfHBPfk6/bnLq8eoYChb7cJAm+Syg5ysgX/xgSknS+ZVTsaom8shNqgzaisKVbHod0Sx8MLV9QL7aJc0LxMgxNsZf6JqnYv8uJ9rJxAsbc2C7XUt1VjWioiE9RdBc1mUzkOnpIyZPySouZwkbzsYcidjeRWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=mailbox.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mvQjWqhPk0IVjmgM6uHZA6uxQ3WN9W4gwFdfPXukvbs=;
 b=iUx3ePbB4mekbgO4g/xOfmQBGwc/ivsO1YkqWvW7C3ocCHhX7rbY8NdDAma0DjW5pd4/JY4Qroltsm9BhENlDl7DMwHMSLykeazm5Lj8g5/RWbDsDNnDxt5v4FPi8YZytYC2Ssk+dQLertNiyZ9SHxBM04xaE7SM65qPI4jq71KsCi9W6eb5esJISRno50yghjPByJoob02ayeYiT6wNzrnhgLGwxO1hw5n+TpfD9uDiqNFJLsTZ+OLM/OXunxC+jGHV4AUcHQ/HlDYYS/uPODod/sqFgPAWg0bUsKemCF+LfUJ9u5GV6TmtM5asUMmT/Z/MWuqx9lRKF0fdR/6Y/A==
Received: from DU2PR04CA0032.eurprd04.prod.outlook.com (2603:10a6:10:234::7)
 by AS8PR10MB6294.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:54f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 07:05:34 +0000
Received: from DB1PEPF000509E2.eurprd03.prod.outlook.com
 (2603:10a6:10:234:cafe::f9) by DU2PR04CA0032.outlook.office365.com
 (2603:10a6:10:234::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Mon,
 17 Nov 2025 07:05:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509E2.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 07:05:33 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 17 Nov
 2025 08:05:57 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 17 Nov
 2025 08:05:33 +0100
Message-ID: <adcd334c-0101-4c67-94b9-06a29a25612a@foss.st.com>
Date: Mon, 17 Nov 2025 08:05:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Marek Vasut <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>
References: <20251023214811.181389-1-marek.vasut@mailbox.org>
 <bc9ee0d3-59eb-4455-897e-7401c2ab4613@foss.st.com>
Content-Language: en-US
In-Reply-To: <bc9ee0d3-59eb-4455-897e-7401c2ab4613@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E2:EE_|AS8PR10MB6294:EE_
X-MS-Office365-Filtering-Correlation-Id: 38e27724-dc6e-4694-2122-08de25a7b3e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UmZGa1ArQyszR3NTb0Z6alBWVU5rTjZqR0FJaVhYMmNuZ01OcEt0L0k2eDNI?=
 =?utf-8?B?R2EzTXJtNktGejNFT3FDVkgxc0ltOHIwZXRnVmFPVXlYM2ZjVm5QRm9KV29n?=
 =?utf-8?B?bHBpS01ES1prRUNDR3FmRER4U3JKUmRzUzd6V0w2bnI1Q1Rxa2puVGZrVEhK?=
 =?utf-8?B?dGZQYVRTbVN6VVEvRHAyV2NUSExNbmdvMHlUMVIrUVJQL3htV2ZLd3RTQ0tl?=
 =?utf-8?B?dXJ4SjlUTnpqdjRVZi9laWpwbDZSSDgrQWpFWld6ZHlTZFFrWEk5MVNFTnRF?=
 =?utf-8?B?UDlaS25welpOakZ5WlVGV0FXWVFIZXVuRXVnTzJZak9CMDNCTWNOUEQvbzVM?=
 =?utf-8?B?Sjdpbk0wNEVLK2s4Si9rbmN3VVhORDkrZmpxSjhCSDFJZGpBV1lJQ01Ec0pD?=
 =?utf-8?B?LzFYeTVmaXFyZ3FsdElzNWtVS1NIVkNmeTM0L0YvMW5rQkFPbnBxTHowNll6?=
 =?utf-8?B?M0hQQzltdzZYRnVwRjgraUxLSjBxVXlyOXQ4a0lPZzJRQWlxd1Vla1NwaE84?=
 =?utf-8?B?b3JNVDM3T0Q5RWhmTmYyTlY2SjVqQW1pQy9yWmk0enNlNnJTb2ppSVdhY2xh?=
 =?utf-8?B?Ym9XSVNKMHNVelFlWVVzMm5jTmdra0FsVjFBcmxUVkhOOW01T0RFVk5EUHhi?=
 =?utf-8?B?emtBRFJnYkJtRHVMVGR4dzB4a3RJbGFyenpPWnhJS1orMXdXSDF4Y0ppTE8v?=
 =?utf-8?B?OXc1Ri9rNDZvQkZtY0VVbEVKeWpqeHp0b0ZkSkNWU0VCMUx3dFVYVHQ2Q05R?=
 =?utf-8?B?ZFdXeUJiVHRGNno1aFNvWXJtRk1XWDN5QVFNVWNFWFZYR3F2TXVSbmJ5K2FP?=
 =?utf-8?B?Y2lRTlRrNG9kN2lqQlhRSnZZWWN6bnAycUxFWXFlRWdmaERTR1dYVDFZbDRz?=
 =?utf-8?B?TDdhQlhnbVV5ZmJKaUZVNG90YXBPSXUvODFMQk11ZUVwOS9ua1lTNDdEdWNP?=
 =?utf-8?B?NEZVNFh6dFEwMkUzZlZzcks1ODhOTEJ5c0I5dGRDZndBcVVXUlZtbHN2aTZ2?=
 =?utf-8?B?Z2xTbkRTWFlRZkJpSjhDLzJUbUYwSkN5Z09kREtERU9tK1RlV2tzdGlYMkpk?=
 =?utf-8?B?NDhkekhUY2wzbG9tYmxQYmYwSTVqWFlXcVRrVUdodnExR0ZCaWg0bUtFUkVK?=
 =?utf-8?B?aHNwRll6M2QvSmdOY2NYdEJKZitjYmhiaTlDL0swaGR6RnRSZ1hjQjJEbTZx?=
 =?utf-8?B?cjcvUUYwVVNoaW42ODMyanpReVJWVElCWHdTUE54UFJlY204SGFFQXVxY1FG?=
 =?utf-8?B?c216YkVFSmE4ZFZLNjRMcldUV3hvNVdJRXlLdjdNNGxXUjBaL0EzbVo1SVFR?=
 =?utf-8?B?YW85ZVMrRnZVQWJ3ZlFnZ3JFa1hNZUF2NGsyVlk4RHlHTWZyN0JwTDNwbjN6?=
 =?utf-8?B?VkF1US9ySEpWRktwWXRGbjJyWTUxNStXbEEzQnc4L0o2Y3JPZVM4dE1MWVdt?=
 =?utf-8?B?dGU2S1FWRzFJalBlWHV0NzRab0xNT2RDQURLbUhVT1IwQWdMdWxIR3BMcjdn?=
 =?utf-8?B?VTBETGQwb2FnSmJTcThKVkR4TjF2SGE5SC9mekRmbFJ0WllhOG11RHhVc2RD?=
 =?utf-8?B?eWVhSlRDM3hqUWdlTTR5SDk5MG9qMFpxN3ZoZE9NcmFuZVg0RWtiL3I3dmMy?=
 =?utf-8?B?TUVWVWM5akllUTV3cytzQVJ4b2VaVlM2aXdpcjNBMXZnZGsxbTNDZmYrMnRx?=
 =?utf-8?B?ckwyd21hS0c1OU81UW9TYUw0b21oZmVqWjYveCtMR29lUjM3akZ5ZE10MU5w?=
 =?utf-8?B?ZGZmYTNqdmx1TFFrRENEVnJDMzRtSFc1dnlvdTEzejhhR1BqWDZaTFJrR1hx?=
 =?utf-8?B?dFl4OGlpTmkwVUNuM3ZjMGVhNDRrQmJuRndYQTJBRWdCaWNKaTNJVGpVQ0FY?=
 =?utf-8?B?S1FVT3BPK2JlUkcwT0N5YXc2OHVYSjFmanhJbG1RS0RGM2FTd1dQNHV2bFMr?=
 =?utf-8?B?WFltWWV3WlJRaEtSYVlnSi8xU2tNczZWVnIxSzdKZVZIZm51SzIxeC9pWEd3?=
 =?utf-8?B?S0dlaGdyWVJDUC9lVXpBb3JuL1ZHbTJKM2VJWUtLeXR6c3doRzVPTjVFSERj?=
 =?utf-8?B?dHgxOWgzRDJEUXExM0xKWkpBTXAyTHZ0ZGppdnJFOXEybjM1SHNEMVp0bHJG?=
 =?utf-8?Q?7Hc8=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 07:05:33.9781 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38e27724-dc6e-4694-2122-08de25a7b3e2
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E2.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6294
X-Authority-Analysis: v=2.4 cv=cYzfb3DM c=1 sm=1 tr=0 ts=691ac942 cx=c_pps
 a=UF7r5SVx1dPEhrSNKrAGtw==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=b3CbU_ItAAAA:8 a=8b9GpE9nAAAA:8 a=k-42gJp3AAAA:8
 a=zk4-lHRcAAAA:8 a=phlkwaE_AAAA:8 a=7SQ2Uez-cKOebUCd-iEA:9 a=QEXdDO2ut3YA:10
 a=Rv2g8BkzVjQTVhhssdqe:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=uCSXFHLys93vLW5PjgO_:22
 a=7cv85riZL9-k45RWW8P6:22 a=uKTQOUHymn4LaG7oTSIC:22 a=cPQSjfK2_nFv0Q5t_7PE:22
 a=HhbK4dLum7pmb74im6QT:22 a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
X-Proofpoint-GUID: g8unsE-7CPeN6taLYNkCBieBVz1STj5t
X-Proofpoint-ORIG-GUID: g8unsE-7CPeN6taLYNkCBieBVz1STj5t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA1OCBTYWx0ZWRfX1SkjVSRZYjHl
 GKoRmGoeKbb3GakMo6TFYz5rb7HaqQCEi6yTaDk5q4UgP8w2xxcFOnhHMQnKNC7OMX6XIE4D+Oy
 Aq4aF6fRnV15JwAUNt6QZUAsmDF6KbyZfYJUQfPoHVqwLzfCYGJuFe1j4vnTeRVhf0tzz93KhZE
 aUdUIsA1oPHCh9Af3ashzN3Aq44v/L6mbQJU/4Eofs5V0XTlfLLLdRtOO4QRPxFWx/Pnll/ea5o
 tATcIBrWhDqD2xpmBj3BAXtwl/SYIDCVzI7UQhD4LfJ0V8+w30cRkZMCIrDFQ9MDFLyP4hcngKj
 U7DFedmTeNkNxNvN+EjY6tox4FqM+ShuhpMASFOPNHnwn9cxZvomGvkmUKQA84wQrVVh7esCokA
 /rwQ7xp92r/0s92lkm2vxADTJM4Fqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 suspectscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170058
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32: Introduce DH STM32MP13x
	target
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



On 10/27/25 18:11, Patrice CHOTARD wrote:
> 
> 
> On 10/23/25 23:47, Marek Vasut wrote:
>> Split the DH STM32MP13x based boards from ST STM32MP13x target,
>> this way the DH board specific code can be reused for STM32MP13x
>> DHSOM.
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
>>  arch/arm/mach-stm32mp/Kconfig.13x        | 12 ++++++++++
>>  board/dhelectronics/dh_stm32mp1/Kconfig  | 23 +++++++++++++++++++
>>  board/dhelectronics/dh_stm32mp1/Makefile |  3 ++-
>>  board/dhelectronics/dh_stm32mp1/board.c  | 28 ++++++++++++++++++++++++
>>  configs/stm32mp13_dhcor_defconfig        |  2 +-
>>  5 files changed, 66 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/mach-stm32mp/Kconfig.13x b/arch/arm/mach-stm32mp/Kconfig.13x
>> index 6a45c4e4132..e9697e34f95 100644
>> --- a/arch/arm/mach-stm32mp/Kconfig.13x
>> +++ b/arch/arm/mach-stm32mp/Kconfig.13x
>> @@ -17,6 +17,17 @@ config TARGET_ST_STM32MP13X
>>  		managed by board/st/stm32mp1.
>>  		The difference between board are managed with devicetree
>>  
>> +config TARGET_DH_STM32MP13X
>> +	bool "DH electronics STM32MP13x boards"
>> +	imply BOOTSTAGE
>> +	imply CMD_BOOTSTAGE
>> +	imply CMD_CLS if CMD_BMP
>> +	imply DISABLE_CONSOLE
>> +	imply PRE_CONSOLE_BUFFER
>> +	imply SILENT_CONSOLE
>> +	help
>> +		Target the DH DHSBC development kit with STM32MP13x SoM.
>> +
>>  endchoice
>>  
>>  config TEXT_BASE
>> @@ -50,6 +61,7 @@ config DEBUG_UART_CLOCK
>>  	default 64000000
>>  endif
>>  
>> +source "board/dhelectronics/dh_stm32mp1/Kconfig"
>>  source "board/st/stm32mp1/Kconfig"
>>  
>>  endif
>> diff --git a/board/dhelectronics/dh_stm32mp1/Kconfig b/board/dhelectronics/dh_stm32mp1/Kconfig
>> index dc707c2753f..05cb97b61e6 100644
>> --- a/board/dhelectronics/dh_stm32mp1/Kconfig
>> +++ b/board/dhelectronics/dh_stm32mp1/Kconfig
>> @@ -20,3 +20,26 @@ config ENV_OFFSET_REDUND
>>  
>>  source "board/st/common/Kconfig"
>>  endif
>> +
>> +if TARGET_DH_STM32MP13X
>> +
>> +config SYS_BOARD
>> +	default "dh_stm32mp1"
>> +
>> +config SYS_VENDOR
>> +	default "dhelectronics"
>> +
>> +config SYS_CONFIG_NAME
>> +	default "stm32mp13_st_common"
>> +
>> +config ENV_SECT_SIZE
>> +	default 0x10000 if ENV_IS_IN_SPI_FLASH
>> +
>> +config ENV_OFFSET
>> +	default 0x3E0000 if ENV_IS_IN_SPI_FLASH
>> +
>> +config ENV_OFFSET_REDUND
>> +	default 0x3F0000 if ENV_IS_IN_SPI_FLASH
>> +
>> +source "board/st/common/Kconfig"
>> +endif
>> diff --git a/board/dhelectronics/dh_stm32mp1/Makefile b/board/dhelectronics/dh_stm32mp1/Makefile
>> index 30db1dee807..ffd221ac224 100644
>> --- a/board/dhelectronics/dh_stm32mp1/Makefile
>> +++ b/board/dhelectronics/dh_stm32mp1/Makefile
>> @@ -3,6 +3,7 @@
>>  # Copyright (C) 2018, STMicroelectronics - All Rights Reserved
>>  #
>>  
>> -obj-y += ../../st/common/stpmic1.o board.o
>> +obj-$(CONFIG_PMIC_STPMIC1) += ../../st/common/stpmic1.o
>> +obj-y += board.o
>>  
>>  obj-$(CONFIG_SET_DFU_ALT_INFO) += ../../st/common/stm32mp_dfu.o
>> diff --git a/board/dhelectronics/dh_stm32mp1/board.c b/board/dhelectronics/dh_stm32mp1/board.c
>> index d98b2c6e809..a9b1a0f2c34 100644
>> --- a/board/dhelectronics/dh_stm32mp1/board.c
>> +++ b/board/dhelectronics/dh_stm32mp1/board.c
>> @@ -692,6 +692,34 @@ void board_quiesce_devices(void)
>>  #endif
>>  }
>>  
>> +#ifdef CONFIG_TARGET_DH_STM32MP13X
>> +enum env_location env_get_location(enum env_operation op, int prio)
>> +{
>> +	u32 bootmode = get_bootmode();
>> +
>> +	if (prio)
>> +		return ENVL_UNKNOWN;
>> +
>> +	switch (bootmode & TAMP_BOOT_DEVICE_MASK) {
>> +	case BOOT_FLASH_SD:
>> +	case BOOT_FLASH_EMMC:
>> +		if (CONFIG_IS_ENABLED(ENV_IS_IN_MMC))
>> +			return ENVL_MMC;
>> +		else
>> +			return ENVL_NOWHERE;
>> +
>> +	case BOOT_FLASH_NOR:
>> +		if (CONFIG_IS_ENABLED(ENV_IS_IN_SPI_FLASH))
>> +			return ENVL_SPI_FLASH;
>> +		else
>> +			return ENVL_NOWHERE;
>> +
>> +	default:
>> +		return ENVL_NOWHERE;
>> +	}
>> +}
>> +#endif
>> +
>>  static void dh_stm32_ks8851_fixup(void *blob)
>>  {
>>  	struct gpio_desc ks8851intrn;
>> diff --git a/configs/stm32mp13_dhcor_defconfig b/configs/stm32mp13_dhcor_defconfig
>> index c21416459e6..f751deb801f 100644
>> --- a/configs/stm32mp13_dhcor_defconfig
>> +++ b/configs/stm32mp13_dhcor_defconfig
>> @@ -8,7 +8,7 @@ CONFIG_ENV_OFFSET=0x3E0000
>>  CONFIG_DEFAULT_DEVICE_TREE="st/stm32mp135f-dhcor-dhsbc"
>>  CONFIG_STM32MP13X=y
>>  CONFIG_DDR_CACHEABLE_SIZE=0x8000000
>> -CONFIG_TARGET_ST_STM32MP13X=y
>> +CONFIG_TARGET_DH_STM32MP13X=y
>>  CONFIG_ENV_OFFSET_REDUND=0x3F0000
>>  CONFIG_STM32MP15_PWR=y
>>  CONFIG_ARMV7_NONSEC=y
> 
> Hi 
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
> Patrice

Applied to u-boot-stm32/master

Thanks
Patrice

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
