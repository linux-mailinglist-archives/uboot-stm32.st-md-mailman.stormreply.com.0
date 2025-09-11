Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A1AB52964
	for <lists+uboot-stm32@lfdr.de>; Thu, 11 Sep 2025 09:00:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7BE6EC3089E;
	Thu, 11 Sep 2025 07:00:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EBE99C32EBF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Sep 2025 07:00:01 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B6kp2i031685;
 Thu, 11 Sep 2025 08:59:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 bxHkzPwYDJZJ3gPQ0FfqCMsxBSrciUAO1WOEIEYAKMU=; b=LIp82P5+LKm678bH
 2qMxZOs+yx1gwBcUe2uP/h171NaRbl0WcsdGSsXyRlGPWXfMwwAPxeCrRgXIzc5c
 ocYKRq0U1J2ZmzVl183bOMJhkYrp7lgYYiYSsAC84Y0e6+4UzdzBwXD/P0NlWdTD
 68pp0D4w+C+7pLX2WHLiHPkglaFuZ1Qkgy6VcXy1hHsqAK03WJyYvKHHFp3ih+/3
 4Q2a6AX92BqesSwQ6WVmwvkh9dZdhdogN3BYTINMzU9xEKnq6wm+cuAPDt/XZQ7O
 YNTUFLTz8kJLOWi6Qwi2aDTEpId7ojB7Dfsh2a49IvjGdpwbkfKmeJEyOK+SAD0l
 A7KWnQ==
Received: from am0pr02cu008.outbound.protection.outlook.com
 (mail-westeuropeazon11013019.outbound.protection.outlook.com [52.101.72.19])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 492fr9hxw2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Sep 2025 08:59:59 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u13f9n02pK48Vh9sGsD6H5IT/lF6gwTVGHKZrxjjtMTdDXRIccVkZ9dumrmD0n0HSGBqwhSTbLgQtHXtwA9Q4Xw2xn3bMyx7r2+beKAFgb8HlCloTCTGKZONfUnVZxNjKjFN3/tM1HJ5Fhc6hMB94VWksNOxttJBQAwdUI02F2wCRwr5LvBaTCvxpD8mDPHIRdZP4RZL4mXw82JCynGT8bisQ5N84Qahq7XUhrpzFvBkFkHBtttjnl0Ui3bUoQF9e2Fqu2RU8uZsOe7nvTEbvf+oycPazeWF0lHqbpliabzQu0LlatHON7PQbFSPtcJTildoNU7Imgr/rd/2futbFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bxHkzPwYDJZJ3gPQ0FfqCMsxBSrciUAO1WOEIEYAKMU=;
 b=H2KGTgUaA28RTgCHsh7ffMuIiKT/J4NAvsOtYx3FwNqgiUma93N60zhEa+cXEUcTHosI2YO97EZ/bd7FtEcExkmCW6FGzzn8iHs9ETx5ELiqIvpHG70VeQleNhrIiF1sRUnj2/suQvMdF/VOwMLMQsog9tLRWWOBPzYs1fcP5q3xTKtsaf/afmqsYqvWR5UpL4uyWTi3orK3DrDD16x+8LHuQcSOmSt5gLJbAW2YgcyUdErTzZA7YA3xXgTXBNrn2jS+h5AF4uXCVA2k3GXCRcmQlJZ4jm4prnKaBGpaxJ/hu82aSg80lFUdzkITQu7VP28S9YVxgIZZK/NgFUYSSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stmicroelectronics.onmicrosoft.com;
 s=selector2-stmicroelectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bxHkzPwYDJZJ3gPQ0FfqCMsxBSrciUAO1WOEIEYAKMU=;
 b=MnOtqA/5jnIZUNG9zYuA757gytaHDqDf11RPZ/50wSWcPnkjRgAymOGquazJNMTcoKyd2u01WVSdCy02xLcMhv9IvZ+QdLbDBl62A5VLYsYo+SF91G8KKI4IMMYJK8Rzs18Y5aUlDg3GCrclLnDUliDlRIBomJG0FJUI88GDNJo=
Received: from DU7P191CA0023.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::14)
 by AM0PR10MB3268.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:184::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 06:59:57 +0000
