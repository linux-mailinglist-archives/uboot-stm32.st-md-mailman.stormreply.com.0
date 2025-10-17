Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4CDBE8908
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Oct 2025 14:19:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9DCE0C59788;
	Fri, 17 Oct 2025 12:19:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8CD4DC36B10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Oct 2025 12:19:29 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HBLqjE001324;
 Fri, 17 Oct 2025 14:19:27 +0200
Received: from am0pr02cu008.outbound.protection.outlook.com
 (mail-westeuropeazon11013069.outbound.protection.outlook.com [52.101.72.69])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49qfe6pudr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Oct 2025 14:19:27 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JxkHsSSgDnrSTNzbAFlmljEBUKso8BPg7n30PQ+dRZUkZ0YbWQdj2b6K64vTLFiWMHg5JTenN6MlPA3IXGCD9h/48BhLgbr1FZgjz0ZnJRMe1OwGJKEJ2EIqCAzsRH2dH2ExTYwBqNK2oJIhMSPyNcRPOA+sWoxzO/u46XyJ+gxTWMfFTo1l+zEWaHY9SpfA2qsWwCI2/LcEfwI465Ys0jxqS101cNYsf9zFO2kMkQ1Sgdncf2edcb7Hu/8A35obmcF5mHBk9OG0tLlqSt4zW4L+MlSQiS9LiWqiwIGTmB99guSYLGHgGf6DrwvhpEqS1SRuJCRtuZMencDO/t889A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Lxe3/PA/MEXIAbbMP66lo5p6AVZUA9aklgq+MwW02c=;
 b=xR9NT4IZQTr+J00GjRa4baL1eqY3KXn4ZDV/ihD4QCQ3lIotJ49rxfjYDdYCtaLAimSXTrKRgjyYaBvmNjdldWLubZQOASZg++i7sU/thk/Gv35YZedqEM7Gk1OMxCp3j3x36WIM1xJpxbFZb/N4lfJvyctXWTFlusnOL5em1S9FRJYKXzuq8FAR1kWwkgl4na93HzOnOjxTlKQOoVw3QFsdx9uffw+0hZI2sqJ0suPKXB/Vt+SclC6adwr6UnElY05Gsnf5TPdXOBveHxMcYuQN5IG/xQPQi460JKXS+Yy3rT58/peeGH2QxOitZl2VqdLOiPlAGZPKf/i0VDhgXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.40) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Lxe3/PA/MEXIAbbMP66lo5p6AVZUA9aklgq+MwW02c=;
 b=DCFccROsardqcyzoPEvJessmcZyEZ2eXKRcnKrc3cBAtOl0hwcYumFmmvl9NAR1rNUBnr5JoSB208HxrDDXIyGc+2yYhNyxYIXHAUYpEOLeEBTa7EYBbA0FHXV30npMqxBjcMDpL2PHE6qvZzFKSq8vwKEiDvZ/h80cf7BwSlkKfk/q49Vx7F8Q1LZr7Sm4C3vlb1SMhuPdACT3IFGo6ySFIQPyx/ecnvOoAt1S5bmhAZir5S9spAcduhO694E4Hh8CicRsUP/bXIIt6uLj/fihGXsVrnvuJnIGT9gtCMpZHbv5ueZKlqE1eSGrbsQ6vTpcsawmEIP+qx8ol6I9FMg==
Received: from AM0PR07CA0017.eurprd07.prod.outlook.com (2603:10a6:208:ac::30)
 by VI1PR10MB3181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:13d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Fri, 17 Oct
 2025 12:19:25 +0000
Received: from AMS0EPF00000192.eurprd05.prod.outlook.com
 (2603:10a6:208:ac:cafe::28) by AM0PR07CA0017.outlook.office365.com
 (2603:10a6:208:ac::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7 via Frontend Transport; Fri,
 17 Oct 2025 12:19:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.40)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.40 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.40; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.40) by
 AMS0EPF00000192.mail.protection.outlook.com (10.167.16.218) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Fri, 17 Oct 2025 12:19:24 +0000
