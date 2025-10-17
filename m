Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C50BABE8902
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Oct 2025 14:19:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8398BC59790;
	Fri, 17 Oct 2025 12:19:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A8DBC59790
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Oct 2025 12:19:11 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HCAvKR015873;
 Fri, 17 Oct 2025 14:19:09 +0200
Received: from mrwpr03cu001.outbound.protection.outlook.com
 (mail-francesouthazon11011013.outbound.protection.outlook.com
 [40.107.130.13])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49rynhyy4d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Oct 2025 14:19:09 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gaxv97cPYsZaj/bGknG8lFxqKZu7uWazz0z2shPsuD1c9mXu9GgR4VyBr384iDLEa9qemViNTqscAZ4L79hVPADnCcIPyFePcC6MYQb7cgU5IaCDd7hAM1CxPqmQRG9Ic/02Au46sy/v3xnYEymOVdUMgwh1MGY7kGkk2eB+QyDp4jUPqBljOq7JmoT7UqXUDcNjnKG0pza9srYF9DuZ2LfynTW72A6Tf48ktmMRB4DYbEsP87JSNDLdoxw3yKTswx/GGuK5ea9PUiKfSQMQbe/Vi+7Fv1LtfYlRqlCrG39TprAIX6u94l6PjSB+q5yqRHGQEcsDeCn48SgsDow/ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=moTkvJCJPZhKZ4JPJUzhFsGX/zdgp8iI9OC7sYk9YZs=;
 b=d1dC9Z8Md4eNqeWXjxD9XNRvKlc+xwiVZMpxC3tDKcUC2gtok/W77zxnScPC8/Rf3vgFrVxv9/tlCRE7fjw8kKvuQ1wZRFgooapEB/11o8Wmvy9apbMW8gv/Sghq/U8cJS///OdA234vR5Q8N21vmTO9wvokB6MGk7557vlLTjk+1Lcn3XBc2FlGv6PUtvQ9ve9HZDU0bZXuF24p2KH7URPVkX1GbB/hB+bPJK0qn1K6E4zJn+3rc0V9wHfbOKos/BJ+ZJm2XEHWqL8A3R46sT6DS4jfEw/Ig2bal3zYikejUf8GOMH3+jm28AMYH94cnlSe3je+GvTvyUxz8qgdVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.40) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=moTkvJCJPZhKZ4JPJUzhFsGX/zdgp8iI9OC7sYk9YZs=;
 b=gpy85bkkFJxTF/mNObP1YlB0d/O2gG8UbhdlP9c2yoK+BgkjGrPsp5WZlqn6UaNRkF0qznj9Cv4nYUVV4VbgxozeC8P/sziQgmLen0mZpVkEz9qKWsHxUypFKOfF5RIPlf4odbC76rEtBtKaX4itAXP/8BH3k80gw7JVmkc6pf2/qyoLQPmZwChKoShrkPUplchDjcTofKM+DWaPXtMy1XdoB07KlWat6pOmyNxmZjcy5DuFvvrrTGOj9gsdfeEZ7odhyGpEi4twmdbr4Ci28s2bZTSCdCvD85OrXe3mD79JYqtLx5aX71ouOBnglWXpi6qh67yilP+ebtka/d3CrA==
Received: from AS4P192CA0010.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5da::17)
 by AS8PR10MB7158.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:61e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 12:19:07 +0000
Received: from AMS0EPF00000195.eurprd05.prod.outlook.com
 (2603:10a6:20b:5da:cafe::11) by AS4P192CA0010.outlook.office365.com
 (2603:10a6:20b:5da::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.13 via Frontend Transport; Fri,
 17 Oct 2025 12:19:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.40)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.40 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.40; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.40) by
 AMS0EPF00000195.mail.protection.outlook.com (10.167.16.215) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Fri, 17 Oct 2025 12:19:06 +0000
