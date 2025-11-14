Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E30EFC5E336
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Nov 2025 17:24:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97F82C62D2D;
	Fri, 14 Nov 2025 16:24:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C79AC628D9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 16:24:44 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEGCs6k2661201; Fri, 14 Nov 2025 17:24:31 +0100
Received: from gvxpr05cu001.outbound.protection.outlook.com
 (mail-swedencentralazon11013032.outbound.protection.outlook.com
 [52.101.83.32])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7pbvqr-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 17:24:31 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TxK1ZOLCZh9VtXkAtGSd2rp+W5lSITUySrzBiNl0vRjtxgYx2EhqBLr6bWGyj1077VCjyTTqEqvwkmVqVYqmUYRi03eAkNDLgcZxJzQCTDNxIcr6M+OJSfI38MBgjc+mhUxYE0xAHVu/wWaWPPmXWx1Zv4V0S/8uNJ3IuI4aAOLUYaHkczjagGUcxTwQSyV9vYf/ea/LIqR9XckajrHuG+zBuFl0VeKXlQRjx2cfGlingV3lSKfCyziNYO87j1RS1+bvZH85V61VH60qd79atBh15vJ5ydEl0r4SYQvu/IbBtUOb0k+g0MxbI7KmRSwe865U2sh6T9/IyDFLBnbhnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2qT7RPlZHbpq+SeKGRgEATdl+nL/P9Oe8pY81luaAIQ=;
 b=ptZGcYTNLI3yGmoPc3Ew6Bq1mMaMiCneH3goxl9XpEb1/9RiqJwXHrBKj4e0xR7z7HFaZxjfCggEiCaW3U347fLNerNDl5XRcSLKxGS5oZfkJD/atD83pCSdkb/Qk7ae9oWJer2d8DNyMidouG4sqpuRojhvwIWePpjGQHqSe1eLvoGI7NRxnTh3NTsYyYgOKWetKJS6Hs0FGOVDMrmWlKqHXjUKeBG9vEoQqxHX2Caa6Kl/X+NQtwatn9PicxnMeLATlTTSo8j2WslkoVALdSRGcIxI6PCCWaZt7I1QgyFv4blTsJwW1p7hFXyRv2hx7xuYek+eQ3QEaDeluZXTsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2qT7RPlZHbpq+SeKGRgEATdl+nL/P9Oe8pY81luaAIQ=;
 b=nB7+wkh2Qx1Of18+Ix6kD0a9cjFrTQv8+bCVRlefaKe4b5N/x41Vuqls+86wuGYcS2CWyl+473RhHIvoETMKPwW0yg26zNHDgah3cq/nIxHfAIT+lgprB80FPNgmUiwwolLthDBZjFaY1cvUHbOYK35L5iBLZQh0I1pvH8xsxj4+8+VG+anO2YzZORuldfmI6Wj//ZZ+0qLF77BfcnpYNltzcu/59Dc9Srke39MBy1MxDnE0dcCMxpOyJf7b0Wq1Pt+PgYGl+ioyjJBicccdIsJY14ifFUN5tF4e+ympSpkofMHETsCiMQaUQS+q/MACcit6fiV0UdiQBOw4wIyFSg==
Received: from DU2PR04CA0081.eurprd04.prod.outlook.com (2603:10a6:10:232::26)
 by PA4PR10MB7962.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:270::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Fri, 14 Nov
 2025 16:24:28 +0000