Received: from EQNDAG1NODE4.st.com (10.75.129.133) by smtpO365.st.com
 (10.250.44.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 17 Oct
 2025 14:19:10 +0200
Received: from localhost (10.252.15.38) by EQNDAG1NODE4.st.com (10.75.129.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 17 Oct
 2025 14:19:00 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 17 Oct 2025 14:18:38 +0200
Message-ID: <20251017121852.109561-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017121852.109561-1-patrice.chotard@foss.st.com>
References: <20251017121852.109561-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.15.38]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000192:EE_|VI1PR10MB3181:EE_
X-MS-Office365-Filtering-Correlation-Id: 95430ba9-5226-4e59-44ad-08de0d776903
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FaiLUIkup4AP05Oh2lGQxGhf6rsugFev96ZEgf6RQRfwxciRjoBusAWuX9AY?=
 =?us-ascii?Q?5sdvMe0UnVEBdGn8Ur8Zfb8EaoJVM5FxcDifnf8l43zcAi/Aj/Q+oh/W0CBv?=
 =?us-ascii?Q?b0ztv28kz6466RzDYj8J1KGw5CmkdSCBh5b+Qf8cIGd9B1dG20gFcCH+NZL0?=
 =?us-ascii?Q?pZU4Tlt2FGHO7Bj8Og0afhWRo+YJPpwOcsrTXDYDZOphq7RX4GVcGrc+pR1P?=
 =?us-ascii?Q?nwKa/KOc+HzcKh3ybV4nZhoESTZkWcTXl2kss+7VS19XlrWfDRCn/e9OSexQ?=
 =?us-ascii?Q?8H6RGjNaSOx3lXwvW7iqmtiTg8n7LYZCGPMukVxb1eZTCSXUKGmufR72jBZE?=
 =?us-ascii?Q?h/awV2QDEpfuC7fOm9yPq9jNRfbZ+ldqsMAfveGfKnHAzrIReeKiE3Zy1/h3?=
 =?us-ascii?Q?iiX5IjAfBpdF+TcUVvUiCCb4R8CbyUy1/gatNyHgAuOv4KV8/n0aPxHEQnmG?=
 =?us-ascii?Q?6GLnbtz4C5YCnuiRO2JgNfdp19ly3XRgzxbTT84Y5aZ48p1XR14mlekHO3RC?=
 =?us-ascii?Q?iaSqX2LUejtY8QZE1vNF9kXB4+6Cn8e8PNCMXBjDmu5q/G/x/k1J8Wihxaaa?=
 =?us-ascii?Q?D3NsCB6EC7zaAgawvBRrzLYuCGIpW/PJYzyJxbXFgOg0BMWt3tl9a8WN7b9N?=
 =?us-ascii?Q?49LKT5knKfku92C14gfgj/JF3EceoANo86eHuJSd+Jc6PwT6HeDkh1xmwcMj?=
 =?us-ascii?Q?EFZ4pyy1i2EksWMfrWH8ca05+0bh/4AeThnM22RnRMrdh3Ue7Jsf/Eod4a+q?=
 =?us-ascii?Q?cgYF2nLWacGVtbvyBSUpZu7kNIx+XJyDE7R5iVY5H6UkSC/wTApndT73yLjq?=
 =?us-ascii?Q?q59o0xdNmPJ/+OZUnYyc0aF+zNKySNNeGh9OVln9f15v8TwFQe/956NxXdPC?=
 =?us-ascii?Q?gV5bjDirFlsL3ZqTnCvs/XhPEqSK8CKVEi2NXwTJHZ1ZweYIihEdpvoFPDTI?=
 =?us-ascii?Q?ySrDIJo+QXchnoPxYbaFahQqa7xE12tEWfrH3rb8AeGcOio+1m5t0kOfBFqb?=
 =?us-ascii?Q?0/mnKoFWlR+dRrxxFo2VHIHc7RmBi3VVejl/tfObevjiFxeFG0xjk/88TwA1?=
 =?us-ascii?Q?/sLCyoKnuo2Zu4wXYV3GS19en7C6JEt7Em+QSWciTzfirxLcPWQuHsLtznhT?=
 =?us-ascii?Q?ZpqVDQEClSe3PA/H5XLqPzIKQVcxK+dGAsENWcn+WqYCCit6HlwhOwfD9QiH?=
 =?us-ascii?Q?EJyJhN038N4/9v9qwUa88EOJVkxah9er4L1aLR/1XW2nL/qcF2udSSY6PpFC?=
 =?us-ascii?Q?H75QWHK2mlpqdirwwSKo/Rw2XS4vCdyHM+vaHuQgQa34jb+QqsueUXF4UM1c?=
 =?us-ascii?Q?xoUt1VHPvdaSuwj9KZa/QN51BpZkPEp1iGQ22Ex7GxCuIbfKaVaxKeSWql2C?=
 =?us-ascii?Q?rDDPo5ec/uk9m41ZEtqNnWBTUQZgYxIKzvsm+DSIl5yNDMY8GD4gpJSI3HmM?=
 =?us-ascii?Q?75zxoHnhp0eaqpJsKWIEhENxypNO633BC5UIpbCkRihaMiYfbf6eLiquy4Wt?=
 =?us-ascii?Q?VL3aBCfaJ2sN27TezsPsDHdinjLXT5d40jgFbbwKgecZxXw37v3DQnuj0u+F?=
 =?us-ascii?Q?QskYFCYB4HsYWgzhq9k=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.40; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 12:19:24.6139 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95430ba9-5226-4e59-44ad-08de0d776903
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.40];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000192.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3181
X-Proofpoint-GUID: jt5qzPY0wJkf4F__UOfxmB2GRj8onYtT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX33MP716tHOmx
 RGAcdhvuEEw4IryGZQAjX1Qg0OnfbYhhvm3cISc9hfnMPrTw8dIFS4F8JzHviGW1w9POJnPwEXW
 k1oYzOq8CKWTu1I2P2+ixGopauwZtKiyyuH+CVwNSvx6gwLPmVg6zk53+sQPfbA4UbXhmk9y9Tw
 LGghPgkmRbyRx8v0j41chzf5kXakIZvV3lPkiC2L49Zkih4RDEy4ld0KPGIzi2tFqO1P/hCuGMP
 dMY0l7xCGESOzVEoPCdAMWfPc51a0SQvDVcdM0FehHI8sFPmyDkJqlEgNDp6zg/YZI/Ld8BPbVm
 cYtfiVPsScoJt+ftPWW+JAAgeM86f94IfRPk2Sz9NrdJg/+byecCZvSsRK5yggtr82u13+rB15V
 FMgzLAXRMAL2B8GAFUGbXyYM+PUPyg==
