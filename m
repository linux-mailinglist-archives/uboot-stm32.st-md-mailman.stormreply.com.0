Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDA2C5E948
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Nov 2025 18:30:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06746C628DA;
	Fri, 14 Nov 2025 17:30:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9237C628D9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 17:30:27 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEH480e2782514; Fri, 14 Nov 2025 18:30:22 +0100
Received: from osppr02cu001.outbound.protection.outlook.com
 (mail-norwayeastazon11013000.outbound.protection.outlook.com [40.107.159.0])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7m3xtq-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 18:30:22 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NPnORQH8E4QHb5+S0m+4jHmB3ac66A/I8tpnQZuSdI9h5W8aVxDmV2PiAnACePM33YjUVkGVCQ1mz4sPC0ys0fm5qzi0kVmRXTRQAaxeWInu2EusH96xE58vxZ1t0jtLzpsyfsqjil/N1oKKUhDWBY+vhcqnl7BkuNuVvhJtFEb4mW5TnKCShbQ3tvyif8iCfPHjU5NyeMvQEioH8Sgvg74NEUCSjdRO7F1rgerPK3xdMi8XhKPDhcU5z5qtekZ6CRTYVVIBtVfWPfobSh16g+VzvQVx7HJdrgxlshmOpZnRe9NV+knv9/JXaNYoEPHWnPIOPOkpof5mOChT21pD+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yjasPEsKz13ZdoOC1VHbxubnSYhRls6zH0z/1DwVgBA=;
 b=ViTMQVVuHLBDFETRoCIyB54YogH4qQL4/DrCwYWSBY7H93VLwfbWM/9u+JNMdr82Y46QIy3CQQFT2/IWK+Acex6fX4N3qkCpuHZO68JgjMCyiy98P6GTtCeurY11Q7wUGZSMCGdHM55snk3vneHQIyNL+W3CPbAzlyb8ACbwv9xF0PBSYlIIOqf3UNcJnx9E7hgPJ9T6Rwj21DqbNQPmgnUTgn/siW/VXJuL39fO6zBofsytmjdzozouQA9ITrLtx+6i5S8+c4oy5jH2SNA1D6zdQp41QqIQ9u/ju9xmrTlBQtJEzLoijOuEBcXVBXy7IcYcLpAq/pSu7OvGwOkqOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=konsulko.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yjasPEsKz13ZdoOC1VHbxubnSYhRls6zH0z/1DwVgBA=;
 b=KTcHgbbZ/IIkW3N6b4NZ3nI19VpRzop5cnLUVdKzieneqpc+9czsh6nnfV0qh5p3wu2fYm18c78ChfMR+/4shwKl0NNydzsrG9HACrAULlUDZ3bCfCHo8EhwH3lh0j8RBiH1CrUcXqqsDqUSnLui5uyO1rxjp8CV5kNyngy2BD/qeWXtFqtFyekHpFIllitDd2YLIuc5u0NLYhvtAnmkwfLda+L6k8Uu/e6qjKfugqRdfncrcWZdwhfkPvdPCQVOnbkDojzNMH+gq+dH+K2nEFQBoqJ8/P1B1vgXJOodPauqKjHDSCbiE29AFopq5clgzhYIc4p9amh3saew0IqCOA==
Received: from DU7P251CA0012.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::18)
 by GVXPR10MB9512.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:323::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 17:30:16 +0000
