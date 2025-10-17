Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C507BE8A4A
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Oct 2025 14:48:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D33CDC5978E;
	Fri, 17 Oct 2025 12:48:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3121AC5978D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Oct 2025 12:48:04 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HCWXbd020988;
 Fri, 17 Oct 2025 14:48:01 +0200
Received: from gvxpr05cu001.outbound.protection.outlook.com
 (mail-swedencentralazon11013020.outbound.protection.outlook.com
 [52.101.83.20])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49rynj02ph-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Oct 2025 14:48:01 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HWJZKUN/JKSGbsQfVXol9SjbwpNw13NUKwdOc5EKZAJoHweqKPMK0yipkehKI2LWnBMUlPrW0q/NXZVI7Irkz3eS0wyg1lW+Iax3xtCNFMEJMkypZysvaUpJFCmh+ux19rnkVMLuRdvm9cTebA39hy1bocgRhS1jjmGLGg73uX3FsKdMIizWa9t8aQFod4xy1J9JCXWXfMuL5Hm4PrrQwSYkN37T38ZNNOt5zZND8ZyqUREqghPagCK6E/YIaHaO6MloSL/Bz7R2FrXPuX+gu86PwH9NJFcrh6N3BG6ee2a0QbdiK9L533U3yrxUqL/YK79hKN9QPJezgiUUGYEPLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OX0LAG+iUf5T6rDzC6+zwNU957FloAnHfD8JB7sRvsw=;
 b=m7x84p6PyO0+CfM33FvXksIzE5Jji7OQe83kTs8OqmPEcyL+hcO4vXF8TZCccQOv6WqM7u4qbV0JEXxNkPeS0Ypajkt0M27M9ijKHtwcaMu6GTAFzHvts5sqbipavmZaNrECYWZCUs3J5zNP+YtB0JQrOYfhuiGD9mMYMBMp4Ks4ka7zoOoTQcE6AgiuuT6xPCwgzGSYAsjUrUQ+ba1gfMPBBFZE0e7+gaj2XONU3aBlgljDAEcFDvZW0S7plBd2xOOgtkCFMpM2U3uB/4qX76VlGbbDPViEVuFp/CWvAXHlUomcX15iPibz3VM7ZVqRLE3YRWgJjmqKrJ43jmNclQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.41) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OX0LAG+iUf5T6rDzC6+zwNU957FloAnHfD8JB7sRvsw=;
 b=TiMlKfNVIztXu5qrf0HBGQeTmneE65hvw+s2YsMqm+DxzD7bhwFnvLtiBHldRDoUa+YSkRzgre2sSVp9JfIBanGaGHr2emJ6oqX7H1lxfSEV21GgBATD09VVzVaK+5iyVbcRG+QyLmDcgnnHP3QenTtNlS8ZK3hUY7M8AEhSxYsaC/rw0vXhD5TNkL39ljv/qg5MXCmqSwHu+Cig9OC3uS+3Qy3ypfgEdHigENp8tqEOHzQ21duOeuw0vpqSJed7Amar2OWeATHgU/Q+Qc9+sge37VHuVEiRX8Vi6yE0eChji0CighLkN1NLMde6J3G6f7k/YljW8/BdyPJPF0TEZg==
Received: from DU7P191CA0019.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::33)
 by AS4PR10MB6112.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:584::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Fri, 17 Oct
 2025 12:47:59 +0000
