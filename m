Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90542C5DF38
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Nov 2025 16:44:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 251E1C628DA;
	Fri, 14 Nov 2025 15:44:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8747C628D9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 15:44:30 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEFT4bd2547447; Fri, 14 Nov 2025 16:44:09 +0100
Received: from db3pr0202cu003.outbound.protection.outlook.com
 (mail-northeuropeazon11010001.outbound.protection.outlook.com [52.101.84.1])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7k3rs1-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 16:44:09 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=icEMw90dTOFIa5+5u3q72E9BD1aMZDt1haO5W6gVsuHAbK93F8DXwtSTo0OYIqPQCnNjzZ75RBKJk6dJgW6+MkO7vbSNq+ZCkMcRnH6dQZdFmj68h2n3gp+vjivPwr7OnBh60RiqrN/McbWKndb237BMnUyTXgJOR1vZ0BmgjiDZl3j9cSpnunvJpAutZFYd5g5tDoUtQNJ84FUK/sUR+nTIx0KZbMTKgDOVWqmlSeW0+DS9XOssAY1NY7qKCWBi0Mu0KtBdsq2qZp9CpLisY/MAvDnGoMqMCpet/EEUbj+H9R2bLYPkn9FhoqVudhVzGX5U0gBuRn/QhgWbs2VJVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdDQhEfk+U3YszKAkKLWhk6qj0l2MZb8BcPPrmEMTLk=;
 b=UVU5KzlghHhUcvZnLhtnELL/DyqA1bwRAOyWSPHqPeRf63NSCKYm6ZMtwDFDb16DUYkQBtvsI1i71vBXIERVJwE832nPgC2dSErfvRvjToKLGWKm56DgZeihoeuIyz7D1iiESd+4zgvn3oZn84eCvgVIwru5r8T2sSnfPJA3Sx076Nl62PWGDWl3HJOZxyjovapxrwozauiFSubdVWVxo48CavIP1w6XjlFAS8f+hdWWXoRt8vAK62N7SeRTmcz/q4mgXqzr9BZ3yAlhLv5USFMdeNMNJOPQe20MlDvfC5D+HRT4SFCrPftdRyiLlyhsQIdTpllmt6L13pudyfAZLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdDQhEfk+U3YszKAkKLWhk6qj0l2MZb8BcPPrmEMTLk=;
 b=G+rKZ/EaEgQEuTM91MNZXjXgSy1Q45yK3hVtM2Wp89ZEEXLl6h7/p8VhaNKtoFxST5n5piaJhUj0OjNLfxuXHxs8e3DMlxsPnK4NeIBSVBZmGiu2/D0zpELkuj7htq6Ee3MSyvZG16V+173TUvfYoEkK2s4SieQuPQZpsIPdil+DV2CHuEK+7q/RL0bbZxJ95EG/45QMHBV0xjho6YyOYv6ay5myCVuqmI7cGa7bHOTDkWQOQqCPCYzS5Ulb7CYqhIuoc+ONGbRdK6JPtIStmnaAdwj4dkUKHlcvgsPkF9X/OTF3sgSn4bxV+PV/WtQ372kmbRuhT1dal/yAj53vxg==
Received: from DU7P189CA0021.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::17)
 by AS8PR10MB7523.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5ae::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 15:44:07 +0000
