Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69248C315C5
	for <lists+uboot-stm32@lfdr.de>; Tue, 04 Nov 2025 15:01:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10D11C62ECF;
	Tue,  4 Nov 2025 14:01:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32859C030AF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Nov 2025 14:01:55 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A4DsSoA360968; Tue, 4 Nov 2025 15:01:38 +0100
Received: from osppr02cu001.outbound.protection.outlook.com
 (mail-norwayeastazon11013043.outbound.protection.outlook.com [40.107.159.43])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4a7g9n0x1j-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 04 Nov 2025 15:01:38 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bz78hlqqIdMPlEz1tZLkAbpSQYNsPzcF1REyKM8R/ttr1G3kBewk/faEu6gxNJ3CW1cpgNs81IMH7pu4QFI7X6wVi5OidRwjv0RNFn/yiCKltxiA8fpDW/IAGlHLfALR/aDjQA6n1xwgtqH87jgVVpCNtxZV/fFiT6LliS+tADYdVX4AxapvW3ikRK7LVT6JPvEY6uSaEqTL0KvydWPnpJk/bcqZm1kUXZeH0sDlV2JJYPQ3g8xSF26+Of/C9A6+32D5PY7tWJJ9i/RZpPLThA4hE0abVc/9aLuYWfzTjUMzZoGL7ks7HgmpWezQu+/Z+bNmijuYeSw4jP6ngo07Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5rlChNZ+4DpoTIPG1NkF+hwJ3venN17UL6TbFhFE4Hc=;
 b=c7mRZX2XV/O8ivr5mR4IL2b2yK3irijJ8mYaItkkeUXMynx87g/ymGvCMPseYj6ZFEO5n03sthnDCwheMY7JkxDmcBptF2S7BZOjceC4xaEz0PT5aJqvwqCUkUkFPashs6Oo6KsA8rd/I1SrgLklUOmuEJjgWrbTQCZSzLpfcqSRPKgOVf9tqLUHne1dC6vEN3h3eRw+CWAz/ZKVRZ1jHu4WbxCFM8+L4GyYTKFKHLHfpnoJYURERcLgadq2NXufV1vlVHSyz/2RzzZ71vHAv15OvckudTBvXLPbFNmIkBSQbJRd0SijTqafeM2QPMEAwsP9iU5XcYa6aV0Lgtj6fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=konsulko.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5rlChNZ+4DpoTIPG1NkF+hwJ3venN17UL6TbFhFE4Hc=;
 b=BzF44E5iSN1HIX/FbZZqSpJrMzVWoeeLczCtICq2/h0ewMQklnkQOvi+y7ali6oZlNh5Rm2oEgGdQcPlClL9N8N3WIKFcmUcUKyNOUnIjlWqpj3hd9404Mnioq2w8v/EGfsBraxQt4eKwsX3HdYR+uF0RQ2CXpx+SbzD1udXNmGKAZRT1p8hD5zaNQojA0kyqrbY80Ysrgxu1AlXuglHuYGST5rejPHXkHBVAxhEp202DlmTjgdRY68dLBAhVOTt+d3v/QdjozeXf2rBelAVjy+pEZCugmxLGEwZH+jVh0FtwX23RY/Mv3ViqQkYuS3u962FJde1OE3diO0ex6rZLg==
Received: from AM8P251CA0004.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::9)
 by PAXPR10MB5567.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:242::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 14:01:36 +0000