Received: from DU6PEPF00009523.eurprd02.prod.outlook.com
 (2603:10a6:10:54e:cafe::6d) by DU7P191CA0019.outlook.office365.com
 (2603:10a6:10:54e::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.11 via Frontend Transport; Fri,
 17 Oct 2025 12:47:59 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.41)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.41 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.41; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.41) by
 DU6PEPF00009523.mail.protection.outlook.com (10.167.8.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Fri, 17 Oct 2025 12:47:58 +0000
Received: from EQNDAG1NODE4.st.com (10.75.129.133) by smtpO365.st.com
 (10.250.44.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 17 Oct
 2025 14:50:45 +0200
Received: from localhost (10.252.15.38) by EQNDAG1NODE4.st.com (10.75.129.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 17 Oct
 2025 14:47:31 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 17 Oct 2025 14:47:21 +0200
Message-ID: <20251017124727.165192-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017124727.165192-1-patrice.chotard@foss.st.com>
References: <20251017124727.165192-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.15.38]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009523:EE_|AS4PR10MB6112:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c5e05a1-da4d-409d-95d4-08de0d7b66c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?d4BHRC1Vg4L6y5DU1lYZkniflHH2jK04RJwfMoOqu+y6Z4Ri6H5Iyv/4wT07?=
 =?us-ascii?Q?pzkF0NoiWV5idVsrxDbE4q/vyCTJBM7WtFY130jTZ+n/WAxgaccbAEDouTmN?=
 =?us-ascii?Q?GwWEO+Buqa1I+hOnBv5uP1SEV3rxAsjPY509pIhUyBKF/fgMnK5CypJIOZEc?=
 =?us-ascii?Q?WJo751QMjrja1DTHARNQFVZZ4g0TPYtZkLr/baN7M3isD9STx86IVWG5VtpK?=
 =?us-ascii?Q?I12w9b8mrV41AfQVop2WNZF//O4Xxnh/qpgVUblWhCReioyOMrEV9P+NRMbA?=
 =?us-ascii?Q?d+KyMLR9Xh9NyvK/eRsrXNJN7ovonqsymEeYOiUJkLgmq1G32Jip/Fz5vbo3?=
 =?us-ascii?Q?gSrCAGuEi4U3/ycpWpsN7JWzFrRxyvmYjjvgmH8P5tL/234uhPDXbjZD7VnJ?=
 =?us-ascii?Q?bZOFqzLdyGnm6kkoPohx+K63X4NvdRfdF0R2uay2Pa1KnPx/JQBldTib2A5m?=
 =?us-ascii?Q?p2q5hGM6IVUFlE7kWMfppReomNiMyGyn1VWRL20Sf29XBddXH/FluA9y1f8v?=
 =?us-ascii?Q?wC0IqUBxIsylU9X3U6q7Gq663bgK8WSicNvoRcuJwxT1JtUx8AswHz1qSn+M?=
 =?us-ascii?Q?RVeG9C8/uyjwifHQmjU2is7MnrN/w2PWCqzEI/3GX9yB7FUm66whmazR2jZK?=
 =?us-ascii?Q?goM57j5Gdry4Ja/uU4R3vJo3P3C4K0HF1SgCG4JnoNZCVCDIYuqv6iWAAkSL?=
 =?us-ascii?Q?0pyBg03xvD1tv/1CcI5snc++EX9cfCxHlLcd70WZzWV0Vp+8k3qtM0Ra9DgW?=
 =?us-ascii?Q?BeB2k8917F2RSIfpqBcSj7JuZ4uaBn1yNB6AU6WcTJ002/YioSQYIv8OFW1I?=
 =?us-ascii?Q?Pp/z4CEasebC7ZLTsMf9m7DjkW9wVjNppSMB89Jjw17kcUKP4UcRnJu00gxK?=
 =?us-ascii?Q?pR738kNjH6aSWZVjuldf9N8MGoFWRjz9fMJZaxU8BCATiScFWTjUWpApA8AE?=
 =?us-ascii?Q?TZL+p/ug82hZVlcvXM7Dzo3wkPEbQ7gP+JnN1ASBI7myh/7v3KCmajFMz1qj?=
 =?us-ascii?Q?X3sd6Ly7YV6wqbQul1s4dV9QSnqQYUtEvwfiF2E8HVEobfcGyLK1SUxaMBTv?=
 =?us-ascii?Q?RRN910BFraqnUrH5cGGO3pbDYTi1eBCwSOP1EZhwKvHR+5Qz2m4BnWKuFYf5?=
 =?us-ascii?Q?0G2YIZmZZHeD4GL5MBK8BmzPLp3LJsM+cVxuQB80tK4APUtbZusZlzJLd4uZ?=
 =?us-ascii?Q?niGd0/Ocui9jdVdfmX7mkNMfvzxfLFqGfk4BTHhs8LYV/sJFXKRDISm6SXaV?=
 =?us-ascii?Q?aSMLyKQ5oPE2T+M4246R8bNoksWgSfa6kLi08mPeLLcZrgopO9qFa6CpOWZX?=
 =?us-ascii?Q?MTQK1hCDBWRzVOrBUzDDTxcyO9q8VhMZy7wNF7itEB3zIY52M8OED9yWJMrX?=
 =?us-ascii?Q?UJ+n3U9W5jrdbvH5TeFUUI214us69YKcl383GtdozzmkwRUI36Iw4zRkm8k4?=
 =?us-ascii?Q?IQkXTSCeTpbnebCp/Ple5nnBJeTSCu/hTTsSCf9NdHZWe9oV9qzS0647sROS?=
 =?us-ascii?Q?ow6lvhJuF2/WepTJZczDrZJPyH8Itbb+UNyOEqiYSteGArKnfKERv6+cO5e1?=
 =?us-ascii?Q?uynlbTrNVY2o+QUmFGY=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.41; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 12:47:58.8601 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c5e05a1-da4d-409d-95d4-08de0d7b66c8
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.41];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009523.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB6112
X-Proofpoint-GUID: vsXRKdQ0G0PN1YgeIGS_eiRlnMEhKVvq
X-Proofpoint-ORIG-GUID: vsXRKdQ0G0PN1YgeIGS_eiRlnMEhKVvq
X-Authority-Analysis: v=2.4 cv=TtPrRTXh c=1 sm=1 tr=0 ts=68f23b01 cx=c_pps
 a=9MzlaqQDKhUPzQSGipCgpQ==:117 a=k+92ZC+kR50ztVuylSZIGA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=gt-GhcMM7esA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=8b9GpE9nAAAA:8 a=f2hD7jiOUhbjUgPHKRkA:9
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA0OCBTYWx0ZWRfXzJ7bzZ32z0W/
 u3ti5PL7A53ejfeDzoXJfvzsrOnyWB837jW3Cwe+U/tb5hmON+OPVXX2V+9HBf/PpgkUHAM4bUv
 97G7+P2k996cUNfMKdTXoAUzkyxTdg2bPsPtn6PqHyCXO4H22BvEbr4qejHEAPvLQ1bVa9AvzDT
 V6GSBHhR97oSZOEziOD3ag1lwnmFIQ7nKFqS9BS5x+o6I9T3L8rKhLuYBswWY81WUX5V2TKS9ZP
 +K1MaLXqYyeBfliTWLqYL1bD4VrGc7Cmdxbg+nn+pkCnoPsNvdPem6clpDoNkChaIK404kLNIGs
 uChWQ3Tfcfmy8CKoc39VqeK50qfk3mJwWepRcPF6J02JVvrvSmRA0d+w0g2oSzpL3N5WlLwqIgM
 S/s1nioLxsEXa7QgCZqFmUCHebLu3w==
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
Subject: [Uboot-stm32] [PATCH 2/2] ARM: dts: Remove u-boot,
	boot-led from stm32mp235f-dk-u-boot
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

Since commit 69542d06920b ("led: update LED boot/activity to new
property implementation"), "u-boot,led-boot" property is no more
supported, remove it.

It will be replace by /options/u-boot to configure LED device as
described here [1]. /options/u-boot will be added directly in kernel
device tree.

[1] https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/options/u-boot.yaml

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/dts/stm32mp235f-dk-u-boot.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/dts/stm32mp235f-dk-u-boot.dtsi b/arch/arm/dts/stm32mp235f-dk-u-boot.dtsi
index 84279c4712a..2b41bd29cca 100644
--- a/arch/arm/dts/stm32mp235f-dk-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp235f-dk-u-boot.dtsi
@@ -7,7 +7,6 @@
 
 / {
 	config {
-		u-boot,boot-led = "led-blue";
 		u-boot,mmc-env-partition = "u-boot-env";
 	};
 
-- 
2.43.0

base-commit: f6b80515465bf054eca80f90b383b2e13f979055
branch: upstream_remove_obsolete_LED_property_from_stm32mp2_boards
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