Received: from DU6PEPF0000B622.eurprd02.prod.outlook.com
 (2603:10a6:10:552:cafe::54) by DU7P189CA0021.outlook.office365.com
 (2603:10a6:10:552::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Fri,
 14 Nov 2025 15:44:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000B622.mail.protection.outlook.com (10.167.8.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 15:44:07 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:44:17 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:44:06 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 14 Nov 2025 16:41:49 +0100
Message-ID: <20251114154259.4035206-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114154259.4035206-1-patrice.chotard@foss.st.com>
References: <20251114154259.4035206-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B622:EE_|AS8PR10MB7523:EE_
X-MS-Office365-Filtering-Correlation-Id: 2055ecc9-3e6b-4586-c65a-08de2394a5ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|7416014|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XL75ojbamoOi8Yv9dekU4FQsUVGmJkRAMOKU/G49Bibsd99LjHOp9qoB1FfK?=
 =?us-ascii?Q?+ZHe4GdDFlid5SBeDIp8qqKGxtsZ4ePaUvAUZIcs94VKAwB5hZbp+on4rM+T?=
 =?us-ascii?Q?k9AG8HEtOmhAaWuQnwtpPdlFgWfwTzi2dnUI5X6YfgL8VfzhF66fltrEdkmq?=
 =?us-ascii?Q?EF3gxPIuR8Mxfk2nCZSRN/18mBr0+0JLy6yUIxS4iI1HgOnTjNgH8cDrNfyC?=
 =?us-ascii?Q?c/w9a2R1fft4wi1dOyWbOFbQZHbkp4/+YlKYcUQLLNuj4U0Ps8rvb0ZJPoi3?=
 =?us-ascii?Q?O2qx+LEUwZuUM1Xxnpq97VMBrVPe3wXFWGz1Z7HdLioK6D61y7bkqiAtTzGC?=
 =?us-ascii?Q?5DWIQ8gqgYANFy4qiOUqWTiGsa39nJAof5+vy1uvtKelT5C9K8HzJYFlYOMW?=
 =?us-ascii?Q?K9krhF0oeIdQuKx6OLHvNjLCQ2mG4vir6dIwFqI8p9VYDh4jcB31ZAz3jykI?=
 =?us-ascii?Q?dE/y/AZCjskOHn+rOU3xRaALqMCE8KvDJwpFphMPHDhiGMTN9eRe0WttmOkF?=
 =?us-ascii?Q?MmUxTVuEdbmGqRoorlaaz3cERQRRQ1Cdye+FxqJAg9brpuridy4A1FBavYgu?=
 =?us-ascii?Q?EzSfnxX4NVzmmncjOcRuOV0vraNpMFEjhRormWr57wvPCXaVczjDS55lABZL?=
 =?us-ascii?Q?l0H+BbJMlu3NKxeiu93+E5XAXPloMnezoN/IJjF36dnH+4XnN70ika+Ohb2Z?=
 =?us-ascii?Q?+yA/WOLsheS1ex0aKOa0O7BsKXRzU+LYLxF3fcPgy3oSFohjUdmwwFKN3Haw?=
 =?us-ascii?Q?wfPccdBdTYkWETxzBafB4VG1GKY48dXbVFs8PzrXUbW24p82PkrevVaWWcOO?=
 =?us-ascii?Q?2j6etwdCzVqAGZJkN5PZZzfSEt8oWNJN1dn29cX+UcrLNOl4+sSrxDspsRU0?=
 =?us-ascii?Q?2hJ7+vXfkfGyJmjdfEmHcN0W28H0rOCoS0l9FCMyy6wxR3J/usFCJy6+Ca+P?=
 =?us-ascii?Q?cijkBVT+LciJp7uyYZQrAy7HaiXX0ZM45dfMj6t2xi7O2VcSxope6mk3p/q3?=
 =?us-ascii?Q?RH33EAyRZ3HF6MLgcj0LU/4T+qPxFPSybGBJRA/7XL0rBpycYrFgrPTGiVxW?=
 =?us-ascii?Q?uX05wt5gtM9O+1Pt8Jx9h++jYaON2U2Q1VktVPLuANxCAWlTlT1hMeAWaH89?=
 =?us-ascii?Q?S+s4h8BEoYvrXNbqt3e2iHPscLJIqqwQ6X+F8JOZ+cqgArdUOoGhMkIzpxVL?=
 =?us-ascii?Q?uKtD2iUmBWgGXvMU5Qc8NLMKloRQbt5oHL2qUEJIJtYkN3URj/IOOmiC6KdY?=
 =?us-ascii?Q?zxp8Y9pKhrCWyKtESzsCwbi0rQoNJIjwtYHpttRhVgOLd1iN+R+s9MSxCZ+D?=
 =?us-ascii?Q?pKgDiQ0UZ/PI2caNcJn/91n81k7QH/EdPdn8Al0Uwa2KvkCfIzDHjdi1PuQR?=
 =?us-ascii?Q?+ebY8nuUrfL4z/9uyZFwuBRDLpfWmQEj2jLCDPYKAYs29ayIhQ5qDhDjNT3T?=
 =?us-ascii?Q?sgcCWX0uznJJqlq7Iw2yEHUvd3E3U3TIAIQKfrfTwv39vJtWDEKC+NilEZw/?=
 =?us-ascii?Q?VmTfy9s3XtX0KsE5smqcXVTtf6KiXedtwn4c6KX/d7xd3xnvYgPZcXXHtxVw?=
 =?us-ascii?Q?pl6lNh7ugNRy+rOaOKs=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 15:44:07.3835 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2055ecc9-3e6b-4586-c65a-08de2394a5ad
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B622.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7523
X-Authority-Analysis: v=2.4 cv=KoBAGGWN c=1 sm=1 tr=0 ts=69174e49 cx=c_pps
 a=uHLzunLggTCXYgePTZImiQ==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=6UeiqGixMTsA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=8AirrxEcAAAA:8 a=b3CbU_ItAAAA:8 a=pGLkceISAAAA:8
 a=k-42gJp3AAAA:8 a=yC-0_ovQAAAA:8 a=PKYdX6cT0oTbK6WKNVIA:9
 a=T3LWEMljR5ZiDmsYVIUa:22 a=ST-jHhOKWsTCqRlWije3:22 a=Rv2g8BkzVjQTVhhssdqe:22
 a=uCSXFHLys93vLW5PjgO_:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEyNiBTYWx0ZWRfX64wVCbCwTBkL
 +A1uRGCk+jn2waK9Fe5vrmG5jWmPdrW85p2cxfu5p/V+O0gLHGGQoL3J5W+QIF3DueXhJ/cNba2
 lmSC4YjiwrjmXFpP/ndmjDi4sLn5lUHWb4n20yVWMEgrFje+AsaVmn7C7v6hx4lSWjs6APOgf24
 ChNnLanp+kx1JM6V+BdNT32v5UnQ54aHxniaJgxoQQUQ7lgTtW1vOSk/nitqY6Cg9HYh7HUNfuj
 pXLZQn/5yHQXjN7SoAbAWZvCRgH67P/kHuhZAQKWoJxLamML4F65wMHltC+bzaHrlOoYUkCar9h
 AlXGj+r7amW2hVvQwiqTBQyIllvv7qB1fa/JPsDO2jX0WSFU5u9Pth8ijo38ZGPelQtrdBAMddN
 jDKggA8UJilqVi1ikifVVNxZl6B1tg==
X-Proofpoint-ORIG-GUID: U0YKYbtgMGHJv3ifuSenC1Pdjfnm1OIw
X-Proofpoint-GUID: U0YKYbtgMGHJv3ifuSenC1Pdjfnm1OIw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 clxscore=1011 lowpriorityscore=0 malwarescore=0
 bulkscore=0 adultscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140126
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Valentin
 Caron <valentin.caron@foss.st.com>, Vinh Nguyen <vinh.nguyen.xz@renesas.com>,
 Alice Guo <alice.guo@nxp.com>, Kamlesh Gurudasani <kamlesh@ti.com>,
 Peng Fan <peng.fan@nxp.com>, Sean Anderson <seanga2@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 1/6] clk: scmi: Fix typo scmi_clk_get_attibute
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

%s/scmi_clk_get_attibute/scmi_clk_get_attribute/

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

Cc: Alice Guo <alice.guo@nxp.com>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Sean Anderson <seanga2@gmail.com>
Cc: Tom Rini <trini@konsulko.com>
Cc: Valentin Caron <valentin.caron@foss.st.com>
Cc: Vinh Nguyen <vinh.nguyen.xz@renesas.com>
Cc: u-boot@lists.denx.de
---

 drivers/clk/clk_scmi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk_scmi.c b/drivers/clk/clk_scmi.c
index 683ac822a01..f6132178205 100644
--- a/drivers/clk/clk_scmi.c
+++ b/drivers/clk/clk_scmi.c
@@ -87,8 +87,8 @@ static int scmi_clk_get_num_clock(struct udevice *dev, size_t *num_clocks)
 	return 0;
 }
 
-static int scmi_clk_get_attibute(struct udevice *dev, int clkid, char *name,
-				 u32 *attr)
+static int scmi_clk_get_attribute(struct udevice *dev, int clkid, char *name,
+				  u32 *attr)
 {
 	struct scmi_clock_priv *priv = dev_get_priv(dev);
 	struct scmi_clk_attribute_in in = {
@@ -183,8 +183,8 @@ static int scmi_clk_get_ctrl_flags(struct clk *clk, u32 *ctrl_flags)
 
 	if (!clkscmi->attrs_resolved) {
 		char name[SCMI_CLOCK_NAME_LENGTH_MAX];
-		ret = scmi_clk_get_attibute(dev, clk->id & CLK_ID_MSK,
-					    name, &attributes);
+		ret = scmi_clk_get_attribute(dev, clk->id & CLK_ID_MSK,
+					     name, &attributes);
 		if (ret)
 			return ret;
 
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
