Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA3FC0F5C3
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Oct 2025 17:37:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C753C60492;
	Mon, 27 Oct 2025 16:37:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1E9CC6048D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 16:37:58 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59RG1Lwj2284112; Mon, 27 Oct 2025 17:37:30 +0100
Received: from gvxpr05cu001.outbound.protection.outlook.com
 (mail-swedencentralazon11013000.outbound.protection.outlook.com
 [52.101.83.0])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4a275j1am7-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 27 Oct 2025 17:37:30 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eYfCayroGW3u5ObcksgcRe6p+77g0xzUSMrd+n7h0TsDNuFWbAEZnLF3D6YDuheHcHrhk6bKRgZasndtt5jZE4nsUJi2jvzYe1KHVCHpKQYv+T8Oo5osIBrsc2arVKMnE2JSNYkRz6fGajiF+I76Prfn19S3+FnwT88XP14ezSztC/luXmqCJC7ScixB30IGA/9IX1FyZP+7+wsJH39eDLRE+6PtsIMqYHG76ubseHtT/VVqNa56oAzW1GZdagqjA28en+hUBK795Z21uuFUk14j9Yr9DVa3OM2LtJf0Hks8xqYJdNuw8kn+6KADSp2hACGFH4JJGg5s+Uz+Zeg3LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dN6afAK+jmbxHi6A3gtVSfSV0TINonLmIPeX6yyRRRE=;
 b=inpYt1bpS1DyE9dXB9zii5hJd0SwVg+H07vTn8AdhGOInyFk3qGNLTXHA9lj7Jwg92rZCYyCFDtNlKMb087NsKohO3BPd23Ew6klhuseCOc1dSxeiUeuD3czctOpBbeUn/hnlBEnd7O1fDuJe56WlB9Fp90Kcdwf+b4AQqTL6q1QlrzclhESBc+cp6VJ0L5SB84Cv5XZSfM7WjT6d4yBzIZR9POSdtKNeFEkuZUjlMBZihllym0cSyfUc+4aURVpUkLxQPImgpb3iFV5nX6CmXG0cq89fFSZ6gzbQu8vaLWSvm02ZZPXr+06Jv87g4MECyxQb75glfI7bG0VHkLZBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=mailbox.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dN6afAK+jmbxHi6A3gtVSfSV0TINonLmIPeX6yyRRRE=;
 b=gneg2KHu57F7Q851Sgjw0ABwlPLv4cdX8ndW/YrcvA7FBLiNwiKHcFb/y99qwDdbPPM9bt/Oj3k/BIoyRlwAWxSEFWses8j1lyZAB4h2TDKv2YDa+7eHaCrPfm0Yxfx9Hh6sq2Dr73GDKwEFsbwnr67lz8SJw2XYDI2UTkb4G3fCPjcRrvyBu2xDQIAYOsEngISIM8BVP6jjXhLv8cPmv9dRYlDZJH9pTrrh9WDr53Azg5BkV0eCMJ6PJSGswt4UKTw+WgepkAZHeXhVAQ6HG9U5g2AQsUGeldO0vfD2ipnI+QCXTrDF+Nm2nU7G1+Ty+XG0Z4NKg7LaO/He8gbF+Q==
