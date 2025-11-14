Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C5AC5E19C
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Nov 2025 17:09:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68036C628DA;
	Fri, 14 Nov 2025 16:09:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15EE8C628D9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 16:09:33 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEG3pmA2611164; Fri, 14 Nov 2025 17:09:30 +0100
Received: from gvxpr05cu001.outbound.protection.outlook.com
 (mail-swedencentralazon11013055.outbound.protection.outlook.com
 [52.101.83.55])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7k3ujy-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 17:09:30 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EjPVTS6TPsNxQbSgSGOpjVJ/QLM+2qjkuW+50ECaw1IlM91dXyD8XncYXNhwZZXgCDAFzKWBZXlAODvi3BqOwZJQoSeBKUnPEnEdi1tU6ZQg0WVzHgToT8qfhJisOJVQE2Ho3tgf51B006JPwy5GDPUCfEVfMtGNKmJNnirhtUxJ7cIqlb3DKaym0NP/oLgFLrLPsRieCdvCfRLAg5wJuWuCbyQkygc8sAqp+lSVuDNGf5lrbrZozSMykj4RdAt20eB/35f7qLwd/m3QNBiQWZpwkeCdF9eTfPIKrl9T0D2Kllh4YuB2BwOrzT2BnmdoNSZymscaJmHFv0d6QxicWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c/RFsuDL5zxFpNjgGnv8Nghe581b9LBg1swZHiXgkGo=;
 b=ysCO3rR2kqSh9Uxz3C4X9vGAupLnzebxG/0uwZBXUyrppi9SgKKv9k8hKJLZWQU3ElLxFgsiYvIhZNAkRZ2jU6Lrnxq6wpxnhj72EqGwWKVP2zwcrYAgc+5nGj3vsZPb2qhnvYC0K6hUJ0/rOg1+sTnupPd+Ma1cIZ137LZM3trpK9sZiJhEyyzgcFovnOBxpSqVtRWQ/skUd8Fw5yz1RHeEoqdRQcKrMhCQ+yTSK4xYvL6efCBiZr5dEuh+6yUyxy5UxMcXWJdrCAixGY0E5FmTlVkLf3Kq+VBy4DyCvhJGuxghehEqqq4wz7L6Lx55JwgadnyHH3516yBpRAMVCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c/RFsuDL5zxFpNjgGnv8Nghe581b9LBg1swZHiXgkGo=;
 b=iKNvc+mbtXhllmb6hs4ZbAB5SSzRK5zOscfl5ei+YxFXhkAhlYCMBIEiumQky1x3uIbdh7ZH3A22AkcwmGU8s7BkljIbkjQHuXrkGBcHteI9riAO9nt3GUs1mxnTX+NME1C8DdHJseI7J8O1ue5dJbMH22WAMQ4j5j2z05vjYGPIIWYRcgFNJwuWUwKbsbFw2icXD/66DyFMIEB1dSPSTOR/XcJMAdNoqCjgUhSL5BnHLMY8lo2iWDZYomjkCHK0dhXZ+eJFeuOvbNm2omOArGbCv3qULjYZ4sXiTY9FxYOQrTAB+A7UNkKX0mFEiFRVvTeqSiNunbHXRlAZd/oi/g==
Received: from AM9P195CA0019.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::24)
 by AM7PR10MB3841.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:17e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 16:09:26 +0000