Received: from DU2PEPF00028D10.eurprd03.prod.outlook.com
 (2603:10a6:10:54e:cafe::36) by DU7P191CA0023.outlook.office365.com
 (2603:10a6:10:54e::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.17 via Frontend Transport; Thu,
 11 Sep 2025 06:59:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 DU2PEPF00028D10.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Thu, 11 Sep 2025 06:59:57 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 11 Sep
 2025 08:52:48 +0200
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 11 Sep
 2025 08:59:56 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 11 Sep 2025 08:59:44 +0200
Message-ID: <20250911065944.15020-6-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250911065944.15020-1-patrice.chotard@foss.st.com>
References: <20250911065944.15020-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D10:EE_|AM0PR10MB3268:EE_
X-MS-Office365-Filtering-Correlation-Id: dd387346-4970-497c-afda-08ddf100d18c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Q4j1u8Y6ZWh2XP2th6H4GB8P5ukNvyhwTlgQT6LJa1h/hsL+D1+jI999B+3f?=
 =?us-ascii?Q?xNcDYVUG799FC3CFc1NQiRLKU6udtmUfTMHFNJC9ndO563oSmp/Eexr5cD6m?=
 =?us-ascii?Q?g5ZZxaihf3bPB+1Qs/kvpx+rOtkoGEMBPSKeUfo4sAm8783ECLg90MwQ5HoB?=
 =?us-ascii?Q?b/NKwnefsdbdUtZwv6DtDRkiA2bQydjRU/VNvcS4Qc6IunztWBcoxP06nF5K?=
 =?us-ascii?Q?MeZq0FcQOipHLpnNHvUe9RxnGQ/C9/z9WAO9Bgeos9WTlZoWubK75Ea3zIJ2?=
 =?us-ascii?Q?Yzvr6S4iC0wgRcpSTVuDaUcx9a4eSNXhe9CsbxoA335y1a3ckX3kG8db1H3j?=
 =?us-ascii?Q?r9xNW1/NEul8S/HL4GWZ6K9AScZ+HEDng+HQXFA+AkCdwJOno/jJjGRTS1Ui?=
 =?us-ascii?Q?rsCk1D6zQFSJMQIrksqvVpQjgUag8TACGEFPOLKZPegOaicOM6ALsGOM58za?=
 =?us-ascii?Q?zXSpJUkeokmw5LaN940VyrywHh9RrLtbwqM6CjUghb5z80PoNsi9pclBSW07?=
 =?us-ascii?Q?IYceL5IOS3JKC2IUN7c+E36uQo0V2lXjKhXgqN1k5jVSR0yk8NKuYBfxJYB5?=
 =?us-ascii?Q?mmfmqdImSZ9q196AKGAaTVJxFtzHBY/2xpJR2jRzrGRh2b3pVKHWa9X8dg91?=
 =?us-ascii?Q?acEqyenE007vV/udVM27k36rfk4dMRVI2oEH/H1NUdG1LEuTNDDgr+BdWle4?=
 =?us-ascii?Q?MEs0Y0Fp8C9XkrnwSuA4nf035iNJBy0C7i+JwxD7C8GwRxNcLNT94146hdSm?=
 =?us-ascii?Q?RUZpfDsHvaZS9jww0Z9h5I+lhDIaCMP0udLPW7rGMYG4TAcErsaHKWGgg/t+?=
 =?us-ascii?Q?EuHfOJCLVYYLQObSpDZsd8PWfV6wmDHjv0uH6OJ6nZxAD5QtREGdw2YFrH2H?=
 =?us-ascii?Q?XenrWa2flsZTGopC58t21P2K1Icu8x759JYuRQAup3soDhOBe090aPKNrm86?=
 =?us-ascii?Q?cZ7fc+PWcMY3Y+5D5kE5qnW5X1VrqLiQl/ZKXoLI81tGRjIDpt3upbTCXzWI?=
 =?us-ascii?Q?68BDqP83uNtsb8nSqYjrrQtDEQOGB+fbCvqrzVRL2ff6JYqQ8S1A/y6zCnFS?=
 =?us-ascii?Q?74EUvqWX8Sg2cSQ9Kkrf77oFva0pallw2GvBNs7ad9O9Mn3O48FyrE7ZLb74?=
 =?us-ascii?Q?cxLhUKf4IHK5hi1GnzqZ+InjwGtOEgCkvnV2wS+juUdFmnNzoo6PVvAqDL7r?=
 =?us-ascii?Q?AWCnhp94jPtHiaqGGqUA6/tF8n3uzmDT+Srzw9MRYZ66z11TdtWGfWGedfwH?=
 =?us-ascii?Q?IA9oGYTnnHHlY9rk8BHC8kb4ITN+VQmw8k5rjVvmMK2u4OvxCYbZXTkY+lz4?=
 =?us-ascii?Q?M3jiJn34INGb/8qcAL7ZXL5UlZCPZOcFAuljFJnbBd9Kp7fW0wsLFmlZhnTm?=
 =?us-ascii?Q?sdr5p3o/viAkUxIYTJiRjY+iZinbw7odsZ/oHi/IoEVuSKhXTl/EcZnx273x?=
 =?us-ascii?Q?eLufqc7REtr++H5XrxslwTUacQxRB9L7HTnb/iXDRoQBxLt9Ra6l7af/bSy2?=
 =?us-ascii?Q?msufUfbPoA1EeprOGno6oYcEzX0UyPBlJSwA?=
X-Forefront-Antispam-Report: CIP:164.130.1.44; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 06:59:57.3154 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd387346-4970-497c-afda-08ddf100d18c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.44];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D10.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3268
X-Proofpoint-ORIG-GUID: jO88ZOmANnJtTvZDp4OhW3nSdXYulVga
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA5MDA3MCBTYWx0ZWRfXwvzmyC32glbG
 zLbqrLo5qJfOCm3/iKuZHfRWw7vGTG4Jf5jDGdyFYVngMb3OzGuhblB8YIqgURMvECvGKSRA9YA
 0vCYTG/O8M8PRrtBOYkFMIr36+I4lqD5jcpHMUL1+P7ACBBtubo4PgP1IzuWqOJXMj4J+ZYobjN
 so690+VIlLNjd/yj6stYNfTzl0jaC1OQiiIThMN9Z3KYx0vpJpUZ9xAGZx4qxU3OYPv8NEXjQ/o
 DxYgpHJ7b53RkLopi2VOTW9K8iV+wtQ0141nefYdE0Ova97uH2+e0zeVzWnntJDijK8bfoCOi4y
 g1V9JYZUyapvqT1Z6NL2ysDaiyqNV745YTApnrzxPNgC6w65jKVKgWE4wzbVKo909QWnB+nhnnv
 cITHwOTd
