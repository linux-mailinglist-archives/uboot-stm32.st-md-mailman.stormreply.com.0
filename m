Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 566FCB554D2
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Sep 2025 18:42:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3ECEC3087B;
	Fri, 12 Sep 2025 16:42:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CEBE1C32EA8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Sep 2025 16:41:59 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58CG7K4n020084;
 Fri, 12 Sep 2025 18:41:49 +0200
Received: from du2pr03cu002.outbound.protection.outlook.com
 (mail-northeuropeazon11011062.outbound.protection.outlook.com [52.101.65.62])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 490xh295ke-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Sep 2025 18:41:49 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gMncO/f3kuTqyr0OEbZRi7ndVBjRE3aoN0SJJmlTYo1IAa1nA3ZLJbNMg/mSU37wIQaqGmuZMcEwzl6zurssqEz5j0TGBaQeUQGlcbFd7XQI3dtS/9u59/54HZkZAv65P616DmAisARQMuG7TRzoODFbHWwg/91jJUo2huZgJ2g6ME1ousuc4hmZI+sQZGX/1kgBS+vp/k7HeEZr4Hor5UpzVUS2JnvIqOKzbMbI8bxHSFdZbE0viRbPCdOFVDc0c8NzTIwCOgp4WeK7lDbTzJ3zCZ64DPDdPYf6MM3u8HX0JFl9hEeLmf0iK1bS6DP4+RWs+TNkZunh6sTni5UMmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=unlnAOjJTAZAbuip6Dljyc3g1hR1gO9YkCJsB/IlKlM=;
 b=Q4oyWGBYfIUnSpKX2aVY1BjqcsdUlOxs9DRXkHybv4rhWtxx3JsbW/a2VsT9Lg+OQVq+VLRwOIP41CnEBGXe53hXrWxrXjOuDoaC92t1VxQNZh3sLGrrI6aqvBfNKd0uiFGR380Apr//BUyIbYQQqHr07NudX5xlFaC0+zwFSimT+sYQFDxA/zNYYSImfi7Y70nX/uoW6oRaeQdLfo4Hb1h9aoraZUjm3MTvfPV6ZlMOOrKTZsJ0bPvHOJPDeouaArRQuMdnNX3N26JuuZDchRE/exruAX0UO6A5Uu3Xy5a4g2ltxE4SWgp2lInBs/CX+7YquMKOx3+sC7J1wfrt7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=konsulko.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=unlnAOjJTAZAbuip6Dljyc3g1hR1gO9YkCJsB/IlKlM=;
 b=Doviw8b+6I+9cL34ih17U0ntFXOakCuX1LNDGvX7V6yuaJb4kN40+8UJSX8V8TEtJievb8cCB12Q8/QjeB3k+QqUWP/DdvUcyfTm989rBnCnxtjyeM8czyMZ5iJmgZqZ4xueQ+Iye268T0Cq7ywItuOrxNoBkTDtRM1uqux+K9qHNlFumSWebYHWrFHx/HMy+mFLxTkIHsuCdMmmKr49r4P7BRoCqf3agNpQmoyCqhAjcaz+WrwRaTWqDHvAoXqqpv5T+/kl4WaAfWsNbR1Oidr8k3RrbabJ7eGFE768v1lDGHrgFH9nVF7kmZC1MxlkU0OsPs/9XnhjRqkGSlisGg==
Received: from AS4P189CA0065.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:659::8)
 by GV1PR10MB7979.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:80::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 16:41:43 +0000