Received: from AM4PEPF00027A5D.eurprd04.prod.outlook.com
 (2603:10a6:20b:21b:cafe::ac) by AM8P251CA0004.outlook.office365.com
 (2603:10a6:20b:21b::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Tue,
 4 Nov 2025 14:00:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 AM4PEPF00027A5D.mail.protection.outlook.com (10.167.16.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Tue, 4 Nov 2025 14:01:36 +0000
Received: from SHFDAG1NODE2.st.com (10.75.129.70) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 4 Nov
 2025 14:54:11 +0100
Received: from [10.130.74.180] (10.130.74.180) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 4 Nov
 2025 15:01:32 +0100
Message-ID: <bcd23bda-23f5-4e65-b09f-93ec4eb60414@foss.st.com>
Date: Tue, 4 Nov 2025 15:01:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>
References: <20250904-master-v3-0-b42847884974@foss.st.com>
 <20250904-master-v3-1-b42847884974@foss.st.com>
 <CAFLszTiT9iLx6gguhVui2Qh0Ew89yhvpDggKwPo71cB+Rv=xJA@mail.gmail.com>
 <aQavXq6jVagkIa53@thinkstation>
 <CAFLszThdV7cZ-uBXzqRYWv-HsGbNJV9BVKVOC4FQUD1yjZDNkg@mail.gmail.com>
 <20251103141726.GJ6688@bill-the-cat>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20251103141726.GJ6688@bill-the-cat>
X-Originating-IP: [10.130.74.180]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A5D:EE_|PAXPR10MB5567:EE_
X-MS-Office365-Filtering-Correlation-Id: bc255e75-1534-4a36-a1b0-08de1baaab32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZFBjVzQxTjZyb0k2NXBnMkEvV0NHUzh3S09Xa253Qk5icnZYTVQvWDJJRWJa?=
 =?utf-8?B?Kzk5K096K3VLVnJjSWh6KzV3S2pyOHpla0pZaURQZnlFYkxZdlZ2bjl4QlFR?=
 =?utf-8?B?bkhGNUI1NGc5RFVpTTIyM3NsUUdPRFZmR1RCVmk3eDRneHFhckZLQS9EYlht?=
 =?utf-8?B?OUVwaVNZam1yMVZmM1lqMVRhcmdsYTR1OXdZeDJSbFhrZVBudllIL1NKMUhE?=
 =?utf-8?B?OXpPbHExYjY5ckxnWklyajR2NnVIQ0Zlc0hCa2grenlYMVN3RVlKekJXL0ts?=
 =?utf-8?B?U3A0S0wwOEIzajhkVDRLOGo1RmhTWGNPeTlCSDZXVWJObitseG8rY2ZqTi8z?=
 =?utf-8?B?YWgrOGh1Q01iSFlydlEzZWhMVm5RQ0JpSk5waTVNMDQzNjBSY0NJUVZhSnZk?=
 =?utf-8?B?R2c0VHV1b2x0Uy9QZ1p5eTBTeGxGakFIM2dNamZBM0tNWkszTjlxWldMc2E0?=
 =?utf-8?B?RW43V2l3Y0FicExFYStkWmhjc2l0UlE1Q05rZ2tvTWkzbGY0V2NZZyt6MFJJ?=
 =?utf-8?B?YVI5OEVSSGJxR1BUQ21lOU01aXRLMDBScVdoR2Z4L2tPcU9DVjdOWk5tdURx?=
 =?utf-8?B?djdWZ3FmWEUzY1Jxek5zczlLQi9hOTFkMm1yV0ZWVUxlTzJvMXg1bVZySngy?=
 =?utf-8?B?dkhJL1F5MmFnb3o4eXNRUFpUeEtONWM3UmZDWGEzZG45U2dBMERZd2pZb3pZ?=
 =?utf-8?B?NUVKNjhXby82ZVBsVGxNdEdmSGFxdjUxdFlqTU1ONWpFQmdBbHFxajJMMmFy?=
 =?utf-8?B?NDdJOUpZNVo3MXBnUnJyTStZWXFWVzBrblYxc2VTVTRZSHc4akNCZExJMGxV?=
 =?utf-8?B?YS91YkVnbEN4OTE4NGtIcjl6dGxUQnFYZmVwN2tLeis2ZWtyalEvTFJ0d00z?=
 =?utf-8?B?QmJnQnRPMkl2ejE0RnlsbmUyT2VzNnlEZktRMnlPTUlhTVAwdmpkZlZ0RWU3?=
 =?utf-8?B?aW9tU09CdEpvU2ZrNndkSkE1Wm9MVXJoM1A1WVllY3JwcytNSzNjYkg5YjU2?=
 =?utf-8?B?Tmxmck96eXpnd2RHZjA0aVVDK2FFU09xbEJzYjN4elBBb2RYNWZQY1FIV25G?=
 =?utf-8?B?VTdCTnJBM1R0UDFaTjd1WFFCd3NRRW1WMVJEbXk3dkZnMldNRFdYbE5aOXBm?=
 =?utf-8?B?NElPUG9YcWFaMFVrZ25XMkduamdTbUNGcEJrMW1STUVaVmY3aFI5NXNBSHNn?=
 =?utf-8?B?KzBlODJxTXdVNlJKUCt3VUc2T3Q5aE9udjgraHdsUFZJVGJ0VmFwMVZNNlJ4?=
 =?utf-8?B?QUp3Y3B5cU9MdUYyTXBkVXlETitERmh1SzhsdDJMTHdVVGdIUFJPTVhML0FK?=
 =?utf-8?B?NkVMd2V1TVVya0lrMGVRbTZZd1pKL0RoUzl6UzlWQkthc2pib09GRGZabWlT?=
 =?utf-8?B?R2tnYzFmREg3bWpXdTNIblUrdEtzOEs5NnoreGdITk1yVFJWZjFzUEoyWFkr?=
 =?utf-8?B?c1czSDlPZ0UrVERVVEQ0aGJVZ0o0Z21SSzJoVitycUVLMW42VHB5ME9Jc3VW?=
 =?utf-8?B?ZWxmeDE4OXZqeWtiUVRLTEVrclVLMkR2eFNaYkg4a2IvSklOTUwzNTVFeFBJ?=
 =?utf-8?B?YnprTnFWdFlMbDBTRnpJc29NVlpleXY1UWtLQUxCNEZyK1FvZ254N05pVHF0?=
 =?utf-8?B?eVIyd2hwZGZ2Yk4ya2FBWUR3Nnd0ajV6ejVtZlhpYU9mQlF6eUFyYml1NFhS?=
 =?utf-8?B?M3BJdHNENXYrMGlZa1hEdWJoOHVGNmZkdytiY1QrQW5PSHlNVzVXa0ozcmd1?=
 =?utf-8?B?VGpvVW85djhkbDRYTEtQYzZwdWkrcEc2YkJhRFhZS1ZtUjEwQkdWRG5Zd0xV?=
 =?utf-8?B?RUk4MXhnT3JtYWhoS29EK3hrNC9jcis2cXJMZCt0VFl6cVcrcG40UVVkRHZo?=
 =?utf-8?B?L2hnZmRrV0w1aTE5OUZ6SE8xRTNUMXNPMU0ydkJOSTVVS1h5V1hXRDhablpV?=
 =?utf-8?B?WStWaTBwalFsNkd1MjVGMUVRWGppTjVvQ2ZNcFo3OXFlcVp1VWtGcURpTisz?=
 =?utf-8?B?dFFHN1FKRWk3Qllsb1FrTSttTS9RWVFQQU5oSlBUVWozWVFJVDFEcWxzOFlj?=
 =?utf-8?B?dE5yQ1E0clN5L3QwWUQ2dzUrQ3VNZlJxTzhWT0pHZjY2Y3BXSTBJL29UV0JM?=
 =?utf-8?Q?6oKE=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.44; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 14:01:36.2823 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc255e75-1534-4a36-a1b0-08de1baaab32
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.44];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A5D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5567
X-Authority-Analysis: v=2.4 cv=WL9yn3sR c=1 sm=1 tr=0 ts=690a0742 cx=c_pps
 a=pNXGupngiSMufF7CtLwx6w==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XKbaJabmtZkA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=XpE1AkgCAAAA:8 a=pGLkceISAAAA:8 a=8b9GpE9nAAAA:8
 a=n80wY7uYJ-erOnvW-hMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cF5W-B9r96wA:10 a=dpZMgbseYPk84XhQl7oQ:22 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: 0z0sIwLd9614tNiu1wIMWJ8bMh5y9JBq
X-Proofpoint-ORIG-GUID: 0z0sIwLd9614tNiu1wIMWJ8bMh5y9JBq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDExNiBTYWx0ZWRfX1TmvCUSy2lCp
 nkgytJur3k8+OeROw216sTq9VZ+1RLplzyyrzUrOQw+otuy6oak08P4y0WLNRRTqB6PL3iCufS7
 sZESfaAOoZzvbjdrvEB8HHWU2aEVV2jSWRPBLKApJU1KW96fIr6XDG/vvwQizy0alZe+XDZQmJU
 eAcFEFeeGcmhkQETqui80jOF18YGs9+aqHsZ6mmfftKQ41trsZc3bt67AezPfhGZAKFllqCXRWI
 RJK8KXX5cKrzcl7Ukcwh0jKW6geYGKKINcG2s7PhTqn9Sr5nylu1YiiVRTV33MDyUpRWIjnTN64
 ywimJnyix25scvk/mh0+lKwHTs8NN9jT52qyESCUrvhZLrE/bu+lIiEbjS/r0wabmn72fdo6Hjw
 ZlwG+ItmoyEZm3FZ47HbWSm5+uPzkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-04_01,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040116
Cc: Yannick
 Fertre <yannick.fertre@foss.st.com>, Kamil Lulko <kamil.lulko@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Dillon Min <dillon.minfei@gmail.com>,
 Anatolij Gustschin <ag.dev.uboot@gmail.com>,
 Sumit Garg <sumit.garg@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH v3 1/7] ofnode: support panel-timings in
 ofnode_decode_display_timing
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

