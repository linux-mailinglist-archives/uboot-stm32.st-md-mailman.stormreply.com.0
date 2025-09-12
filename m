Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2BCB554E6
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Sep 2025 18:46:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 140C5C3F93D;
	Fri, 12 Sep 2025 16:46:19 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 140BFC3F933
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Sep 2025 16:46:18 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58CFZrBw006148;
 Fri, 12 Sep 2025 18:46:12 +0200
Received: from mrwpr03cu001.outbound.protection.outlook.com
 (mail-francesouthazon11011010.outbound.protection.outlook.com
 [40.107.130.10])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 490ywn0fu1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Sep 2025 18:46:12 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JUTjaak/eUCq2qdCOg7ZBsfDitWbJ83oe5UP/NtZK+d22Kwoxlgj0r24VyAFcz1J/XSMJsLrFXkB5jprRypAuCKrpS2dfCU0b85+gG+xmffc40vWbPrgfCTLDHlE4j4DhZ0zTGRQh5DmLTYLON9WT/b6HffOJsxlJ/SEWTfLYfLqrgo9EgnOFhZ9TAG+uOD1VEBzuaOmg/TJk87E9Gw5/6CVLsUbS4hcioYsHDSHJFTp8AIakqBW8HqqZUfkXxEu8Nb9jWJWJE5RynBoSxsZcK6kkJObyMkmpj8m+ufJlS6SLxu0GjWyRamHwzQHscvw88XV5EnGPfUEPLJ1tAul8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oEE01/Ct8yW2NGlRqOUkCQ4/JX1pIdUG5pT0tuYuN38=;
 b=nNnyhRhmRTcnkjpJ+Ml3fybru4QhEe3DT6xdnLadTVV4sNOOfdLB8sn+Pp5K/7TfsGEhM5KOGsotFkIHJDyhXk5Fot7RcULqHnCJ5QLTAP6GIDK8FXnKyhVCyz5R6pJ3C4SEKPP7T/I5A47c2pCnrp5mAv/P/QXaBeWRDoykvC3GoJMLOJRpNW+ncvvp621dmkjXAAWMd4C4v8xFwo7cxzgUffcZHol+AorQNsBLoVtIf+bb41qbf5HPrvb4+UnBuKnLHLYa2+FqcdKR5nnLSBsnqCL6D4FvzZpc6QlKEOBeJPKgGEeTTzARmknT55nYCN3hbxZUY1nCKQnm8Q3Aig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=konsulko.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oEE01/Ct8yW2NGlRqOUkCQ4/JX1pIdUG5pT0tuYuN38=;
 b=k4el3df5Q3RQbtwxkH8H1jDv8wzCBfnpqPNlS1UsmN7tPvt4u1CGZnNLOjvvb6J0YI/BitIaEvQwkIzusNVPmcUtzVmyLIUz1vnpYqgpuV/CFBD2joJQRGu+RKf+nVfuTEIV2zqc1Mfw4Dw8La+GalKIuUrevhkvExafTtc/IfqfPhMj09qtgTiaSkuCKB+zLPyIg0UfIqb7gEBNKnfp4y5mW/QBQJqN3y+P1RCWiRqt0Cc9jFC3/kE1wmrQ58BHkuIKGqsMVswP+gqECuSGQ5E3o6lm9fcGMtBcG8yzaSuKX1Q3zI3abfSxYz0wsmuEL65y+fTQLZ/d7UqtvGhgbg==
Received: from CWLP265CA0436.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d7::6)
 by DB4PR10MB7446.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3f1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 16:46:09 +0000