Received: from AM3PEPF00009B9E.eurprd04.prod.outlook.com
 (2603:10a6:20b:659:cafe::20) by AS4P189CA0065.outlook.office365.com
 (2603:10a6:20b:659::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.18 via Frontend Transport; Fri,
 12 Sep 2025 16:41:42 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 AM3PEPF00009B9E.mail.protection.outlook.com (10.167.16.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Fri, 12 Sep 2025 16:41:43 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 12 Sep
 2025 18:39:21 +0200
Received: from [10.252.28.204] (10.252.28.204) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 12 Sep
 2025 18:41:42 +0200
Message-ID: <3b8a1653-9cf9-4107-b2a8-2c2f639a5ddb@foss.st.com>
Date: Fri, 12 Sep 2025 18:41:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Tom Rini
 <trini@konsulko.com>, Kamil Lulko <kamil.lulko@gmail.com>, Dillon Min
 <dillon.minfei@gmail.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <ag.dev.uboot@gmail.com>,
 Simon Glass <sjg@chromium.org>, Sumit Garg <sumit.garg@kernel.org>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>
References: <20250904-master-v3-0-b42847884974@foss.st.com>
 <20250904-master-v3-4-b42847884974@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250904-master-v3-4-b42847884974@foss.st.com>
X-Originating-IP: [10.252.28.204]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9E:EE_|GV1PR10MB7979:EE_
X-MS-Office365-Filtering-Correlation-Id: f7a2046f-6643-4051-ae20-08ddf21b4195
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VXkwT0dvdHZXRXVGZGdqaUZYWTI4a2NDTm9yNlNBa25ycU9RbFp2cDlIaG0z?=
 =?utf-8?B?ZVdhaHhQaFV1MUZPRk1aQ2t4eHloTU8wZFpZRm9Fdjdxemt6TnVUNHljS2Yz?=
 =?utf-8?B?Tm9vL2RndDFFbUp0SkRwZ1BMNHNBaFFyVWJLWDNkTHVwRjhRTWRzSEtvb1dk?=
 =?utf-8?B?OW9BcWtvckh3Z2d6RlVsSUVuckJzUGFLVUo3Vnp4S3p4aUpUUkZrK1ZZSUpC?=
 =?utf-8?B?ZWlQMGxkNE1qZzNFYnREbTJTSWszWnJNejkrT1hzZWRFb2N4OGJEb0RQU1k5?=
 =?utf-8?B?K0QvdzZCVllHbGJyNm9yVVhVS250d0w0SjEzU3lZcnpqUGxRVE1ndWMrTVlw?=
 =?utf-8?B?TG9vTyszbTNXZ1QwWUh6R1V5U2U1WktVeGFYMzJJNUtmQmt4MkhpbjZpM2lY?=
 =?utf-8?B?N1E3bnpMTnQ0emdLY3RFZ2xSRXVyU3ZGbWZCZXFzdFdsY2VRUlpGRFhhcHJV?=
 =?utf-8?B?L0FyVEhybUNacUlyd3cwN1pFNFJtdTg0V1JjUFBxbE1KNTU2T2p6WnUyQWRP?=
 =?utf-8?B?WUhHTllyeTVxa2QwaTdlTmJqb3hnSkdsMWhVKzF0Y0ZUSHB2VzA1ZmpvMyt6?=
 =?utf-8?B?L2hFc1JhdHhFeHhzeld3dWZmV21TK3J4Vm85cFF1RkR5R1FCTXVYTEtvVXV6?=
 =?utf-8?B?K0FBeTBvWXQzWStub3dRWC9ISHFtN21TMzRkWmNjeVpXT3Z1MWdNeHpzbWtK?=
 =?utf-8?B?RHFOQUFWRnhzMUxyeVJKYnBXNlBuTzRZeHE2SEFmZkcreTVQNzBSWkhVZ3Rp?=
 =?utf-8?B?ZXc1SUFKNEE2RFVoSHd5UVhLTHpRenYrZTJpYlJudXdCa3NTdHJNS0JiR0ZJ?=
 =?utf-8?B?QngwRll0Q1VpM2pKbGh6L3lmQUpCR0JzU3k0QWtBbW5VQ3JMYmc5UUNnTVhw?=
 =?utf-8?B?amM4NHMyaEJYeHhDOHF4Vm5nUFdtT0U4dURXYUg2elRabmVrM3JZcnY2SUI2?=
 =?utf-8?B?ekt6aXdvTjJaK091VW1Pdm51Rm5uSjBaTTdseXpUaWJiaHgxOUEvRTNKaGtP?=
 =?utf-8?B?T0VmV25td2NUOGFnTWIvd1ludDZERDN3Q0dxWDRpS1A0ZW9qeU91UzlMQ1ov?=
 =?utf-8?B?Qmp5ZjZtZDkyKzI2bnVzZEhPTGpraytWY3NDeWtlMk9kRUkvd0dRWXliTGV1?=
 =?utf-8?B?a2ZlNTF3OHhjclQ3QWdwT2RoU1hZWG1lcVBtSHhFdTAxT1M1UFdNaEJtdWR3?=
 =?utf-8?B?T1poOW91NmJ5Y3hzM1lLL2dhYm5pNmVpejZDdUpOZ3B5VzJMMC9PRGM2OTFM?=
 =?utf-8?B?K0NzbjBtRElCWG5aNUVyVFZwVGFiM0FJODZ4MFZ1cnBlTzBNZXl3L3ltSzZw?=
 =?utf-8?B?R3R5YlpLRHVKR1dnTFpXVFdiN21PTHlaWUZXZ2pUYldYWmdMVFZkb2J4YUhm?=
 =?utf-8?B?aWc2UFBtZVU5YmlkdTRqNmRyZDZYK2V6MVE3M2lzUXRzbFdza1N1M2dKRWFW?=
 =?utf-8?B?RkZac20yVGZnNjRqSmN2d2JiNzBGQzlGdkRlYlp5TEt0WmpIYnhQT3owUUdK?=
 =?utf-8?B?azBreGFNNWNzOUlNUHJ5blIwSGV0eDBqN1F6c2NUZCtvZElSV0h3UHNLZVRi?=
 =?utf-8?B?cXBPd3I3Szd3SlVBZTVSV2t2NWROQmVrRFVRQ1pLd2ZEbXZIaEJuQlkyeXVl?=
 =?utf-8?B?Y2NsbVJSdXk3Zy9JRGE1QWIwSHhNeFh5VEQ4c0xkMXoxNUxGaHozYjZxM3dT?=
 =?utf-8?B?RGlRbzZhaFo2MHNNVFptSElWT0M2dkNuS3pwdThkSEExSS9YQTJ1OUJMeFhk?=
 =?utf-8?B?WVVObHUrYVpaUmcrdnZGLzhWczl2ZDJET2pTY2wxTTNId0FQVVZUTFNXOS9Y?=
 =?utf-8?B?em9aWTlJV0pyc3d1dmY4M3dldk9Pb2VnRDZuNmtBZE9iVnhTMHNmZlQ3UWpH?=
 =?utf-8?B?VEFHZmRlT2o1cGxrV2p1cWh0dXNpTVZjbG9NQlJuejJPdjBTN3dreklkUmpC?=
 =?utf-8?B?b0dDbVg2Um9MT3NNT1hDQ0NLSlJZUG1QNjdzYytUdmhHdXRqRXVldmc2QVBq?=
 =?utf-8?B?MTUreTRVUU5RanJ0KzI4L3BmS3pBamgzUjRNMFlvUURuUERoWUk3RkZFR0hy?=
 =?utf-8?B?M3BGcjZ1YVFuTXFZSDFrbDVqQWdwTDFac25Qdz09?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(921020); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 16:41:43.3910 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7a2046f-6643-4051-ae20-08ddf21b4195
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009B9E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB7979
X-Proofpoint-GUID: aRW_GhSj0k3zH5IxOLNpk_eN8gjUalPm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDIyOSBTYWx0ZWRfX0tnXRQ+caTJO
 TDKb3zVaaCuEAIaitk4IN6Y9Dk2W8j5CF4eKtLNja+FBiSMAXTyA+aJUSon76AD/hwXAbC1rjXq
 5+XEmK3cDmw0qhk5wZa+rD2l/0Qbs3HM71m/OXL19dFcyWL6VufPmC4rSjQl4HYNLbinSrXeGo8
 j3eZfMU5tU9eTzCObTsMfYyRHMPqpmZkZNNvEMbGqYlWWeIR0+S5JVOHiMR0wE8wZ9Xuj/viQPw
 jdn1gqRZjCtjm0NrrtaS/Dm0I08fOKOR4vD4CnWTvQEl1u6i74pvbmyQJsx0bF32pzRKow21Xn1
 P9zdydhvI6/Tk0ekrfpeWOHWeXPwwi0av8SOyxzLDpGaCU9z9XS7MFvSBZwop2sM1qUbMpColT0
 CAIcabVG
X-Authority-Analysis: v=2.4 cv=VKfdn8PX c=1 sm=1 tr=0 ts=68c44d4d cx=c_pps
 a=/Td+Pw0eUNZ4+yzxueSCbA==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=d2j-ISUXm-8A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=8b9GpE9nAAAA:8
 a=om3LltiD2PVDzgVV-wYA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: aRW_GhSj0k3zH5IxOLNpk_eN8gjUalPm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_06,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0 spamscore=0
 clxscore=1015 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060229
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH v3 4/7] video: stm32: ltdc: support new
 hardware version for STM32MP25 SoC
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



On 9/4/25 14:53, Raphael Gallais-Pou wrote:
> STM32MP2 SoCs feature a new version of the LTDC IP.  This new version
> features a bus clock, as well as a 150MHz pad frequency.  Add its
> compatible to the list of device to probe and handle quirks.  The new
> hardware version features a bus clock.
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Acked-by: Yannick Fertre <yannick.fertre@foss.st.com>
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>  drivers/video/stm32/stm32_ltdc.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/stm32/stm32_ltdc.c b/drivers/video/stm32/stm32_ltdc.c
> index 0a062c8939dbe49b11aa50f5ca9701bdbe5c5b0b..efe9a00996eca0301d2a2b82074ba9690a967a73 100644
> --- a/drivers/video/stm32/stm32_ltdc.c
> +++ b/drivers/video/stm32/stm32_ltdc.c
> @@ -262,6 +262,7 @@ static const u32 layer_regs_a2[] = {
>  #define HWVER_10300 0x010300
>  #define HWVER_20101 0x020101
>  #define HWVER_40100 0x040100
> +#define HWVER_40101 0x040101
>  
>  enum stm32_ltdc_pix_fmt {
>  	PF_ARGB8888 = 0,	/* ARGB [32 bits] */
> @@ -529,7 +530,7 @@ static int stm32_ltdc_probe(struct udevice *dev)
>  	struct udevice *bridge = NULL;
>  	struct udevice *panel = NULL;
>  	struct display_timing timings;
> -	struct clk pclk;
> +	struct clk pclk, bclk;
>  	struct reset_ctl rst;
>  	ulong rate;
>  	int ret;
> @@ -540,7 +541,21 @@ static int stm32_ltdc_probe(struct udevice *dev)
>  		return -EINVAL;
>  	}
>  
> -	ret = clk_get_by_index(dev, 0, &pclk);
> +	ret = clk_get_by_name(dev, "bus", &bclk);
> +	if (ret) {
> +		if (ret != -ENODATA) {
> +			dev_err(dev, "bus clock get error %d\n", ret);
> +			return ret;
> +		}
> +	} else {
> +		ret = clk_enable(&bclk);
> +		if (ret) {
> +			dev_err(dev, "bus clock enable error %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	ret = clk_get_by_name(dev, "lcd", &pclk);
>  	if (ret) {
>  		dev_err(dev, "peripheral clock get error %d\n", ret);
>  		return ret;
> @@ -566,6 +581,7 @@ static int stm32_ltdc_probe(struct udevice *dev)
>  		priv->pix_fmt_hw = pix_fmt_a1;
>  		break;
>  	case HWVER_40100:
> +	case HWVER_40101:
>  		priv->layer_regs = layer_regs_a2;
>  		priv->pix_fmt_hw = pix_fmt_a2;
>  		break;
> @@ -688,6 +704,8 @@ static int stm32_ltdc_bind(struct udevice *dev)
>  
>  static const struct udevice_id stm32_ltdc_ids[] = {
>  	{ .compatible = "st,stm32-ltdc" },
> +	{ .compatible = "st,stm32mp251-ltdc" },
> +	{ .compatible = "st,stm32mp255-ltdc" },

in V1, only "st,stm32mp251-ltdc" compatible was introduced.
Why are you adding "st,stm32mp255-ltdc" compatible ? 

For me only "st,stm32-ltdc" is needed, currently, nothing in drivers/video/stm32/stm32_ltdc.c
is justifying to add "st,stm32mp251-ltdc" or "st,stm32mp251-ltdc" new compatible.

Patrice

>  	{ }
>  };
>  
> 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
