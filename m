Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E82C9F458
	for <lists+uboot-stm32@lfdr.de>; Wed, 03 Dec 2025 15:21:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7AB0C5C842;
	Wed,  3 Dec 2025 14:21:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0DE14C5A4E4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Dec 2025 14:21:29 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B3E9NH01925610; Wed, 3 Dec 2025 15:21:05 +0100
Received: from pa4pr04cu001.outbound.protection.outlook.com
 (mail-francecentralazon11013070.outbound.protection.outlook.com
 [40.107.162.70])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4asrfeeu1q-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 03 Dec 2025 15:21:04 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iHQQ9d1KkuqyZxRyn8z0DKonI5Ph9ewFV/GFsFdgkTGnz6G2StgBTREnVg6oH572uPNSK767qbzNlIskzNPREwk/6VAuUZYa2sogw8UlGZDbV6/HHkFwiuwS8np92no2VGbIMNaSCR4TizrwJPtYaaIqYMCF7hmjBVcXstHrpQSZQcdpVEIGwd3R+70IaP69S74XyxtWkx8OiUzgjM5Il78numz70iOpF9c6BMzJfn4RX9J1SKEy3lba7p2cvopvTI36Uk+5uo+ENqM3OF6tM65t213PcumXw4n9aBxoRsgubgpXyBSg2b24aowsbiO6U0MIDo85DXBhoIwecKKCjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AtRq66IvQk3UCnIEz4iaZxuhFHVd1RHWK7G8c/+bhpo=;
 b=XBIF+xump5ayejA5JZ2MfhLQmRVjBO/23sa/9F6EM7ukf52IZ/OeBPRGSvM9+tU56CURNqP+OwPvdDgFPHgqU3IQ5r7BrmRZjmj1ZOvWfaDlCxXlLDVdw/OjwWNZ3Ei7yUc5OU8LbKQN0hkDxdEcL1C4K0XA23OUWioJIhEjdPKTjkuz4eYFoQjxUAr/SUIvrgpoDW/laPgljm27BjmSsdts098gt0yUEQev9ym3f5Rn40PWo5TEP1DR9IwsSvMc5rqKDrWon1MKEi6H78qMzrtVyZapVFp4lcCfZ12mnl8qHaoUU7yDl/ZYGh8/ASz5TChlVhRqvQtdSOq/X9bYJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=mailbox.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AtRq66IvQk3UCnIEz4iaZxuhFHVd1RHWK7G8c/+bhpo=;
 b=oJlVHEpT2KSY7D1TDUCm+1QnVnI80eo0dv+NagpCPvLV7YncjP3k+Xst253XE9F99dYEK7ofKxDYiA36xTArcs4nEGqjXTbLB3FH+TKHCMSWEa0SfxNXHz0P+eRkZfcG50ZJUwDUifJsu9sOaqnbEHQ7YvBDvyYFHW9fw/3XsBLC0sBzPjCcfRHu4jiAMrHX47uGhcNUjBB6+UcnF99d5hKqvZzY2p4RQRVp4FdzOEumoq9oFI0+epJ4P/ZkrDn24WITrtO7Iiqu4mexOUz5t00F7VpIACqW5vaoINbDrGDqi23LKZdTWLXY06jG/laPnrxyW6/RQ8n5Wy2E9etzxA==
Received: from AS4P190CA0055.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:656::19)
 by PR3PR10MB3913.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 14:21:01 +0000
