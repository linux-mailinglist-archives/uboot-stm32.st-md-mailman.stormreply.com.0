Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 853ABC5DF37
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Nov 2025 16:44:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34EBBC628DC;
	Fri, 14 Nov 2025 15:44:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26ED2C628D9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 15:44:31 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEFfvOx2604238; Fri, 14 Nov 2025 16:44:14 +0100
Received: from am0pr02cu008.outbound.protection.outlook.com
 (mail-westeuropeazon11013021.outbound.protection.outlook.com [52.101.72.21])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7pbrjb-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 16:44:13 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DTLPhLtsyKkwlckEqS+CJLbiPJFdCLq3MilLu2HNHqVkOqcurz0zoLxsaQF1mxCOwVS7wMmMxTYwPj6YAqmFGtcZ5vM5AtlkklBpwtG0MGFik7EBbG9/6aw9nfaYbysg6WuAkJAqdkomAb3XDeeuSG6NffHq377eA+BohpP8CTEJe8+EH//pUw96DtTYuc1m+AMdoxKLI5Xivbm2a2oGAp51fGKgIrBd/AqmbWbwc4sDbiKYMisAgY7g35lqkDXIpxxnPuXcQBBLPkgBHEL04Kh/HsgrYGgkD4nSpTPf6qj9Wh49tut+vW4EYOAmMZfyFE/IRxRKPm9Cyf4n1yN3iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rSRD0Ef4DnF5YAKxt9XhXf1srkLQmwSvh4zvAinLuPk=;
 b=fDJpg+wmV+iKgwSnBJmFDXEOj/2ajvWA/V46DM5iqDxxmBg/WuCXpLuM90LqcVGv329orjiBHIELpcOTjnO+ikYJeW12Eb0GyRjOCPZ6hAOxBxle2RqPp6mhJ1tnoD3ICR0iM7AKbc0wI8jLfBNHkiR29jlAgX87iAoO2Ulq8bPNnTzX4ju9Kbv4zxd8yG1KDqfc8YwwtigDW2kktqYlUMjXWdbYHm2fVxWG74D+V6fAP3UMsfktahuL2vcZVLrHaiI4T7PSZTq3eIL9fKlz6uOmZSZPkL0aVgNQWebqlLnT5jon4TB8S8Y+M+670VJAup0C545XqxwMcv5EeEqPTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSRD0Ef4DnF5YAKxt9XhXf1srkLQmwSvh4zvAinLuPk=;
 b=opX4VZ06mdZB/YPrfJ/uK+iW4A+ZWIBjp4+MZnoSN4N/G85WqbJjMnOAEJ3I9vwYCRWibqhWcoO5UvzF2ZOJVQ8LzWl93PK4d8pgSXkGR0KpFoMxdwa2WODJjkob50mOWgmaKhLvGrtkLjYb/oKKZrGYfCwcf7OhyqOQNizU2c5F9vZ1YcHzo20xnWeZXQbq/4d7IkGrqu1K/a0ka9QlvwehrpLYLM+DZ8tgSwFNwCP7MBOLFwGf2omVlk4w+afG7weeuGAmpBtovZOgwk1oSStPp/0IRiDDaeTiD7Wp/r63Y407mtyZg52794gwZTXQW6mjddf013QbyKP2wpwEXg==