Received: from AM4PEPF00027A6A.eurprd04.prod.outlook.com
 (2603:10a6:400:1d7:cafe::be) by CWLP265CA0436.outlook.office365.com
 (2603:10a6:400:1d7::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.18 via Frontend Transport; Fri,
 12 Sep 2025 16:46:09 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 AM4PEPF00027A6A.mail.protection.outlook.com (10.167.16.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Fri, 12 Sep 2025 16:46:08 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 12 Sep
 2025 18:43:46 +0200
Received: from [10.252.28.204] (10.252.28.204) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 12 Sep
 2025 18:46:07 +0200
Message-ID: <a5c3c069-e111-407c-93ac-333ee9e8fac4@foss.st.com>
Date: Fri, 12 Sep 2025 18:46:07 +0200
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
 <20250904-master-v3-7-b42847884974@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250904-master-v3-7-b42847884974@foss.st.com>
X-Originating-IP: [10.252.28.204]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A6A:EE_|DB4PR10MB7446:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d83f24d-ba9f-4758-adca-08ddf21bdfba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OE40dkRxbVB0ZmJKaFRDNXZ4cnFkcUY2VEpCaitxaW1rYUtYS2ZhNmp5TUZT?=
 =?utf-8?B?ZnlLQmcwNGZXQXJOT2tYNmtZbEdkYml5VmZveHR1Q2dkVlpVR25pUVBXalhP?=
 =?utf-8?B?NklRd21IMTBncitCSXoyWmFNUGUvSEJiZmFybm5QMVcrWHJvakRlZllBWWVO?=
 =?utf-8?B?L2FyKy9WMW1YbGJScFVZTXJWcEhEZ2JseTFCdDJrWXhvL3ozMFVCcUVYZnJP?=
 =?utf-8?B?aTA1VlpNV1IxU0pYbVFuenF2WGVSZ3A2dldaSkFFc1p6VitlYnNVbGJUWk9y?=
 =?utf-8?B?Qmc0c1Z0b1puY2VYNjRXNUNTUjkwRXAyZDZ5RjV0YUtBOU1MdW9kcHlhMTNw?=
 =?utf-8?B?RFlUVDNTL01MdzdTYWl5Kyt5anlicitIUCszeTNnSWczcHN3RVFjcDlZWHlR?=
 =?utf-8?B?eDBISExaUks4a3pSc29RdHdYSFRnQWN0K1NTdmZQTCtHRllmMGV0UzhYWWVG?=
 =?utf-8?B?Vlc5M2hzUVYwbGFXVWdLdmMxczJXUDZwbUdUcHlLN3JXYmxCblQySkNKZkVl?=
 =?utf-8?B?a0QxamdxMUl4dVJpKzR6T0NSblJRRm5RcmRrb3RObVBpTGFrWXM1UWh3L09w?=
 =?utf-8?B?ajZLZ2gxRUpNYVBGTVB6RHdKYTZMRUo2U2NTSzFJb09VbHdQVlprQXhRMktu?=
 =?utf-8?B?UExsYUpQTFg2WnZ5VmxNQW43eGFOZW51ZW1OVXZDU0xJTjJwcHhaV2xYNVl5?=
 =?utf-8?B?UE9EREM2Ky9WTmFqNFYvS1E4ZzdKYjBlYVdEQ0UvYTZkVDdoUFF6cmNRSVVH?=
 =?utf-8?B?NTNzOEZtS0ZaNUsvSTBBYWVCbGNld2RMdTkzekJTT1pFa1FJOG4yOGtoTklG?=
 =?utf-8?B?aGdZWHc0MGJQeEpyUFlKOHA3YVBhcnBUTUt2RW1rYTNJa24ySG5tbkJTMnA3?=
 =?utf-8?B?TEdwZXNnWTBZa2t5NTlVRm1zUWIwdy9PRmxaZkNjVTNKTDRlcUgreHhtWGd2?=
 =?utf-8?B?eDZZRVJwZngxRWh2MUozdk5oL0xqbHVtZlo0NEx4SjFHYTlmRWw5bkVHaHd4?=
 =?utf-8?B?VVI1UVBMTW13OFdjOUU4cU56UWdVTVlkYUNTdTVkZG11aDdhcXhhVGZ4UjJ0?=
 =?utf-8?B?d29hdE1WNjNNR0ZZZHhySXZiZlp5Y3NCN1BUeHhrVEFWdUpIZWlXUmEzZUJZ?=
 =?utf-8?B?TkRSNU8wMDJvVXFrSU1vMXBFWXI5TEdOblcraU5nWngvSkhBd2s3ZC9USzN3?=
 =?utf-8?B?TTlZZ2tLN00vUGtTbUJLSFNzUjRTUTY5bUdYU0ZKbzJ6YUFNNVN0bnQ5UGhq?=
 =?utf-8?B?NjhqNU03WDhCTXplTHA2MEtLVWlHc25PaExqUXBsN2o1YitXMWVDKzl4Mk05?=
 =?utf-8?B?VWE1NVo1ZUhsWXFma0FkbXVEc3hRZTV2c2pMSktHajI5VjlwejAyQmpwZjIx?=
 =?utf-8?B?TjdZVGYyWjUzZVhQWVRJVzljTFcwS2RnSzZycnNvZm8yelRnUmpjaGJRelBv?=
 =?utf-8?B?MytiQ014eVlGS1hmamhQV09UV2x3d0xLcFdTZGFMNVlFTmRwaW5wZnFUL29n?=
 =?utf-8?B?b1hZZldHcms2ckVPcklxTmVWRllhbVZvc2hIT2FmSmNJbVdoZVFBWDRQVnZ4?=
 =?utf-8?B?bGlTZWxOSldlZ2ZnQTFhRy9mcWlSUUFFeVhEU0dISVFxMlN0NDRPUTFJdFlC?=
 =?utf-8?B?c0o4WnMwNHh0djRobzlvZGVlRXNIYWNYaVZkT0pjMy9uMzM2S3paTWhmZ1Ey?=
 =?utf-8?B?NEIwZTNtTFRQMXVNeHZONk8wbzZxdVYyejFudE1lNjFidW9XT2ZNZllxZzdh?=
 =?utf-8?B?dW8xQmRneFM2YlArYWs5ckRtZXU4TVVrSytUOVpTanUwMVdJZm9hVXU5a281?=
 =?utf-8?B?WjRUd1Z4QkFNOVE4OVlmT0thWis5QWRKbDVUbFdWdm5ZTGJUQ2I5SFUzQ2F0?=
 =?utf-8?B?aXZwN1BPckNyeFJEM2IvNVdyaXRBRVpYSWJWYVRzM0puakZFNjNHTGtqOUtG?=
 =?utf-8?B?ZWVqN2Q2MC9DY1cxTGdIOEh3NGFUL251bW9BeFVYc1I1SFlUbHVDTUx2OGc0?=
 =?utf-8?B?TGF5R0pBWCt0Q0lUVTgxS0IrbncxWllHbWE0TUFVcWFLREFIbjhpV2ZNYmhW?=
 =?utf-8?B?UHIwWlc0TVRqeWRwdjFHYmgzQW9WdW1QTUdlZz09?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(921020); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 16:46:08.7158 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d83f24d-ba9f-4758-adca-08ddf21bdfba
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A6A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB7446
X-Authority-Analysis: v=2.4 cv=OaqYDgTY c=1 sm=1 tr=0 ts=68c44e54 cx=c_pps
 a=+2dAZfvFPO64mleX3kfcpg==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=d2j-ISUXm-8A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=8b9GpE9nAAAA:8
 a=j-IYloMq0J3wxMA6e1IA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: enAhHj1S4dDm1olPPWJy9r77aLX5loKv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA3MDAwNiBTYWx0ZWRfX6GVxUCXOaVw8
 Ljh2/x+iwqRYtddifppNGfW2PLFPYfb5z8NM2ZPfKenSfVK72NZrfQlpBf59+HNjT/I8w7RyoD+
 zfdXsCShlX1P8errcteAKfSpkMHGIGfBZjGlp6rC7xpAQUHQhGhWSziM8IgT3Yh336/3aI9TBMW
 HFc3JoMmu7G+MCE12GX0ZyjGEcp3Lo/VvXPRLgtb+lLEiDxjjiiz2CuVN7LkzCVQ+HY7q5iKqc8
 E/csNxjCVadpEU/AYMOjpQr5uLckrpYqKsrbh4h03hx0wuCAC55KbPv5O6JPZKfrYN/M/2REqRy
 /ZyBFqn7HbHs8LeqGq2zVD0pzkex7KUx0E72othTbXvEFwmzWmRxAOtwcQGkuYCrnYgPLQi7Xij
 Rcl3tQPv
X-Proofpoint-GUID: enAhHj1S4dDm1olPPWJy9r77aLX5loKv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_06,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 clxscore=1015
 suspectscore=0 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509070006
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH v3 7/7] configs: stm32mp25: enable LVDS
	display support
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
> Compile VIDEO_STM32 and VIDEO_STM32_LVDS by default.
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Reviewed-by: Yannick Fertre <yannick.fertre@foss.st.com>
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>  configs/stm32mp25_defconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/configs/stm32mp25_defconfig b/configs/stm32mp25_defconfig
> index 2b02cd86d6134497151e398eb54230f08d4e6272..e84df4a2a8f52890376f7689b01d3dcab5079ed9 100644
> --- a/configs/stm32mp25_defconfig
> +++ b/configs/stm32mp25_defconfig
> @@ -78,6 +78,9 @@ CONFIG_SERIAL_RX_BUFFER=y
>  CONFIG_SPI=y
>  CONFIG_DM_SPI=y
>  # CONFIG_OPTEE_TA_AVB is not set
> +CONFIG_VIDEO=y
> +CONFIG_VIDEO_STM32=y
> +CONFIG_VIDEO_STM32_LVDS=y
>  CONFIG_WDT=y
>  CONFIG_WDT_STM32MP=y
>  CONFIG_WDT_ARM_SMC=y
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Tahnks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