Received: from AM3PEPF00009BA0.eurprd04.prod.outlook.com
 (2603:10a6:20b:21f:cafe::f4) by AM9P195CA0019.outlook.office365.com
 (2603:10a6:20b:21f::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.16 via Frontend Transport; Fri,
 14 Nov 2025 16:09:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM3PEPF00009BA0.mail.protection.outlook.com (10.167.16.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 16:09:26 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:09:37 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:09:26 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 14 Nov 2025 17:08:54 +0100
Message-ID: <20251114160916.4051853-4-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114160916.4051853-1-patrice.chotard@foss.st.com>
References: <20251114160916.4051853-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009BA0:EE_|AM7PR10MB3841:EE_
X-MS-Office365-Filtering-Correlation-Id: 34ac41e4-e1e1-40d2-64b5-08de23982f40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Rd7sbtAd5Rm7m+23HwDmv6iwWJjA33FELf1vAWYZoXSPUIMWiiiFXGwshpNv?=
 =?us-ascii?Q?CowKS0Zy8OfZDv49L5N1RWX3YvLOyMw/Zd0BtaguJ3GLdEb93BzycgeEq6r9?=
 =?us-ascii?Q?oHAb3cIgwj6bRpCJrMD5wUZRUAgOEomGHXAUiogthVgLJuJP1XTN7Y3EKbcc?=
 =?us-ascii?Q?f1pq7cVLvVfdbXxADnvDdOUAjo5Tni9wGcHJ0iEf1qdcTTTiQYKKWf1OEZgD?=
 =?us-ascii?Q?adA+5QSs5kpcDlfMK7znGsN1APImcFfg3V0yktpnADH3X0TjCX0raL8vA4sh?=
 =?us-ascii?Q?6iORRjuUQpa6UWZSw1dzfu6D1T5kzAzLNOe1aw7c3s4Drx9jTD3Korc5xws6?=
 =?us-ascii?Q?DBFWb05EF54hTnVmmaWtSboRLsiV6bDq8JY+iEhlulTbbfplAJXFNgDeffK+?=
 =?us-ascii?Q?X/y9xjeUtQvqiN6DEupJ9gZ3HgYz9ny8ttt17HWWvHdz25Iqk1UfSjv1YdD4?=
 =?us-ascii?Q?yFmu/HW1yvmG1Vl9r8ts/CdFWTY2oWnm46fYn1xYbgJ3fctbaXFkhbRCXuyi?=
 =?us-ascii?Q?qnVN55y3c5MOe7yjVaTUOu3NOHdzN4oLHHVCogLfUmomit+C/XcneRWx8iXd?=
 =?us-ascii?Q?bNSoqwDWSSJd2fUqQntu0SWau4QItXbKv6IDjrXSo95EfBGRvKJCOzQHlRzx?=
 =?us-ascii?Q?EbW1119zfBt4kW7XwSXhi6bS5lyKCodqvK09KA+GBia4rPLPY3kuBKbp739P?=
 =?us-ascii?Q?I9Y4afwtVfz5id3sSDmQWfhph28Z2IgzT4tIgTn5oUvwIdBaCg0tLyt1Veyk?=
 =?us-ascii?Q?Wu5jbmBAgaIUaKXLvy67chQR8zHXgzYhorJVaa5biy3jTxGI5Zh1BP0aDj9H?=
 =?us-ascii?Q?5Xj9kwuJLnv86tPIoJunKWyiPR2cxbOahoSRYUqKw8rx3FuoKgKdzvRfnUDY?=
 =?us-ascii?Q?oH7sUkrwbqeKaYiUFTv7+4wTT5FUYiKeNSdHyjbjKGAf/sB20o+85rwvkwYx?=
 =?us-ascii?Q?8eOVn0LpDY29Rg5FalH8LTJ5RM/ti5jsOGH3H/whpEkWnHj/x9I00ZheVdfh?=
 =?us-ascii?Q?LUrOxTdDSQhCjY6IOIaEetoLQDhVjhP2oq9pBUyeTj6sAx9MDbUJiM2ppC7K?=
 =?us-ascii?Q?vzC/Zdz2+/buJ6SESXP7tegRqg/J872LEICtMl1qCOtFUNXtiED3NtgYsYxJ?=
 =?us-ascii?Q?vjgW2iJ3u1ptS3naUwgAGcv9oSiV7r7GgECNSpHsdzo1bV/R2F8Atih5a9we?=
 =?us-ascii?Q?3cfdhsRvCSsWH2E8FA6gQ/3GnjVmxqxPQUn7Qr6VIvo81/yogYWLk5QxxlMb?=
 =?us-ascii?Q?867uz5W+1jl3Tp2ebsSIiK76A7Lj6IodgEMumJihSsWUNKpyURKxhWA0Q3U6?=
 =?us-ascii?Q?QwnQwLE5PZNPgU4yeMtj2+icHU3obmPmU4bMgaNnxgOlVRDeUD42GqHNEmXN?=
 =?us-ascii?Q?txDzr5xrEtA4kRGWOo290DH4zyRlHR/Xi6j0Un6XIYD7t+GxjFdms1+k4c1O?=
 =?us-ascii?Q?db+CqP9+mZ3mOCwQLoadj9+3kC1KJkDgrAJoTXRmuJZvu7MLDRH6+WFdAjcI?=
 =?us-ascii?Q?lr2/BeRIBW53OAq9d9yBZBQObONSeKM/N3S1C3ZeSS16b9mKp+QAnHDxQvnb?=
 =?us-ascii?Q?JwlvpIvdbIMER1a3oAU=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:09:26.7210 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ac41e4-e1e1-40d2-64b5-08de23982f40
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009BA0.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3841
X-Authority-Analysis: v=2.4 cv=KoBAGGWN c=1 sm=1 tr=0 ts=6917543a cx=c_pps
 a=zoGqOg9degru9jiln/bpJA==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=6UeiqGixMTsA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=VMid92PyRKehKaLCeRoA:9 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEzMCBTYWx0ZWRfX+4x6/KTDBt7D
 BFoCOEuHodv46P8WQeFpTdjM2AHDlVQDoJcY3yEi3dPCqkzES2K7KW6cCMZPTO2wvFNOBCwp20Z
 clkl/TbHdbtCDtrGJEG5CgxlUMq7B0lFdI1dVHU4/WDSEr58ouDOZnP5gkDFnzWo8sKjnlYiGEi
 B5FkcLB7gzwkiRHhLAS7uCACgwAewpY3IBCFdWzd5RdIgWixvM5UAKP9P9yITbYJEPEtNLPmxGi
 9NgqcqMzw7SgHTNAInKe+8LudTUjKT1JgBlc8/51D3ry5LvEhVvn5QNubGjnw3Bko/i+4tzpOi0
 fbKQb7/zCdHnS89nzciVqUei8ehV6CpciYpdt3QOg86lZVP9Z+MPq3CAuE6jO5SDr1Qf45guF6j
 nrBzNpoWxJVLoSfHqxStfQX1oekMog==
X-Proofpoint-ORIG-GUID: KLjUCIXWXU9sEqk5x60daAoilGcz8_a1
X-Proofpoint-GUID: KLjUCIXWXU9sEqk5x60daAoilGcz8_a1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0
 bulkscore=0 adultscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140130
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH v2 3/3] ARM: dts: Add st,
	adc_usb_pd property for stm32mp135-dk-u-boot
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

Add st,adc_usb_pd property in /config node for stm32mp135-dk-u-boot.
This needed to check board USB power delivery.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

---

Changes in v2:
  - add Patrick's reviewed-by
  - Fix some struct declaration location

 arch/arm/dts/stm32mp135f-dk-u-boot.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/dts/stm32mp135f-dk-u-boot.dtsi b/arch/arm/dts/stm32mp135f-dk-u-boot.dtsi
index f004e9840a2..326a8f8736e 100644
--- a/arch/arm/dts/stm32mp135f-dk-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp135f-dk-u-boot.dtsi
@@ -14,6 +14,7 @@
 		u-boot,boot-led = "led-blue";
 		u-boot,error-led = "led-red";
 		u-boot,mmc-env-partition = "u-boot-env";
+		st,adc_usb_pd = <&adc1 6>, <&adc1 12>;
 	};
 
 	gpio-keys {
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