Received: from DUZPR01CA0009.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::16) by AM7PR10MB3973.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:135::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 15:44:11 +0000
Received: from DU6PEPF0000B61B.eurprd02.prod.outlook.com
 (2603:10a6:10:3c3:cafe::ea) by DUZPR01CA0009.outlook.office365.com
 (2603:10a6:10:3c3::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Fri,
 14 Nov 2025 15:44:09 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000B61B.mail.protection.outlook.com (10.167.8.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 15:44:09 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:44:19 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:44:08 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 14 Nov 2025 16:41:51 +0100
Message-ID: <20251114154259.4035206-4-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114154259.4035206-1-patrice.chotard@foss.st.com>
References: <20251114154259.4035206-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61B:EE_|AM7PR10MB3973:EE_
X-MS-Office365-Filtering-Correlation-Id: c483bf54-26c8-4764-f85b-08de2394a6ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OaOR8HKbBK3gR4pYXyv28Ltddl8gly3KqL8IgP1TBoCX8kUIxZrJrtwIYuXQ?=
 =?us-ascii?Q?Ta8jDnmfJrS+ifgBkjaV1mbQ4ftGVwVHN50CZI3MBTHv1fXWjeLFwlyF0tfs?=
 =?us-ascii?Q?PZhJtk9BjthkvjnWOmIyOIcBXUy/Ehd8kqG5X7N0K1SmupocpgHDzAv5SGEP?=
 =?us-ascii?Q?BkIYQ9ubsc+IiCZWTAzS4JlcNYCMx4wlWlttg+3qtp0iJpvqIdjeYygcIXPA?=
 =?us-ascii?Q?RTrUaj5zZQaOy0EUKNJrBlSpaT5VR7hoE005Sa0aYc95iERrHHNxEsMIfo88?=
 =?us-ascii?Q?CKBbuZgkXAwwkRpuV7L6thrcOiTqFx4u3z7ozA7l20xKN488ov3mUdcqGoSj?=
 =?us-ascii?Q?WLiI/yyclL4AnbxMBrBhowo58YK4UpGlJ1BXR7ytFNBEmhzTIb7t6736OR89?=
 =?us-ascii?Q?+R/tIxalH/W7B9/oZb/gKa/6Ha9rS3Au/fia9aRdykd+OY4mzL7kUMR62va9?=
 =?us-ascii?Q?1h7OCs3W+bBzy4fH/jeS7HW5uDsUFQrJc99F4OS3XIZjGwdZZ3zR7oYmBh8z?=
 =?us-ascii?Q?d3fQT/bd+PPARVDdP7kkCfcvpFQuJbGQzLxfB28JRBfqUC5RX2jGzUZdiR0I?=
 =?us-ascii?Q?Js91hdAA3CAfRhQyXFMjAGQLfqsKQdR02mcEL3j3UeuFC7yHEUh10bsqQosJ?=
 =?us-ascii?Q?u8ebqH7fjklFRhRvlSwUY+K6vA2YO2mZPYSNiLUIwifIYJLhnC41DVSrkTGP?=
 =?us-ascii?Q?5SJ4hyxRruhaUWDb4dZmINsezMLuviYRZtxzoIB3NKjoadK+AoCP8VRkE8Fi?=
 =?us-ascii?Q?A+rABvt1AAVvUGtMmEYSm8wo7crhtFmhh1DIlqHZ0U0MwiGbYkMjL1OnrFfh?=
 =?us-ascii?Q?hnPPkAbgc0EhYgTikrtukXevjLH/SBAvzn15+ni/+T/7Uxt5nmPnPd03qpRV?=
 =?us-ascii?Q?Y/U+CvoQ9HYqDiQ/C+qlnJLW0OySP1IBcx9fcZkrwjlIIcjCW2fLRhY8/Xvh?=
 =?us-ascii?Q?L1HwEUd6wZgpBIAmgbHBbbd5csmeXJia9sANgACal5mAyRB6mygHmCjfP1TT?=
 =?us-ascii?Q?6tJ/HbDwH7NbGgqQmf+EB06A5Vmf68UZZQ7hX5VelILyCtA+o43TJCTA1Tmc?=
 =?us-ascii?Q?D0z8vAL212z9QoXOi5mpwmi65FLtlpiOq8oa6yQuMVFnz39eqw/NC9KvjXIN?=
 =?us-ascii?Q?wu/X9p9w6phGtfEf946AWNwDYJBxTB4wOm2QkimWFsE0rCIeZ4Yu6Rkr1lN/?=
 =?us-ascii?Q?n+Y45QIB5U5Nns1I2Ob+QiRZIRoSgAOzvwPsL7h6OGx8dnA5/X4gKWubjZQU?=
 =?us-ascii?Q?XiYFQmLth0jmg2Y8/VyMRp6FRx5j4mj74k/+SpQT/0gGDVi8AtMFJtKc9eCn?=
 =?us-ascii?Q?E+alhZ0O5yVvyiwqrEBUYfZ4IJCpECKRBmBCxkC4RnZBmTSmGDwatKK9Acjk?=
 =?us-ascii?Q?nG6HlcwTQdP59EjLuSqbM+U3ofvbX0y1i9HGRLPepRWMxt4uP7HXcQ0MRu9b?=
 =?us-ascii?Q?F8RCkMgXM0qZQxqKKiPvPRF4smLcPaMfHZhiR3j76Tef/SzwfA8ShojbfZwS?=
 =?us-ascii?Q?AgaskY3jO/rZo4o6498YfJdqaR7FGYpJzPEGOj12NRHicWfad/WrFhVVB/7p?=
 =?us-ascii?Q?I7XZ5Ii7igT5FwTSpnU=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 15:44:09.1423 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c483bf54-26c8-4764-f85b-08de2394a6ba
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B61B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3973
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEyNiBTYWx0ZWRfX+OgbFhh8h/nM
 EU3aarxW+RqqgpIHiHmHzTdvYPjFU+iheAD5Vw3OGZt03W0LtNIN69VzyzDmCRXpTlTHyge5WAV
 P55OzhSBO7OToQxDmPNBtf9jHIBCPNwW05dDch8epi2O1R3cdCkE8hiImeZyt+QswEhL0eVco2q
 BTOD3F36J0jozFRg1G8Ue6s+3AtADn5cKKdwO97tb77C792e9Vc/LzKqJKD9ZCTm/6YFoVFaMEp
 7Y3GVpzxKJDw9PKynNW//b7oHR4ofYDDH9Fic7BDpq/ZprPNieyxgOOLfkTcvtP4AnHwudFux/+
 WI7VWMWOuTLcoIKfnX5jYhVtSAHjkMAXzqqeutmXTljIjlGJLSw3Hlo9qnITUj9MDTXPiraPOU+
 8eoL9dHUsKtHLOvfrSK3R0JHKYha/A==
X-Authority-Analysis: v=2.4 cv=avi/yCZV c=1 sm=1 tr=0 ts=69174e4d cx=c_pps
 a=K1AUQSF2aIVugb2SxCa98w==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=6UeiqGixMTsA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=8AirrxEcAAAA:8 a=b3CbU_ItAAAA:8 a=pGLkceISAAAA:8
 a=k-42gJp3AAAA:8 a=yC-0_ovQAAAA:8 a=0EoTHcCYSIrXaUwguacA:9
 a=T3LWEMljR5ZiDmsYVIUa:22 a=ST-jHhOKWsTCqRlWije3:22 a=Rv2g8BkzVjQTVhhssdqe:22
 a=uCSXFHLys93vLW5PjgO_:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: QcK_GZhmqEmbXEP0lu5wkN8I29g4fNeA
X-Proofpoint-GUID: QcK_GZhmqEmbXEP0lu5wkN8I29g4fNeA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140126
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Valentin
 Caron <valentin.caron@foss.st.com>, Vinh Nguyen <vinh.nguyen.xz@renesas.com>,
 Alice Guo <alice.guo@nxp.com>, Cheick Traore <cheick.traore@foss.st.com>,
 Peng Fan <peng.fan@nxp.com>, Sean Anderson <seanga2@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 3/6] configs: stm32mp13: Enable
	CLK_SCMI_FORCE_ATTRIBUTE
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

Enable CLK_SCMI_FORCE_ATTRIBUTE to register parent clock with their
real name during scmi_clk_probe().

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

 configs/stm32mp13_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
index 3283e910219..6979e3405e2 100644
--- a/configs/stm32mp13_defconfig
+++ b/configs/stm32mp13_defconfig
@@ -60,6 +60,7 @@ CONFIG_SYS_64BIT_LBA=y
 CONFIG_BUTTON=y
 CONFIG_BUTTON_GPIO=y
 CONFIG_CLK_SCMI=y
+CONFIG_CLK_SCMI_FORCE_ATTRIBUTE=y
 CONFIG_SET_DFU_ALT_INFO=y
 CONFIG_USB_FUNCTION_FASTBOOT=y
 CONFIG_FASTBOOT_BUF_ADDR=0xc0000000
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