Received: from DUZPR01CA0062.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::15) by AS8PR10MB7828.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:63e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 16:37:25 +0000
Received: from DB1PEPF000509F5.eurprd02.prod.outlook.com
 (2603:10a6:10:3c2:cafe::1b) by DUZPR01CA0062.outlook.office365.com
 (2603:10a6:10:3c2::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Mon,
 27 Oct 2025 16:38:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 DB1PEPF000509F5.mail.protection.outlook.com (10.167.242.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Mon, 27 Oct 2025 16:37:24 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 27 Oct
 2025 17:35:10 +0100
Received: from [10.48.87.93] (10.48.87.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 27 Oct
 2025 17:37:23 +0100
Message-ID: <7a078242-2d34-4100-a61b-5418294954ad@foss.st.com>
Date: Mon, 27 Oct 2025 17:37:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>
References: <20251023214614.181165-1-marek.vasut@mailbox.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20251023214614.181165-1-marek.vasut@mailbox.org>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F5:EE_|AS8PR10MB7828:EE_
X-MS-Office365-Filtering-Correlation-Id: 36e85a76-ab1f-4077-6cdf-08de15771bfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q0krVHB5aFcwL0FOVmJjcVk0eEJ4WFQvL2pxQ3NCU2dXT2lkY3ZuYjhvbzZt?=
 =?utf-8?B?S2NkTlhNeVA4Vi82QlVmUmpJTHJrVlZQbTJqMW1rOHIxM09wVHIza0FYU2FW?=
 =?utf-8?B?NHZMa2g3TWpFNndzak1yc0NqMGlmUUdiNTRUZ1BEZ1lUdmdPcGV2Z0RHNFJy?=
 =?utf-8?B?TGF1VGFab3JBQnBrWGpOT0N0ZWtVS1ZzWWlOL0RuK2hWUVdHejEwQ21JWUlK?=
 =?utf-8?B?TU1rNkUxeVpER1YxTTY4MWJ4VkhrbllxU2xQaFMydit5ZEJoUHNqL3J6amxI?=
 =?utf-8?B?dlJXaEYyNzZtK2F2bS9ZRHdqU0xZOFgwNGE0bUd2ekF2VjV1TGxqdVlBRzdZ?=
 =?utf-8?B?VFJCNnlEZXduVzJOcHNpOURGSUhwaDNJb1h3U3U4VXpaUVRZRVdFTVd0ZUkr?=
 =?utf-8?B?UGRTVW1sVHhKd01zKzUzeEZ0QU5NaG8vSk9zK0RNVTJJNkFSdy9aQU9YMWJk?=
 =?utf-8?B?eGtlK1V4MkJiNXlzelpacUtXaittNHBEdllpNzRGREhmRndWUURtak80UUdn?=
 =?utf-8?B?dXZPUTUydVZPVERFYVMxRDN1YVhQUG9GOEd2UTZtcHlSY3JoV3BOV1BaNFVh?=
 =?utf-8?B?c2R4b29sMzVIVmNXd1B6VjFMOVl2Y3lzb01XWGdRR1NoZHVCV2FEdS93S0pz?=
 =?utf-8?B?dDhxZDF6azhaZ2p4ZVFmT0VCcFBWdmlCWTA3Skp0Vmp5eUNLRVlhRTNXdnMx?=
 =?utf-8?B?dmo2SkJ5Q1MwZ2dDQ1lVY1BUNDV4dCtqcGd6dGNhSUdwaHh3NDhCeEk4NEQ0?=
 =?utf-8?B?UjdzUWlTWUVHQ3B4NTA2MG9mRjV5STVXemdJUHdyNW1XdkFsREk4NE81T293?=
 =?utf-8?B?VDA3RjZ6R2JqT014TUhOVDZLNy85S0R3Mm9PMW43bHlZRFNJcmtCV0RwM1E5?=
 =?utf-8?B?RHhKdDNHcDQ1OTdIWDRKKzJyZ0lTakptTmQ3KzFTZ2dkU1R2WWVCZUoxNE91?=
 =?utf-8?B?NGhCV2hkNUN3RlF0OVVjZTR5djlGNkpLMWFOYlM0ME9WeXpaanJzNXBQRkJl?=
 =?utf-8?B?UStnM3R0cXRzZ3Bwdmk2bGtrS1B0REVrbzlnVW5XL29yMnF1d1VGQzVIWFM0?=
 =?utf-8?B?UWhjNmZ6dVJVT2JJbk9aaDcyeWFUR2RYZ3pobVR0SlhQbUsrS2J4cGdNUllk?=
 =?utf-8?B?cXR4OHBNOHBmM29GQ1FDcUVvcmR6N1U1UW5LdE5YY3lpN1hldWVMaG95b3Ix?=
 =?utf-8?B?c296SGhxb3pMRVZGc3J4L1R2K0ZtUTJGdXdGUVRrUDFiMDZJUTZqQ2hSQ25t?=
 =?utf-8?B?ejNiTUw2Z3h1eW14c2hVeUVxWHRwZ1BhS0FOL2xyanNnaHpZSFJ6RnNYb2kr?=
 =?utf-8?B?NU9hOEQ3QUFIbHc4QkREOUd1QURHR1RxZ2liTkVUSVNJaDYxc3c2TitaQ2hO?=
 =?utf-8?B?MkhhaHNaYzNZcWZZUWhjb3ZmN09wNXZBOHArcFhIY0htMTBkamVKRlpPdE9a?=
 =?utf-8?B?SmQ2NXFLd1paY2V1b3pZdzNoR2p6Yk03WXd6R044cEp5bGRRd0NHODd6MzJi?=
 =?utf-8?B?ai9sbm5UaDNtNlJNRTRWMTRVN0g0OE5PWjdTMUZ0T3BhVjJ2eUhpbXJSV1k5?=
 =?utf-8?B?SXJXTWNYVlg3YTg4TTdGUlJVN1lZR21nN3U2MzBZZjlQS0wrZ0J6NU85UStM?=
 =?utf-8?B?NTdpZjFPR1dmdTNmSW1jRGxLbUdYeFhjSjVublZQUXIySlU5V2hoNE5sQWR6?=
 =?utf-8?B?U3Z4RHFFdnBxQWp2Yk1ObkV0YjlWY0lzYXd0d1c5Z2Q3TjRuZmJ0aDNxMm1C?=
 =?utf-8?B?QUFBYVdzTjJTdFpCSXlGcW5OMHkrdzdQOFp1cTRxTHRBcUdXMHJ5ejJBSjB0?=
 =?utf-8?B?K0M3aHppRFIrQmlQYVU2allhZDhtcHM4Y0tKdkowWXlEMURlT2lzMVFCVXc4?=
 =?utf-8?B?UEI2N2szdTA2dnRwME1sN2ZSQk9iNUJBMVZydUpLeHlWZUs4ZytBSzdnRitz?=
 =?utf-8?B?ZDU2SHhuSFdPTDZqaWxuS0s1aHhNVnBXSEZIdWUzZ2doOGIydVRCUlhXSVB3?=
 =?utf-8?B?c0FXOU5rdGxCRFZ6VHdTUG5TazFEeHdOb1M5THY1TkdKdGZxa01jenlYU084?=
 =?utf-8?B?ZGEyT0ZNbjYwOE1MVXI4eW52Njh1eHpTUFFlS2pnMVdMMVpuRXlUb2lDbVUx?=
 =?utf-8?Q?EgDs=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 16:37:24.7070 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36e85a76-ab1f-4077-6cdf-08de15771bfd
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7828
X-Proofpoint-ORIG-GUID: W0Z5dr3mo_x0AI7XKKynl-F2aPpFZxgq
X-Proofpoint-GUID: W0Z5dr3mo_x0AI7XKKynl-F2aPpFZxgq
X-Authority-Analysis: v=2.4 cv=GKYF0+NK c=1 sm=1 tr=0 ts=68ff9fca cx=c_pps
 a=nByTnSNBlmrEcbo/XTjLTw==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=b3CbU_ItAAAA:8 a=8b9GpE9nAAAA:8 a=k-42gJp3AAAA:8
 a=zk4-lHRcAAAA:8 a=phlkwaE_AAAA:8 a=_h3rghGegg4016nxNN8A:9 a=QEXdDO2ut3YA:10
 a=Rv2g8BkzVjQTVhhssdqe:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=uCSXFHLys93vLW5PjgO_:22
 a=7cv85riZL9-k45RWW8P6:22 a=uKTQOUHymn4LaG7oTSIC:22 a=HhbK4dLum7pmb74im6QT:22
 a=cPQSjfK2_nFv0Q5t_7PE:22 a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDE1NCBTYWx0ZWRfXzASXf0EGuhxQ
 9ahYq45AgFw4Xxq5ya9nxxyFuioliBbcRrnReCWdQ+hiCZO7qWxE6HwUq5IZf15d4yxRkveOKKE
 FTV4+JoYN4HeoowDLN5Tw3/K1dRBeNRGt4gbXcDSevq859jGlZkE8Vmgk7JR9R9fvWimlr3k803
 gG/eirP6YyB+vIVkf0VmN3LuCtBWhmF3hqfjaMxvJiMse7OupG1imv3s5BxJXHtNC5GZucj0bYM
 Dv67CH/tcf8VUP64RY+xlNJRrRaTlt3abyhsDIZbZ6m3pGaNHS4uUEdgoTgWJcpbmaCAGsD78vo
 OPM3LoC6vU6KmvFqQtjyYbH9VyvMYMNaTw1eud0o+vrROX3AIYq/H+c8h94ZpU0+hMFrJTOMXoV
 IBnyEmWQB/aJzVstlZqP2XVAc7Ga3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_06,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270154
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32: Fix STM32MP15xx DHSOM
 boot breakage due to ETZPC
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



On 10/23/25 23:46, Marek Vasut wrote:
> Switch etzpc bus to simple-bus to prevent breakage on non-TFA systems.
> This fixes boot of every STM32MP15xx DHSOM device.
> 
> Fixes: ad3cdc677dda ("ARM: stm32mp: add ETZPC system bus driver for STM32MP1")
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: u-boot@dh-electronics.com
> Cc: u-boot@lists.denx.de
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  arch/arm/dts/stm32mp15xx-dhsom-u-boot.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/dts/stm32mp15xx-dhsom-u-boot.dtsi b/arch/arm/dts/stm32mp15xx-dhsom-u-boot.dtsi
> index 386c605c07f..ed2629f379a 100644
> --- a/arch/arm/dts/stm32mp15xx-dhsom-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp15xx-dhsom-u-boot.dtsi
> @@ -51,3 +51,7 @@
>  		};
>  	};
>  };
> +
> +&etzpc {
> +	compatible = "simple-bus";
> +};


Hi 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