X-Authority-Analysis: v=2.4 cv=NfvrFmD4 c=1 sm=1 tr=0 ts=68f2344f cx=c_pps
 a=dwgRFLcwxHSDGV+VcNTmBg==:117 a=HHWmdgNZ66UcX3Fjl3KRHg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=gt-GhcMM7esA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=F0oja7UUsIr4e2ROzjEA:9 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: jt5qzPY0wJkf4F__UOfxmB2GRj8onYtT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0
 phishscore=0 adultscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH 1/5] ARM: dts: Add stm32mp257f-dk-u-boot.dtsi
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

Add U-Boot support for stm32mp257f-dk board.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/dts/stm32mp257f-dk-u-boot.dtsi | 26 +++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 arch/arm/dts/stm32mp257f-dk-u-boot.dtsi

diff --git a/arch/arm/dts/stm32mp257f-dk-u-boot.dtsi b/arch/arm/dts/stm32mp257f-dk-u-boot.dtsi
new file mode 100644
index 00000000000..fe3fe9c5166
--- /dev/null
+++ b/arch/arm/dts/stm32mp257f-dk-u-boot.dtsi
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
+/*
+ * Copyright (C) STMicroelectronics 2025 - All Rights Reserved
+ */
+
+#include "stm32mp25-u-boot.dtsi"
+
+/ {
+	config {
+		u-boot,mmc-env-partition = "u-boot-env";
+	};
+};
+
+&usart2 {
+	bootph-all;
+};
+
+&usart2_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