CgpPbiAxMS8zLzI1IDE1OjE3LCBUb20gUmluaSB3cm90ZToKPiBPbiBTdW4sIE5vdiAwMiwgMjAy
NSBhdCAwODo1Mzo0M1BNICswMTAwLCBTaW1vbiBHbGFzcyB3cm90ZToKPj4gSGkgUmFwaGFlbCwK
Pj4KPj4gT24gU3VuLCAyIE5vdiAyMDI1IGF0IDAyOjEwLCBSYXBoYcOrbCBHYWxsYWlzLVBvdSA8
cmdhbGxhaXNwb3VAZ21haWwuY29tPgo+PiB3cm90ZToKPj4+IExlIFNhdCwgTm92IDAxLCAyMDI1
IGF0IDEwOjAzOjU5QU0gKzAxMDAsIFNpbW9uIEdsYXNzIGEgw6ljcml0IDoKPj4+PiBIaSBSYXBo
YWVsLAo+Pj4+Cj4+Pj4gT24gVGh1LCA0IFNlcHQgMjAyNSBhdCAxNDo1MywgUmFwaGFlbCBHYWxs
YWlzLVBvdQo+Pj4+IDxyYXBoYWVsLmdhbGxhaXMtcG91QGZvc3Muc3QuY29tPiB3cm90ZToKLi4u
Cj4+Pj4gUGxlYXNlIGFkZCBhIHRlc3QgZm9yIHRoaXMgaW4gdGVzdC9kbS9vZm5vZGUuYwo+Pj4g
SGkgU2ltb24sCj4+Pgo+Pj4gSSdsbCBnbGFkbHkgZG8gdGhhdCwgYnV0IEkgaGF2ZW4ndCB3cml0
ZSBhbmQgdXNlIGFueSB0ZXN0IGluIFUtQm9vdC4gIFNvCj4+PiBpdCBpcyBhIGJpdCBmb2dneSBo
b3cgdG8gaW1wbGVtZW50IGl0Lgo+PiBUaGVyZSBpcyBzb21lIGluZm8gaGVyZToKPj4KPj4gaHR0
cHM6Ly9kb2NzLnUtYm9vdC5vcmcvZW4vbGF0ZXN0L2RldmVsb3AvdGVzdGluZy5odG1sCj4+Cj4+
PiBEbyB3ZSB3YW50IHRvIGNyZWF0ZSBhIGZha2UgZGV2aWNlLXRyZWUgYW5kIHRlc3QgZWFjaCBj
b25maWd1cmF0aW9uIG9yCj4+PiBkbyB3ZSB3YW50IHRvIHRlc3QgaW4gdGhlIF9jdXJyZW50XyBk
ZXZpY2UtdHJlZSBpZiB0aW1pbmdzIGFyZSBjb3JyZWN0bHkKPj4+IHNldCBhY2NvcmRpbmcgdG8g
dGhlIGluZGV4IHZhbHVlID8KPj4gSXQgbG9va3MgbGlrZSB0aGVyZSBpcyBhICdkaXNwbGF5LXRp
bWluZ3MnIG5vZGUgaW4gdGVzdC5kdHMsIHdpdGggdGhyZWUKPj4gc3Vibm9kZXMsIHNvIHlvdSBz
aG91bGQganVzdCBiZSBhYmxlIHRvIGdldCBhbiBvZm5vZGUgZm9yIHRoYXQgYW5kIHRoZW4KPj4g
cmVhZCBvdXQgb25lIG9mIHRoZW0gYW5kIGNoZWNrIGl0Lgo+IE9LLCBidXQgd2hhdCBpcyB0aGUg
dXRpbGl0eSBpbiBkb2luZyB0aGF0PyBXZSBkb24ndCwgYW5kIGFyZW4ndCwgZ29pbmcKPiB0byBo
YXZlIHRlc3RzIGZvciBldmVyeSB2YWxpZCBwb3NzaWJsZSBEVCBub2RlLCBhbmQgdGhpcyBpc24n
dAo+IGludHJvZHVjaW5nIG5ldyBsaWJyYXJ5IHBhcnNpbmcgZnVuY3Rpb25hbGl0eSAodGhlIG1v
c3QgcmVjZW50IHBhdGNoIHRvCj4gdGVzdC9kbS9vZm5vZGUuYyB3YXMgZm9yIG9mbm9kZV9ncmFw
aCBhbmQgdGhhdCBpcyBpbXBvcnRhbnQgdG8gdGVzdCkuIFdlCj4gZG9uJ3QgaGF2ZSBkaXNwbGF5
LXRpbWluZyB0ZXN0cyB0byBzdGFydCB3aXRoLCBzbyB3ZSdyZSBmaW5lIG5vdCBhZGRpbmcKPiBz
b21ldGhpbmcgbW9yZSBoZXJlLgo+CgooQWRkaW5nIGJhY2sgUGF0cmljZSwgd2hvbSBoYWQgYmVl
biByZW1vdmVkIGZyb20gQ0MuKQoKR290IGl0LCBzbyBub3RoaW5nIHRvIGRvIG9uIG15IHNpZGUu
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0
bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vi
b290LXN0bTMyCg==