Received: from AMS1EPF00000046.eurprd04.prod.outlook.com
 (2603:10a6:20b:656:cafe::11) by AS4P190CA0055.outlook.office365.com
 (2603:10a6:20b:656::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Wed,
 3 Dec 2025 14:21:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF00000046.mail.protection.outlook.com (10.167.16.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Wed, 3 Dec 2025 14:21:01 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 3 Dec
 2025 15:21:39 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 3 Dec
 2025 15:21:00 +0100
Message-ID: <d6a28dfd-9b28-4231-8dbb-8c5c09f0bc9f@foss.st.com>
Date: Wed, 3 Dec 2025 15:20:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>
References: <20251118231933.577980-1-marek.vasut@mailbox.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20251118231933.577980-1-marek.vasut@mailbox.org>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000046:EE_|PR3PR10MB3913:EE_
X-MS-Office365-Filtering-Correlation-Id: 2479e744-e324-4081-0e5f-08de32772f65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VnV4aXhQdmVhYlB6cDdnR01uck44OTZUc1MxMjhyMHBaL1hncTVmNmhuME5B?=
 =?utf-8?B?dXpickxZMzh6VTlYblJZdnRJaE1QZlE4UjFKZzJyRFNUOVhIdU0xd1VjQUk0?=
 =?utf-8?B?OXB2cHZiWGowN1BGb0Z3NnNDRzl2QTlVSE5MVXpFNVRvYzllZjF2MVM1Vi9l?=
 =?utf-8?B?WDVjN1lGYVQxTng3L3lLNUNrRlBLcCtnd3FGSDJZSzBVV1cxWUZWUnJ0Y1Bw?=
 =?utf-8?B?NWI5UlNKRHlQS1BBWjJ4eE0wbEJOekduTEJIQnpkS2ZnZ1NiOXdwQ1MvVnNI?=
 =?utf-8?B?U2t5T0JFdDJvelBzdmVJaWo4bVFUOVUybC8yWGRrTnZjRXpmNGRnNU9Hdjk0?=
 =?utf-8?B?Mll2Z21lUnJJVnR6Q2tpRGtVOU12eVhYM0pXd0VtVDVqRzhuZDR0aWpnMjNq?=
 =?utf-8?B?L1lYdU1QY1Q1dlQxaFgwakp1YTV1VzdHNzBXSGxzMmJGcStQb05lWWhuODJ6?=
 =?utf-8?B?TFhESzIyYTdFQkN5Z3FESTFKS0g2Zy9pNExpWTlrd0F2K3d2a2NJVTk2OW50?=
 =?utf-8?B?UUlGeGNpdmg1Rlk4N0dQNWxVd3dXVHJwbFFFcU12TW1mSHJKN2RlYlVNbnJM?=
 =?utf-8?B?bmlMRzJRcDQ3djNWNDBJNThpeXA1TFFLY1FaQnhFanhSdkV6L0NjZktIYnMr?=
 =?utf-8?B?TFZWSEh3K3pCRXQyOW5ab0g1Zy9BbVhQTlUwcjZoNTRBUlZUWjJDM01qb0JU?=
 =?utf-8?B?bVpZbTNEMmVBTEVRL0tPSUlqOXNKUFV2M1NtT254VEFMTWlhU05sckFWL1Bv?=
 =?utf-8?B?cjJHR2FlMUVnSFp2eTgzUEJUWUpKRlJpNTlZcmR5dHFHWVVIQld0TnRtcXpk?=
 =?utf-8?B?cUEvOFF1UTUyellQRkwzR2pxcS9SZURKd0ZZcWZVUG5oTVFrUmpZMkNvYmUr?=
 =?utf-8?B?SmRJOTlTSTduUGlIVWlEaG1lTXhVWXVRUUc2a1dWTWFYbU12Q0RkVDNiVUI2?=
 =?utf-8?B?aSt6WkRhZVZ1UkJvR2RnZVRneGNFbnNKREFueFBLckxsMDRiNHdhWkZVZGdl?=
 =?utf-8?B?VUNZZVV3OS9CR0R3VW1WVHV6T1JIYzcyb0lmVkx2LzVzNkYvK0RoTlhSVU9s?=
 =?utf-8?B?MTdUSHJZZFBWdVNZMStLelFXYmlxWmtSVXhFNDdYOHREUUZIUHhQYUZ5S0FK?=
 =?utf-8?B?WDl0clVlVXhOSjF3QlR4VnpIRWNVMEFBYy9ZVmZrU2swVFNtZXhIQ2RXVmgy?=
 =?utf-8?B?Z01WeE5RSGE3RGtRYXNVNDdsWUhPcTljRVpFRVVFU1ZSWi8yWlduNTdVNDd0?=
 =?utf-8?B?K1Z2R0RwMTg1WmUzYW0yRFhUS0Z5bk5SNmluRlUzR1p0ZUx6bzVRTXJLazZR?=
 =?utf-8?B?aVdObTVXWUgzRVdBSERqYTkvK29pbWZHNndhTFdzaFQxUmQybWk5WVByKzJC?=
 =?utf-8?B?UndxektXaVZIWStYbmxGSTRrRVd4NEx6clR2TWFrY3NkbFY4ejdlcnIvT29O?=
 =?utf-8?B?MlhrMWZ6blJYRStDVHAzUzFla1R5bDY1Z2xJM283TUIzYkJkQ3VJUDMzdWZ1?=
 =?utf-8?B?SGlibTNpZlZOaGhDaWp1eEZDd2Frc3BkczY0dHEyK0ZLRk9UOXE1OWhRVWJW?=
 =?utf-8?B?NlFQVmgxMzJha3hqNkplc1dKUUp3ZDQ5MzZBVWZWSGFUQzd6Rm9lZGZwdldC?=
 =?utf-8?B?OFhIRElSYU9Sb0Z4aG1LbCsrT2FMbXJRZjMxK1R0bHFLTENISGxZWHdtcHhQ?=
 =?utf-8?B?czFvck9sV1NsTFBmSkZtZElzM05RR0VraGNERk5SU01Ia1k2NC95U05ITWp4?=
 =?utf-8?B?dzJGTlZnS2pCaHR6MzFVVTlXL25TOUpIcWdPVlVYdG9Nc1NIYXZ4UEhqbnE2?=
 =?utf-8?B?Z2xjWm01ejNIdndBb3NXRmZhUlZLWXdsRUVwc0wvM0k3blNZNVNqR2VIbm11?=
 =?utf-8?B?VG1mTHZOaFN4cndxdE1vUWdZM0lyUUtWbnNGRDRCTDErTE91UndMNUxJejNi?=
 =?utf-8?B?ZVpIdkhVOXYva25lLzNKVi9KbEtYN3RCL01Icm9KMnhGOFdDbXg5dDNIaFk4?=
 =?utf-8?B?OXFTK2RDUGZNOWt2WEdwKzhRT2I5bzBmNHRWV29RZ3hqakJSTXBXMVRBM2tT?=
 =?utf-8?B?VmY4UlBsZWpuU0tqdlh6ZjJHMzg4aHV2ZXRudUcwa1FKUDAwUGJySFpkNThu?=
 =?utf-8?Q?+c5c=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 14:21:01.0082 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2479e744-e324-4081-0e5f-08de32772f65
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB3913
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDExNCBTYWx0ZWRfX2nNX7JCfxlIu
 tUIKMacDSnedePTRzvqYefRB7S1h5d8+aW/ua+Ea6XMlPX5JCElRPzDg26ve6hcNyh+nG37QebV
 gTrzT1Uhd5Ir9ewfTitJsv7T4AYRLbFVxHzX93DQGuUj1eJJR2ZXwAMfTymRwi3KzfTlScCYPgw
 U3yVDJUWd1N577XIUFrtcXrM/8Wvor+EOoQU03mJPNjSs/URvqaaU2DyxF2XRbqJxyzz+6X4Ke4
 osO1os3p41ggkQp25k86JpKfNtez6RfEvtQE8EbCKn2Fg0gfv6gw2RlkMA3VasmI1HLqt1LGtHk
 u8wkNn9gT+ECkPIR61wIR0sh0t9JqGk0n8RGRoHDYaqikfl5YHUBJKKWxP2lA/Dh9iYju8zPNtz
 jDFqEV8TPnIIP8nawI+BxIqxoad0aA==
X-Proofpoint-GUID: XnbVafKJEgE5ZOXSVyKTYLd3gq7bTpC-
X-Proofpoint-ORIG-GUID: XnbVafKJEgE5ZOXSVyKTYLd3gq7bTpC-
X-Authority-Analysis: v=2.4 cv=YfywJgRf c=1 sm=1 tr=0 ts=69304750 cx=c_pps
 a=0dS1Un6p98pWodQyLfc2pA==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=b3CbU_ItAAAA:8 a=8b9GpE9nAAAA:8 a=k-42gJp3AAAA:8
 a=zk4-lHRcAAAA:8 a=phlkwaE_AAAA:8 a=feuXF0PqRIDerlFReQAA:9 a=QEXdDO2ut3YA:10
 a=Rv2g8BkzVjQTVhhssdqe:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=uCSXFHLys93vLW5PjgO_:22
 a=7cv85riZL9-k45RWW8P6:22 a=uKTQOUHymn4LaG7oTSIC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-03_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030114
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



On 11/19/25 00:19, Marek Vasut wrote:
> Update DRAM chip type and density comment for 512 MiB DRAM settings for
> DH STM32MP13xx DHCOR DHSBC to match the chip on the SoM. No functional
> change.
> 
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: u-boot@dh-electronics.com
> Cc: u-boot@lists.denx.de
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  arch/arm/dts/stm32mp13-ddr3-dhsom-1x2Gb-1066-binG.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/dts/stm32mp13-ddr3-dhsom-1x2Gb-1066-binG.dtsi b/arch/arm/dts/stm32mp13-ddr3-dhsom-1x2Gb-1066-binG.dtsi
> index 7b344541c3e..b464c04aa2b 100644
> --- a/arch/arm/dts/stm32mp13-ddr3-dhsom-1x2Gb-1066-binG.dtsi
> +++ b/arch/arm/dts/stm32mp13-ddr3-dhsom-1x2Gb-1066-binG.dtsi
> @@ -3,13 +3,13 @@
>   * Copyright (C) 2025, DH electronics - All Rights Reserved
>   *
>   * STM32MP13xx DHSOM configuration
> - * 1x DDR3L 1Gb, 16-bit, 533MHz, Single Die Package in flyby topology.
> - * Reference used W631GU6MB15I from Winbond
> + * 1x DDR3L 4Gb, 16-bit, 533MHz, Single Die Package in flyby topology.
> + * Reference used W634GU6RB11I from Winbond
>   *
>   * DDR type / Platform	DDR3/3L
>   * freq		533MHz
>   * width	16
> - * datasheet	0  = W631GU6MB15I / DDR3-1333
> + * datasheet	0  = W634GU6RB11I / DDR3-1866
>   * DDR density	2
>   * timing mode	optimized
>   * address mapping : RBC

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