Received: from DB5PEPF00014B8C.eurprd02.prod.outlook.com
 (2603:10a6:10:232:cafe::3f) by DU2PR04CA0081.outlook.office365.com
 (2603:10a6:10:232::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.16 via Frontend Transport; Fri,
 14 Nov 2025 16:24:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B8C.mail.protection.outlook.com (10.167.8.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 16:24:28 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:24:38 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:24:27 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 14 Nov 2025 17:23:42 +0100
Message-ID: <20251114162417.4054006-9-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8C:EE_|PA4PR10MB7962:EE_
X-MS-Office365-Filtering-Correlation-Id: bf5d0cdc-75ef-4a1f-e892-08de239a487f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IbGFUwPq3oV1AsYsLLU5/ur0YU0m7b62imrwh/FzqFnttbogqbTAoL7Iv3u7?=
 =?us-ascii?Q?5NcuHfzRigTDG2YIbtLDVcp/XkRVIqGlzFRe4gcjjCwUeSphxKRpXzr448SK?=
 =?us-ascii?Q?nd/2UzpqLc4di0rJ+2uUpR04TmRVx9Ertf4kDnEOIyNo0ruXLPn/65T1/F0T?=
 =?us-ascii?Q?V/l8WYh2guhJSYBHf5CjEpuTZ8E7QEpYPYelhsZ5ygKKtIUEgGoIvies9ktc?=
 =?us-ascii?Q?1pBG6sLHo41pS6wKKm9Wel4B5h2bx+eVLsG4/h+bDc9MjXYCzCqKaYHePvqZ?=
 =?us-ascii?Q?2eX9GG66j8MmRaGYIrK8hI4lZmXpXfwDgmy5cGPYX/AUrhzyC761Su16bIQs?=
 =?us-ascii?Q?mCtPKJZEmTtsjMZTLjcTLBAYopqg218Gb9OpJFWvatpRLyUbZc6NP1YmE8Ur?=
 =?us-ascii?Q?fXjke08gZbgiyYzpinBx3UJgirf5rRwhJ0j2hnyGqpjyd55nIovL0X7qcsA9?=
 =?us-ascii?Q?UUlxZCrWMInqTQjMJrPhzUa78Q5MpX15sBCEnHo2lUcA1UVTBHtnsyP0NJcl?=
 =?us-ascii?Q?ajIKaK7Z7bT6TL8+9xcvpgX7oXnwFvJacj+pEEnO1+a51BDbecTj6SIOqZj+?=
 =?us-ascii?Q?jCoJ9uizKjLAHBmglKU6FgriBv3pYM98WLGWJz4oyY1isnejIMp4CDALJO9B?=
 =?us-ascii?Q?E3K9K6OT+XrrufmlzNXp9Is9RGSopvHkzc+7+YkQ5HJeuR1LZ8Y6EupfyfME?=
 =?us-ascii?Q?1AQLsrZXNM8+/Mi5n+7jwUxFRyUom8olM/sb6sxx2wm1K1EMGUhUO0UG7lJV?=
 =?us-ascii?Q?wXQ6dHxMWRJCoLRdiYYoT6RxkmHSeJHXCDZFueFJIsKlpAEK9NkasRjOM7jk?=
 =?us-ascii?Q?ZvfsEaYcTQIRlPDJ+wKDfBdCqSZYq3N/Yz072qTI2W2acPZvrK0OeUuOLoM6?=
 =?us-ascii?Q?n3Akrq1MCuHwYLH/2QP5T8pLa4xmBTWQBqSMf+Iu0bdZ5mN8lzRCiXJCgKHu?=
 =?us-ascii?Q?8C8qoJnQQoLak4mYoMbGCyXByFqHpKfVHyRJb55ursQdY03frc3SgrqaJLW/?=
 =?us-ascii?Q?KpciAuhr1V0CznBV7B7qlLzHLhFnPkk0DSJ0TJE1nRyaXtYUkOZO3FQDt5Or?=
 =?us-ascii?Q?VBZBVuRCnuPosVcU42wgr8EJ8m6+NM1pP4cU9iomyfTie9PEDUUrxZOK5jIk?=
 =?us-ascii?Q?H8zta4K2yJMp79rwvuHLScuGYu5VBp/8gz3eUBoGjA0kNms0UiOAJAo2Jz+N?=
 =?us-ascii?Q?aqKS6UrvYRM5oYZKJiWKDQKAtBfFxGYswXK5BY6yIDn5/L6G56kRN0O8KqC7?=
 =?us-ascii?Q?VVFRb8bxBnJnFRq0b3sR1rY07ZBW3EpMQMM37OOwLsQV5XpCujctR0Nuy9qu?=
 =?us-ascii?Q?QKq0+mWyUyjKY22HVMsAeSjmaa3ijS6/oOYKPXEfuW30BmRP3CoZVjviJf/8?=
 =?us-ascii?Q?qLr5hlReM5UKaHlqDBy8GmD1JIwozkmJ5ovojkBR+FCp99OF78yu6BM+pq6W?=
 =?us-ascii?Q?J2m3BhkZ7Y6S4zb56v+nbIpkz7xLSc32fJRWeIqPnkQtchHWeI5S2xmihkGb?=
 =?us-ascii?Q?udqe/8EmQY1dYVyOcH9RFBBhLBB1kRwW3XG7JOsIAjW8VqvF6Mfodz4VtL+m?=
 =?us-ascii?Q?B6ovLFiiQAi4tLy3aGY=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:24:28.0294 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf5d0cdc-75ef-4a1f-e892-08de239a487f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB7962
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEzMiBTYWx0ZWRfX2+Bi91CBuKlu
 plss8/Xgrj8pi11dmBDEU6pN0iAhcI0j2dOrct5Ik9L9CyS1GZb249R+rVA8cvDwcmv+OP6GNki
 I6/AecdmWcg9fNTx7g/ymLlt2J57PhDXn6ObdJUw9U1waKvoWjfMek/n60BukhoUYgfGzYug64/
 U10GSt6WOjW0BgScqCbQMdMNYQy7q/pTPReYHc/DoJ1z1zgMo3IVGyhy1hEFvFRWnnuoFhp1JHh
 xVEaiEoleWsvQgCamB7WVOv6/NfE+TEjYRlva+w6/RgVRzBEhrkHJ38ieNEA4h/3S7iKAWjng7O
 NAMIu++P2CHzcunq5er+o58S6OKe1p4KjJMha7un2r95Y+DMscd7vZWfQUTDsJv1wkwAclLDdVF
 Hxf5tu47evokuAhAKeQR+oTvsoQ6OA==
X-Authority-Analysis: v=2.4 cv=avi/yCZV c=1 sm=1 tr=0 ts=691757bf cx=c_pps
 a=gNGdg735eb55wJ36fiymPg==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=6UeiqGixMTsA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=jzDBigeus-lu7s0Xh5cA:9 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: -JUpEe6xkDVxMStrK8vF1LOHcZ6UWDyN
X-Proofpoint-GUID: -JUpEe6xkDVxMStrK8vF1LOHcZ6UWDyN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140132
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Peng Fan <peng.fan@nxp.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Sam Protsenko <semen.protsenko@linaro.org>
Subject: [Uboot-stm32] [PATCH 08/23] configs: stm32: Enable LED config flags
	for stm32h743-disco
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

Enable LED, LED_BOOT and LED_GPIO flags.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 configs/stm32h743-disco_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/stm32h743-disco_defconfig b/configs/stm32h743-disco_defconfig
index 5818e68ff7e..d0e2c95df25 100644
--- a/configs/stm32h743-disco_defconfig
+++ b/configs/stm32h743-disco_defconfig
@@ -32,5 +32,8 @@ CONFIG_CMD_EXT4_WRITE=y
 CONFIG_OF_CONTROL=y
 CONFIG_ENV_RELOC_GD_ENV_ADDR=y
 CONFIG_NO_NET=y
+CONFIG_LED=y
+CONFIG_LED_BOOT=y
+CONFIG_LED_GPIO=y
 CONFIG_STM32_SDMMC2=y
 # CONFIG_PINCTRL_FULL is not set
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