X-Authority-Analysis: v=2.4 cv=We8Ma1hX c=1 sm=1 tr=0 ts=68c2736f cx=c_pps
 a=b34rGa2u8TJJgWhfRn38lQ==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=SAHXIHsbQyQA:10 a=yJojWOMRYYMA:10
 a=s63m1ICgrNkA:10 a=FUbXzq8tPBIA:10 a=8b9GpE9nAAAA:8 a=VjCSJzAjspVFO7ew5iUA:9
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: jO88ZOmANnJtTvZDp4OhW3nSdXYulVga
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 spamscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 impostorscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509090070
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH v2 5/5] ARM: dts: Add flash0 partitions for
	stm32mp257f-ev1-u-boot
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

Add flash0 partitions for stm32mp257f-ev1-u-boot.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

---

Changes in v2:
  - Collected reviewed-by from Patrick

 arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi | 41 ++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi b/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi
index 9a566e18d3f..7bbb3e00351 100644
--- a/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi
@@ -12,6 +12,47 @@
 	};
 };
 
+&flash0 {
+	partitions {
+		compatible = "fixed-partitions";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		partition@0 {
+			label = "fsbla1";
+			reg = <0x00000000 0x00040000>;
+		};
+		partition@40000 {
+			label = "fsbla2";
+			reg = <0x00040000 0x00040000>;
+		};
+		partition@80000 {
+			label = "metadata1";
+			reg = <0x00080000 0x00040000>;
+		};
+		partition@C0000 {
+			label = "metadata2";
+			reg = <0x000C0000 0x00040000>;
+		};
+		partition@100000 {
+			label = "fip-a";
+			reg = <0x00100000 0x00400000>;
+		};
+		partition@500000 {
+			label = "fip-b";
+			reg = <0x00500000 0x00400000>;
+		};
+		partition@900000 {
+			label = "u-boot-env";
+			reg = <0x00900000 0x00080000>;
+		};
+		partition@980000 {
+			label = "nor-user";
+			reg = <0x00980000 0x03680000>;
+		};
+	};
+};
+
 &usart2 {
 	bootph-all;
 };
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