Received: from DU2PEPF00028D0E.eurprd03.prod.outlook.com
 (2603:10a6:10:551:cafe::c4) by DU7P251CA0012.outlook.office365.com
 (2603:10a6:10:551::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Fri,
 14 Nov 2025 17:30:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028D0E.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 17:30:16 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 18:30:26 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 18:30:15 +0100
Message-ID: <c36c5f58-1702-4923-b536-7b79190b7d73@foss.st.com>
Date: Fri, 14 Nov 2025 18:30:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
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
 <4f85a946-bb6e-4f4b-afa1-f22054cdc1b0@foss.st.com>
 <b7c77a8d-0fd2-4de0-97ea-a4f1dbdb80f2@foss.st.com>
Content-Language: en-US
In-Reply-To: <b7c77a8d-0fd2-4de0-97ea-a4f1dbdb80f2@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0E:EE_|GVXPR10MB9512:EE_
X-MS-Office365-Filtering-Correlation-Id: 9552c37c-55eb-4f07-eb5e-08de23a379de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013|13003099007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VHg5WWtTdUJTTGE3Zkx2SE52aGVLMXR5cXFzM1d1b3hQOXFjOXM1ajRIRDFJ?=
 =?utf-8?B?cUt6bjJQMXhBZFZNN0hmMGhyOGxRWWNCSVVuTjlYa0EzMWNyQ2cvbEY0WXY0?=
 =?utf-8?B?bWJwRHlWMlhINDFoVlAwUVBOaURBWE85ejNoU01NcWVHTkczTVQrWktnS2R4?=
 =?utf-8?B?MDVVY1h3RjUyclNFSERvZnNuVllPWlhMK2V3aUNyQWZlU3dXenFOazU2S0hN?=
 =?utf-8?B?OS90UjdOanFOdHMwNXRuZnJubzZzR1Z4b2lPWURhTXAzSW92cFZJamxyUGZP?=
 =?utf-8?B?eDZYL3FWajArY3k0MnBHTVV2anVGSzdiWlBjSWdmbFp3eHg2T0tacTVoZ281?=
 =?utf-8?B?Rk8wTlM1NUsyaTVlM2VXc0UvQ2gwSXhJNVk1Zmc0djFJaXVaQk5UNGdmMFRv?=
 =?utf-8?B?L252eUk0a1NRUnFtUnhRNnRDbFdRTEFjZHcyZCs5dzZlOXM2THYva3FBTWRV?=
 =?utf-8?B?VElMZEg5ZGNuOXRqVkRhUFRSOEpvQkxocHdCVUhTMTlyK093d1JDVUl1VnZ5?=
 =?utf-8?B?ekNqUWptT1NVdVlib3ZxemdpajBlVU1ON3BuRjh6eVdBVUxkVXNpSlZ3dmU4?=
 =?utf-8?B?UHhmRHo3UVlIdXRibnh2TFVMUm5UUkYzcmNyR1NiUVlPQnhCMytmdHZVV2V6?=
 =?utf-8?B?UExScm5ZZE8yODFMTVBlclc5WHV3cVBEZGgvckk4V1ZOc3E2QXBhMFIxOHdp?=
 =?utf-8?B?cTByNE84OUZTbGlSZzNqekZZTEtKaGQxVHJWcFlhbGdCbWNVOHQ1K1E2WHZU?=
 =?utf-8?B?a0tnck56OG9ObGJiMThGVVpVYjkwbWhsdjVxQWhvbFdXMVZhc3d5YnpINm1H?=
 =?utf-8?B?bUtJbythcEdaWmt3Y1IvOWhFVE4xc0hEdjZMbDVlTGF4TG03YlR5UldGSm5V?=
 =?utf-8?B?ek4ra0l3WGkvdnZ0S0hkS0R6STB3M3YyMmFCV3gvaTUrWjl3RDNvblNrK3Br?=
 =?utf-8?B?cE04R24yMXpGNFY1K09xMnNQY2lwODlpQnpyR0dTWWxwZkJSbzRWeVlVa2Rl?=
 =?utf-8?B?c3hXTHUxSmFGVTFtWDAxb2hucnk1TlpTc1B6Njk1WXBJcmYwMlR5TGljOGZr?=
 =?utf-8?B?anBzdWVGQmFsZSs0M3NEN2tWOEdGaDFVb0F1cFpxNmlSK1dXZ1BaS0FBSUFK?=
 =?utf-8?B?dnlvKzlzVk1mU0RxaDVEMVovMm5rYjFmM0VLZjlkeThzL2VKVmNuQURObm5l?=
 =?utf-8?B?dzlqdnlDY1hBT2ZRaWNQVmJaNmNUd3ZNOUNuNWgwR1pjOE82RlhrU0xQek9U?=
 =?utf-8?B?NTNmQXNiL2VCb1pxM0tkZ3BVUVI1UU1HelZLeG1Ba0xKQXIrL2dDNUIwdWpx?=
 =?utf-8?B?cS9ZbkNDSWtVeGdncVErU0xBREh3bFVwVENpVFpRcmhBQWZDc2ZkY1lLMFYw?=
 =?utf-8?B?RStRb1ovdXJtaDRGNVRZV2psSUhlcWU0S25qUW1mVkpCN3RZcEljVG9pMGho?=
 =?utf-8?B?NVRKdjU2NjdqL25uZEhBNE1IY2JlVjNqVlMydHJuUWtuTGtNS0JFZDhjbUhJ?=
 =?utf-8?B?dHJaWEI5eVhFdmN4Y09ZVHQxK0g4dEd1L1QvWElPZWxIR3FjeFZvQkVGK0sw?=
 =?utf-8?B?RGY4WUFaY1N0MWhSZkttK1REMkNJUTFldk1sUDVOTDZIZCs4Sm1icElwSFBy?=
 =?utf-8?B?VENDcVloekEzelkwL2RqWGN2akREV3ZVMUJwRkRaMEljMFF0bE5JbUUrUFI5?=
 =?utf-8?B?dDlSM1RpRHFTMEpEK28vOWUzRzYvWllBQTZlWWFTdEl0ZUlmcko0ZzRQREpQ?=
 =?utf-8?B?bFpSVnhSQWRzTFlrZ3JqUlp5OUJlSU9SN3NXeXl4Y1Y1MjgwSjc5TmdlWTJz?=
 =?utf-8?B?Nnd1MDNGRXVJYzFoSk94WlFQWDM5WGQwckp4eE5iVmYwYkFGamhMcjVmUDM5?=
 =?utf-8?B?Y0NuNGs2Tm1kdVFOYzZLa3ppa21BMkFlKytaSzBmelRYYWxwaWVNdjlFMjhM?=
 =?utf-8?B?MVlKMWdXRzFVbXNVMTdya3g0VnRNSHBXc1AvalBuVjRTN1R5amx5dUtCOXo0?=
 =?utf-8?B?V3h1d3k5U3FiRmVWbEhCQWJDVElmeFBrdnlPN2c1TUVKRU9tV3VxWFZqM0No?=
 =?utf-8?B?MFpxTnNzeWJWTUN1WDExOVQ3Mm1ESjhVNjNZSzhadW9nSGZ2NE4wT1BoVlB6?=
 =?utf-8?Q?rVQbkNKNcnde1rhr9DYzlGsh5?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(13003099007)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 17:30:16.3301 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9552c37c-55eb-4f07-eb5e-08de23a379de
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D0E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB9512
X-Authority-Analysis: v=2.4 cv=AZK83nXG c=1 sm=1 tr=0 ts=6917672e cx=c_pps
 a=896zWVB3lkap0gFnCg6oog==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=phlkwaE_AAAA:8 a=8b9GpE9nAAAA:8
 a=m8oaAP2chBP8RpqNth4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKTQOUHymn4LaG7oTSIC:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: BzivAHZFzHzihY2NmZ7ngKHGOrIicgh7
X-Proofpoint-GUID: BzivAHZFzHzihY2NmZ7ngKHGOrIicgh7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDE0MSBTYWx0ZWRfX26mijWJHxVyJ
 DzjSFTTKLwvXMZ3DWvI27XL+EWJLhh4q2Sw0ra4fPwIAGajnon/I5WO/r/IQRDykPHz3w0zkdv9
 DVfgT05jlzasLGDPj2bTspJ8WfiQc4l9hMitbjX8opSVoQA2DN3OnnCPmgyj/RnaYyrF+jQkOai
 aawh8s/99awfcPHQnUeOQA8VrMhs37+Qcawc2DHY7D7yyvnrz4nlMeZ0NNvQcKXEBD3wErbYC4R
 +8c4YeNVU9UuNyqja/1EVE3KVFA/erXOSnsKRfSjgBzCx32FIiMNctJZgyVGbOSOSTX9/9BKY9A
 MWCV9UBn84eQ0bbqTYH+AY0Oy3gR9Kl5hGf3tCtbFsIZSoLImWKE+928PrTg093vC5pZF96j8DA
 a2KQSMgYI49Zw74rCoEDTyKw4Q+8IQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140141
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

CgpPbiAxMS8xNC8yNSAxNzo1NCwgUGF0cmljZSBDSE9UQVJEIHdyb3RlOgo+IAo+IAo+IE9uIDEx
LzE0LzI1IDE3OjQ5LCBQYXRyaWNlIENIT1RBUkQgd3JvdGU6Cj4+Cj4+Cj4+IE9uIDEwLzMwLzI1
IDA4OjQzLCBZYW5uaWNrIEZFUlRSRSB3cm90ZToKPj4+IEhpIFJhcGhhZWwsCj4+Pgo+Pj4gVGhh
bmtzIGZvciB0aGUgcGF0Y2guCj4+Pgo+Pj4gQWNrZWQtYnk6IFlhbm5pY2sgRmVydHJlPHlhbm5p
Y2suZmVydHJlQGZvc3Muc3QuY29tPgo+Pj4KPj4+IExlIDA0LzA5LzIwMjUgw6AgMTQ6NTMsIFJh
cGhhZWwgR2FsbGFpcy1Qb3UgYSDDqWNyaXTCoDoKPj4+PiBVc2UgTFREQyBhbmQgTFZEUyBub2Rl
cyBpbiBhbGwgYm9vdCBwaGFzZXMuwqAgVGhpcyBpcyBzcGVjaWFsbHkgdXNlZnVsCj4+Pj4gYmVm
b3JlIFUtQm9vdCByZWxvY2F0aW9uLgo+Pj4+Cj4+Pj4gUmV2aWV3ZWQtYnk6IFBhdHJpY2UgQ2hv
dGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+Pj4+IFJldmlld2VkLWJ5OiBZYW5u
aWNrIEZlcnRyZSA8eWFubmljay5mZXJ0cmVAZm9zcy5zdC5jb20+Cj4+Pj4gU2lnbmVkLW9mZi1i
eTogUmFwaGFlbCBHYWxsYWlzLVBvdSA8cmFwaGFlbC5nYWxsYWlzLXBvdUBmb3NzLnN0LmNvbT4K
Pj4+PiAtLS0KPj4+PiDCoCBhcmNoL2FybS9kdHMvc3RtMzJtcDI1LXUtYm9vdC5kdHNpIHwgOCAr
KysrKysrKwo+Pj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPj4+Pgo+Pj4+
IGRpZmYgLS1naXQgYS9hcmNoL2FybS9kdHMvc3RtMzJtcDI1LXUtYm9vdC5kdHNpIGIvYXJjaC9h
cm0vZHRzL3N0bTMybXAyNS11LWJvb3QuZHRzaQo+Pj4+IGluZGV4IGQ5YWVlYjZkNTEwZGY5ZGVh
OTcwMDE0OGNmOGE4YWQ1ZWZjZmQ0ZjkuLjNhYzM1YzRhNmJjMjdjNzJlZWViNTMyNzQyZmQ0NDEy
YjdhYTFiODUgMTAwNjQ0Cj4+Pj4gLS0tIGEvYXJjaC9hcm0vZHRzL3N0bTMybXAyNS11LWJvb3Qu
ZHRzaQo+Pj4+ICsrKyBiL2FyY2gvYXJtL2R0cy9zdG0zMm1wMjUtdS1ib290LmR0c2kKPj4+PiBA
QCAtOTMsNiArOTMsMTQgQEAKPj4+PiDCoMKgwqDCoMKgIGJvb3RwaC1hbGw7Cj4+Pj4gwqAgfTsK
Pj4+PiDCoCArJmx0ZGMgewo+Pj4+ICvCoMKgwqAgYm9vdHBoLWFsbDsKPj4+PiArfTsKPj4+PiAr
Cj4+Pj4gKyZsdmRzIHsKPj4+PiArwqDCoMKgIGJvb3RwaC1hbGw7Cj4+Pj4gK307Cj4+Pj4gKwo+
Pj4+IMKgICZwaW5jdHJsIHsKPj4+PiDCoMKgwqDCoMKgIGJvb3RwaC1hbGw7Cj4+Pj4gwqAgfTsK
Pj4+Pgo+PiBBcHBsaWVkIHRvIHUtYm9vdC1zdG0zMi9tYXN0ZXIKPj4KPj4gVGhhbmtzCj4+IFBh
dHJpY2UKPiAKPiBUaGlzIHBhdGNoIHdpbGwgYmUgZHJvcHBlZCBhbmQgc3VibWl0dGVkIGluIGtl
cm5lbCBEVCBzaWRlIGluc3RlYWQuCgpzZWUgaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9w
cm9qZWN0L2xpbnV4LWFybS1rZXJuZWwvbGlzdC8/c2VyaWVzPTEwMjM2NzMKClBhdHJpY2UKCj4g
Cj4gVGhhbmtzCj4gUGF0cmljZQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0Cj4gVWJvb3Qtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQo+IGh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QK
VWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