Received: from EQNDAG1NODE4.st.com (10.75.129.133) by smtpO365.st.com
 (10.250.44.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 17 Oct
 2025 14:19:12 +0200
Received: from localhost (10.252.15.38) by EQNDAG1NODE4.st.com (10.75.129.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 17 Oct
 2025 14:19:02 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 17 Oct 2025 14:18:40 +0200
Message-ID: <20251017121852.109561-4-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017121852.109561-1-patrice.chotard@foss.st.com>
References: <20251017121852.109561-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.15.38]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000195:EE_|AS8PR10MB7158:EE_
X-MS-Office365-Filtering-Correlation-Id: 96d9f2ce-18c2-4d61-a268-08de0d775e7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5FGXn/51D1Y033n+AEjmFAgnmOek1RgoDnM6+0gENUkAwYEWWmzCvBdQJr8b?=
 =?us-ascii?Q?MnBx1RydRGKjVlsvw+dsZmadaOp8ecQFi/TNXe3XaF7DYuPkmYv4e4sQvcgD?=
 =?us-ascii?Q?2RkMlf8o7Mxbm/zOAMuWldz2EQC9Zyz6qMYO3NkXF68E7QVmxC1tyKVH6XSX?=
 =?us-ascii?Q?rHAX9JLOy8cBCNBIB1v7ZdrP+2ETm2vVU0cXyUUsx40Skan9e2Ith+5u53QK?=
 =?us-ascii?Q?UWzxs/hVGz5iOLEa7qRpVrZRPeeaQEc2cyglpq7bI4ClLsGY6xSr5OJQkWWr?=
 =?us-ascii?Q?QXeeWKn8o0JKLsgeckuo7bhD3d0ISipLUMT7J8Ipni8hk6EkQuQLV3dc1BPG?=
 =?us-ascii?Q?IFh3vyqSoecwmMb29Jr1GtIkWZes4CQMLZVC9xFFmhCcOLhmaaDLPosUXNoR?=
 =?us-ascii?Q?aXuo6Gg5p+TxnkqMG4Opkg6+IOKNnjllr2qYNySV3CUd2eEPWaLhU7pRFOGe?=
 =?us-ascii?Q?Q4QC4PeFIwPXETFasCfMyxqP+xUEfPoCq/HLr7ddh6sR3Zdvs6f/jbHIEdQh?=
 =?us-ascii?Q?mBL43dg9yzHh/G8tDXr1NSoPCkCOyK2tQ7B5PYYj246CA+xMON2hk392kNfQ?=
 =?us-ascii?Q?ir1A+DKDqAh+TS4nxtmGXTi5161r43Jho44xLHnVwPApFiAe3syfnGGb+2xw?=
 =?us-ascii?Q?9Kr6YVyVzma89hCPKq+iJMCQ4WYiuwF73P9Us4S8LNs8HMVlB0UcVPVBkbhA?=
 =?us-ascii?Q?QRc3oR48AeQPGGto3TQzNtcor16OljsOA6tj721Y4L/okRSbXrQNPME3OxuA?=
 =?us-ascii?Q?0dvfNizcH7JF6kLLdTmD6IG8zcZaMmjQ1+6EXTxO3ZzMPNUj/GlgcZIzaNJw?=
 =?us-ascii?Q?+/B/1vwOj/OvA0lxj1x+RFk/aXCPF2bw/9Gtt4Z25hAlq3yfIBRsdLEtXK6u?=
 =?us-ascii?Q?lENvJdOQ5TCmI4s77FAZRA1MBEQR3PTwfK4YC5QkVKeQW2VY35e+7Vjqghi2?=
 =?us-ascii?Q?cCftXTBkDg4FLA3uKR+dLfXm3Pmy4acZW0A47ztzutGZvFG795dnChigcAop?=
 =?us-ascii?Q?9bCD4DFhMNFo5m9bgxe/gyk0FtFNQo8lP4zB1aB0CHpB4gF7HrkXEELJiset?=
 =?us-ascii?Q?10Tnfqs7Afvh6Csho4Q4CQ58Y8g0+ghkiRmpWWHIpp35Ja4GCYMiCFHCYnVp?=
 =?us-ascii?Q?I+kEp2roJ/t5DwwbBlt+rWstdxEPtPMuwmAmZFc54CQY6iOdhVQZj8JsxO7y?=
 =?us-ascii?Q?+GitrbvqpMPzLdYpmCFtu0JIOxFs7PEQMbFCtG+AAj5zlzD3xFvSqPVlEdpU?=
 =?us-ascii?Q?b0v7gXsSC9aTJFY+y/BmK75Jx9BE7vkPx36HaW4lFOgS2SY4xWaUQZoVt+Ft?=
 =?us-ascii?Q?0egmhF8D+EF4za92dslU00dP4V8zzdSrhrcJ2Yc6U9qOlOPHxqr2KhvVS3Bu?=
 =?us-ascii?Q?2MmFeG2oAjLt/dZa8d3vfWOYSv6YDB+NphOU5EMpFi96U5wUjGXfVo+skIuV?=
 =?us-ascii?Q?K5kOkZc39B5ezEgJ2OuJ/SeZpz73avXkfkkmEiyP5tJGKNQORJIa9cvsZhRL?=
 =?us-ascii?Q?mysmmFQWiXT3f/v3tnKicmn+fmY6kCM3VH0OWK94ob9b0DTaMhk/bmi0lT8X?=
 =?us-ascii?Q?w34Pom6EmSS9Kmkq4Ro=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.40; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 12:19:06.9755 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96d9f2ce-18c2-4d61-a268-08de0d775e7f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.40];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000195.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7158
