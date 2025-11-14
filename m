Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B97C6C5E32E
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Nov 2025 17:24:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77BB9C62D55;
	Fri, 14 Nov 2025 16:24:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 411AAC628DC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 16:24:44 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEGL8dj2674675; Fri, 14 Nov 2025 17:24:41 +0100
Received: from mrwpr03cu001.outbound.protection.outlook.com
 (mail-francesouthazon11011051.outbound.protection.outlook.com
 [40.107.130.51])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7pbvr6-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 17:24:40 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VnOoK0qCFDrd9E9BWtERzWyxA6VfU86POpVrCuQhP2HRQkr/YF+vQFPjiV4XNkClQjo5uYk518WrDh97vVQaHbzCnyLu5RiRFlMMysdh0KHw28+Bjsn8/8+BbDaeJbeniV6HlU3tTWv1rNkSHK55+0snFePZ8OlkI0rEiKZ0dSnJHAcQYSPCXnyCXVnIDjrTvOUvylgfhOYi7eiFg4H0CY+CW/ArA8LnhLUDHrfk1ElItYZcUDHFNHZi2mNRhils42KQ4C6OljiB3Bn3ttL8ihgQcQmAvLn8GLbgURAm5E/Vqoxxiz+RmjrERwvipvg/O2EmFBOPqQJqSAuADmsyww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bOWRJyxRncNLWIHW5NOr8bgkISexpSZm2LNEl5iBIZk=;
 b=ia1w+wiyYtHLpesmIiggEVJkO8vI1LSv0jyhwNNC0O5S23P4lVfYl5+CLF2ZhEiJQeCvXkUFxVvkAxjTyBoIPPd/7zCp6sXfeg3TslMm7H9dy5M9CjjRSsiF1V/Y+BYzK8J+zibaVlRekLxB9eVtLiDWRo/STBW2gU93Xckb+JAqgAQZaiOLMMpeefCGsTn8QIbFWyg2mCHq3mdd4Sw/2TqMD+w6ayP27wLHUkIYQ/D7UBuL8bG7r4qwg3GC4yFqGR2wZfpBRzvL2IQXYz7pYRFPc4tYXGuH+zDU+McpktbkU/z3y8o69rVlZ3s7ExAqxckldX+rZbd5ChjqjYrVrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bOWRJyxRncNLWIHW5NOr8bgkISexpSZm2LNEl5iBIZk=;
 b=fDJ0vQlk2UPAtUaIth+NEUa7IGasTjByBMxIJrAnsyypICEKyowuKLLzsx5YsLumCiE4QsxNE9Ts0JyDm0d/G1Gp25T8dZrATZGHEPFV/elU8M9S4cS1xuuTzW21KE5Gua1Uc5GFkPI7wRkfDnISHlNjg39ImUpGrqE0bNDq96S45QvJF/tm19labsh+aqoP6UJE9QHdhndrmWyTZo3wfJOdbVRETJ0vd+yddpocJHFQaLahtJ9ZoxZiBcN3DmI2hPAJvCZhxthGZh4WROzYlnx6Bec2fWVLj8cKwlDLGJHNXhXRVZHM64ttPMqEUcCeGlviBWK7Vm0hx+lwkkJf9w==