X-Proofpoint-GUID: NRy7kqq8rXEu0Y6UiEvC1CHK89TloziU
X-Proofpoint-ORIG-GUID: NRy7kqq8rXEu0Y6UiEvC1CHK89TloziU
X-Authority-Analysis: v=2.4 cv=TtPrRTXh c=1 sm=1 tr=0 ts=68f2343d cx=c_pps
 a=g4uZeTjY1y1IQa6Zs0r4CQ==:117 a=HHWmdgNZ66UcX3Fjl3KRHg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=gt-GhcMM7esA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=aimzZ1Xja1RZsTo6zB0A:9 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA0OCBTYWx0ZWRfXyUF4tAq8XDsL
 LSJtEXhphp90StIT84IiEciI+m1tHLczvFrLJUU8NfloZS6KWuCR1qBzRhqwUGHjsymLS1l3G+H
 cPQr6fKnQgYUjg/d2nDv19sqTTfktMRMQsrN0N/1KMErWUOh1gSOeUw+7v0A6tnxq9meIW+DnmO
 upH6lRgFPo0QbhXW9vavAWZssIu+7XKYJbSsMoKQ0i/Ez9fR31n1A4RYKlOXxxmwGTZQnscK5yW
 fkB4LqFngKw0vTOn46dMd74wo2kq84BP5cjpW8xjFAPOEMa8JNhlwAPF/RLnmbB++tqFz8QqKyd
 jA1hV8Vr2YgAG4e5NvEBJIPe3Dp54YxUM1qe1zwFahF0Ui61Mjh3Gd3TsIu4EyZZkgl/ADWVwki
 mhiAftlGjuCNLU6qcC8eN4IWW+jewg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510130048
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH 3/5] ARM: dts: Fix "arm,
	smc-id" value for stm32mp25-u-boot.dtsi
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

OP-TEE "arm,smc-id" is equal to 0xbc000000 but kernel DT has been
upstream with an incorrect value.
Fix it temporarily until kernel DT is fixed.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/dts/stm32mp25-u-boot.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/dts/stm32mp25-u-boot.dtsi b/arch/arm/dts/stm32mp25-u-boot.dtsi
index d9aeeb6d510..ee82a0289e2 100644
--- a/arch/arm/dts/stm32mp25-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp25-u-boot.dtsi
@@ -39,6 +39,11 @@
 	soc@0 {
 		bootph-all;
 	};
+
+	/* temporary until kernel DT update */
+	watchdog {
+		arm,smc-id = <0xbc000000>;
+	};
 };
 
 &bsec {
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