Received: from DU7PR01CA0008.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::29) by DU0PR10MB6365.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:40f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 16:24:37 +0000
Received: from DB5PEPF00014B89.eurprd02.prod.outlook.com
 (2603:10a6:10:50f:cafe::b1) by DU7PR01CA0008.outlook.office365.com
 (2603:10a6:10:50f::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Fri,
 14 Nov 2025 16:24:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B89.mail.protection.outlook.com (10.167.8.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 16:24:37 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:24:47 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:24:36 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 14 Nov 2025 17:23:52 +0100
Message-ID: <20251114162417.4054006-19-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B89:EE_|DU0PR10MB6365:EE_
X-MS-Office365-Filtering-Correlation-Id: 167a01e5-c833-494f-c38d-08de239a4def
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?C1anzHP8cwyiUAQkzKleP+z7Kz3OnCXwL371Tou9Q79ypZ3NYJ54bg5mcsvW?=
 =?us-ascii?Q?hKVaTemqK7VA6gM5WJuSaCn0Zfhm5Fj3sJzKzvPEatoJ9tpVqR/jBbKoo1HI?=
 =?us-ascii?Q?OOS7DQES8OtD0FLb0u1N514tZ0Kbd0MTTiwH06mK6ImoEhpULb/FyLSrXSq9?=
 =?us-ascii?Q?UH/yYu/Aq3TjR0KTSNctnunQc/1kpdHW3Cmxz3VnWD5oqU7bgiQb7XCbEb56?=
 =?us-ascii?Q?yA/3pPp+0dU0cC8pqfvRKQV2fFiP+ugYfyr0agsm2FZEwt7MKsRI/I5XgmcX?=
 =?us-ascii?Q?o1Jizhziq0H3sF/5K42GDPsmKqf4ABDyltIAO/FNmlHYaTqWKovl3qRN10nW?=
 =?us-ascii?Q?RlqVkLka4ujnLibL7FzJd0OMHqa69caxZFFcb213gh2CuklOtjQqaDBhEGzL?=
 =?us-ascii?Q?eZ7C8JdfWohnzEBJruQNAOSMtSSpnj0qjC7DqYUb40Lwqixr2nCUy3Tec5KX?=
 =?us-ascii?Q?YcNz9LkpyMe+lywTB+KPdA2tWX7HuiDQScth/oZ6o+mllzPIWaj7SKsZguYE?=
 =?us-ascii?Q?KLDqTYmCym8UYRIXqCyv287N5fetz5oR9WIji0V62i1IWQcraMf2EVMphI1l?=
 =?us-ascii?Q?OiiO+hA1vRlNQTToewPPqcLyQe/cW90C3RQfi9Q36UhIFE0Cz1BU0H1b68L0?=
 =?us-ascii?Q?QUOnJ+oXLlIpd8uZ5VKHaCQVoDWvasLui+fj3ViF72io5lAU1lNPw59FbN9G?=
 =?us-ascii?Q?lP+Y8eMv+ELhFqIWKPW9rSPS2CPMjWTxIers56AI0bOzm4M9fp2WHBxCRbNT?=
 =?us-ascii?Q?wagQVLlb6xLBIUMavdR3CZTmtkRZF12GTAav6aR+zsquupjKnPSjDUHdqrsq?=
 =?us-ascii?Q?ZBRplXp7dzwm5+Qxs/QxRuhWER7RMGhNuvJCmrrIRUBncTAlgBi+BH0VsM3D?=
 =?us-ascii?Q?G+luAwQ3t9Xqr0UVf9WLjt1iRolI56SKytPUOvqoak79xQbZsO8vuqUWu/tn?=
 =?us-ascii?Q?RV1B8StgF70Nz146v+HsHY26MfNr9U8Kvxffy8U35dLIQaPkzTlrX2OfdZTW?=
 =?us-ascii?Q?BSrxCpmjxL662MX3C7GfYfV4BHmq1+Lvvzrpa1vspvZp20gA1O1wjTe/VBX5?=
 =?us-ascii?Q?vbVZEJk4uULgaBk7HCdf7vtegkt0BE4s4nan7D20TrmU3gkCtNB/RvzbRMJz?=
 =?us-ascii?Q?+/tLe/QEDg5ZCY/4eYcUguI++aXsA3QfsySBPITlh+9Xgschu90lLV/C3tve?=
 =?us-ascii?Q?l70jTUlawyn/FvPHLoOJXhSrs7I2mc4kV4PKzb/vREeRhUtyvtjZDNm4QEGk?=
 =?us-ascii?Q?0SDlArEfmTewrM0Sy2+fDFmg+szVB65/l0keP9RxRioAHdF0lceEOPm+W84q?=
 =?us-ascii?Q?5bKreiaEaBaFuVKibjoXXZggOJuWI/7BmtkFxk3oSFSY+k7fv7B5gtKGFDQg?=
 =?us-ascii?Q?a3tPvB8ypWpGTxysc0KzTdS9jbvOOe9gV9c0tev8sEqrBCl2OqU6wsNTyEMe?=
 =?us-ascii?Q?5h/LeCepKgrqr+MCLw8WO6ExyxK0OGYl0fZvgI5vroMNWxkbBm7y6nrOAV+u?=
 =?us-ascii?Q?d+RV6O4IzEqNfNy6vt4EjxvyrTh+Jj3r06pBG4RHK2FmSmvfmT2BmR+ge15s?=
 =?us-ascii?Q?MTwNKgRiVN0lMUtVkFk=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:24:37.1500 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 167a01e5-c833-494f-c38d-08de239a4def
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B89.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6365
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEzMiBTYWx0ZWRfXzBVJsA7jMqCX
 Jc7n8gkJ2QwmrlMJiXZh5xY/AZDpGFdFCi5u8pwaNrkiiSU8MoIr7lups11kB39XQ8ExlbEy4ro
 un7zB2i1m0XFlEKVf8uOkF4J3UMjfPxgXXlVnfF87UFczysj/e4i8n3H21WyT1xhf6xnPWZjHQg
 hJJT5VNaxR2HdPIqMeqZ8Gam2W/hzSn7964RdXPbHTVfAZFiVR6Nho/2jTQI+JY3gYcqPYIjvJo
 u+PEJLfk4Za9hZugMWiR84EQvklasbGlabOUOERMVsZp9XQ2XihctNoQOoKmr1meR1veOs+RX/1
 iMyI4HFPcsHuzOTZBxakFhUmWlO1CyNFC7B40hPr6+Ap3kK1cWBNO/oTbYiRq6m4G3M1Q7kzfZd
 a2LbG9q1bwlxk+O5HayMWARkDPBVxg==
X-Authority-Analysis: v=2.4 cv=avi/yCZV c=1 sm=1 tr=0 ts=691757c9 cx=c_pps
 a=uRsYDtkwyFtJ6rLCjo9XtQ==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=6UeiqGixMTsA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=8b9GpE9nAAAA:8 a=mvoSdUjkIZBQ-6Oyg3kA:9
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: jjZgfhozgMokGI9r4TddI_XA4bI_R3fF
X-Proofpoint-GUID: jjZgfhozgMokGI9r4TddI_XA4bI_R3fF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140132
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Peng Fan <peng.fan@nxp.com>, Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH 18/23] ARM: dts: stm32: Drop "u-boot-led" and
	"error-led" from stm32mp157a-dk1-scmi-u-boot
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

Remove obsolete properties "u-boot, u-boot-led" and "u-boot,error-led"
from stm32mp157a-dk1-scmi-u-boot.dtsi.

Remove led-red node which is now available in kernel DT.
See kernel series: https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=1022570

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/dts/stm32mp157a-dk1-scmi-u-boot.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/dts/stm32mp157a-dk1-scmi-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-scmi-u-boot.dtsi
index b8e4b4ea6a8..76023cb198a 100644
--- a/arch/arm/dts/stm32mp157a-dk1-scmi-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157a-dk1-scmi-u-boot.dtsi
@@ -13,8 +13,6 @@
 	};
 
 	config {
-		u-boot,boot-led = "led-blue";
-		u-boot,error-led = "led-red";
 		u-boot,mmc-env-partition = "u-boot-env";
 		st,adc_usb_pd = <&adc1 18>, <&adc1 19>;
 	};
@@ -39,10 +37,6 @@
 		led-blue {
 			/delete-property/label;
 		};
-
-		led-red {
-			gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
-		};
 	};
 };
 
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
