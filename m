Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8X9MOCGgPGqSpwgAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Jun 2026 05:27:29 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADC76C2933
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Jun 2026 05:27:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=ti.com header.s=proofpoint-05-2026 header.b=GRe5L8LZ;
	dkim=fail ("body hash did not verify") header.d=ti.com header.s=selector1 header.b=r2ks1nCo;
	spf=pass (mail.lfdr.de: domain of uboot-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=uboot-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=ti.com (policy=quarantine);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05555C5A4C0;
	Thu, 25 Jun 2026 03:19:20 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com
 [148.163.154.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7ADEC58D7B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jun 2026 03:19:18 +0000 (UTC)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
 by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65OJsJvg1332358; Wed, 24 Jun 2026 22:17:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=proofpoint-05-2026; bh=hdhLQDVk7YVQw
 Gab0+aESlLiu559EYN+jaO5dGDlPOQ=; b=GRe5L8LZj12YQIpiTCDu3/bPgiUDM
 VsdMlj/fkwdnW3fZYlLgvw3gfWQGJ6fsFAQ7PapyufGqLM29at9Mm68Fexf8/1V5
 HGq08Y1k/S2sh7uAGR52A70QWCOxmCqHNNoErceKDKFAbVbq7STX0SPRsWtEk22/
 d9AHIimXKs2MOGGIL8dCwEKv1p4tenKT/zYbV0HOgHY/O/C0AkuNR16ujhNvZ9KF
 NXRl1DBQgWhTNxHgU99OpMP/sdAfRC9oLr6O7mn1BTO2gInrb3VhAytSwKTFXiAV
 RQclLGFhGxAMdA5/RC4GAZDIz5PDSKUviLOkxZhFl5ZW0mCisgOs+mXhQ==
Received: from sa9pr02cu001.outbound.protection.outlook.com
 (mail-southcentralusazon11013002.outbound.protection.outlook.com
 [40.93.196.2])
 by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f0aspefdx-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 24 Jun 2026 22:17:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VHBqbEdU0+U6JopUbp+ORC1szrAgL5ElOl2TD9Vsgw1Ad8m9UQf8BZwXmfCmnzFe4laU/mANFL7rBUupzDsc80P1C7IRpnt41QSf+JutftYzaD80yF8IznPPp8+oUYDDXkIzvdkaeVO3w0TBBYZYW+sEShyHWBwYL72T4Me8Gvj+2/p8ffFRyr8HE3Xbsx4A2vtQqYUJFU4uHReEwdExum5HUtmZN4e9yf9gn0rLP38f/mYydYlX7vXxKYpD2it1cQKJ2TmixGO7JefwFfnz97QkfVeouHK2kELU0omAwb+yE17Zf796p22Ttdv8vakpk6UTw8934d2RCG/Am/fPLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hdhLQDVk7YVQwGab0+aESlLiu559EYN+jaO5dGDlPOQ=;
 b=eue/MnSnvF95p/QKNm5KYN6ALUoUQr7wRXMvV8pr1z2zsUM4nuTTLIRHaNgN9IRBAeC/4fJLeBnxp+tsL2+ivp++OhaqSkLKQDc6M48nnHxsS8Myq7qttu3bOtzWWCrXtg2suKxAuuZ0MCSuVYx2C6TvA24sIvy0ukTW1zn7UIrmYZ0SBcko+6KVQViGlkIm0Q5NC9jm/hiFy+L5YS7bBJG5/dUYQLTNjCO2WxUv4DymspUXbr12zkBtnuEisu3nPHRb5ul/zUYCopMkQ3HZfSsNjVldQntb2OXoNRo4is9vwPZanyEAo4me3jZTuIuOppC77sUmtbppCUxMy7HRDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=collabora.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hdhLQDVk7YVQwGab0+aESlLiu559EYN+jaO5dGDlPOQ=;
 b=r2ks1nCogpsvAjNa+NNa9/ePW2CaqaTTl2ikj0wmjgW3m5GvHdc5qeDX3x1bPynfrmCBSg51TC0mWAN8GlDhMyhRXJquzbkLNVp5KCRgqo8SgYL21WtHTsrn/mZrLBAOem0N03FXuutm9mk0r/ycIE9F3dXAGPpvib76G5NWYD4=
Received: from DS1P221CA0011.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:451::11) by
 SN7PR10MB6363.namprd10.prod.outlook.com (2603:10b6:806:26d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Thu, 25 Jun
 2026 03:17:44 +0000
Received: from DS2PEPF00003448.namprd04.prod.outlook.com
 (2603:10b6:8:451:cafe::85) by DS1P221CA0011.outlook.office365.com
 (2603:10b6:8:451::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.16 via Frontend Transport; Thu,
 25 Jun 2026 03:17:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS2PEPF00003448.mail.protection.outlook.com (10.167.17.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 03:17:42 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 24 Jun
 2026 22:17:30 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 24 Jun
 2026 22:17:29 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 24 Jun 2026 22:17:29 -0500
Received: from localhost (ada0543016.dhcp.ti.com [10.24.50.146])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65P3HSNm1802616;
 Wed, 24 Jun 2026 22:17:29 -0500
From: Anshul Dalal <anshuld@ti.com>
Date: Thu, 25 Jun 2026 08:47:06 +0530
MIME-Version: 1.0
Message-ID: <20260625-tristate_fix-v1-1-95e16153d752@ti.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqEMBBE0atIrw1kAkbwKoMMSSy1XTiSjiKId
 zfq8hXUP0gQGUJNcVDExsL/OeNTFhRGNw9Q3GWT0cZqayqVIktyCb+ed6V1712wcF0NypclIs9
 P7tu+ltVPCOlu0Hlejkc6tXAAAAA=
X-Change-ID: 20260625-tristate_fix-00fbac6ead7e
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782357448; l=11913;
 i=anshuld@ti.com; s=20251022; h=from:subject:message-id;
 bh=8Halbynn5QxfJ99qHY9DO0P2yWwxtOTJriItBDulxlQ=;
 b=ihhrKZyH20U1GCIQ8gdX9uA8ujxF33Lnvu+yhVsNJWgCnH7/y2FNDmhNmVKWytMN1455TrqNs
 TmnNmgYBDFQBfW371KGcQwaT9at566oSrWBnX7VC4lF+IjHwmS4yK7H
X-Developer-Key: i=anshuld@ti.com; a=ed25519;
 pk=Kv8FlQElcrR6efyEHmjtE83y8e0HKvqPyvVY+PJ4UFw=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003448:EE_|SN7PR10MB6363:EE_
X-MS-Office365-Filtering-Correlation-Id: 02ad64a8-5ebd-48ae-447f-08ded26851fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|36860700016|23010399003|376014|82310400026|18002099003|6133799003|3023799007|13003099007|56012099006;
X-Microsoft-Antispam-Message-Info: Lkax79pew9BOYGIvCJZy69JpgV4uNuMRqZA0IXKJiuROgQ3nRRpvUl1Wi6ucMw1r3S/AhBUnXb3h3JRrznmGA4qGeEvaRqe+6XfR+BKODBUnNTuUFxYnW0zcrI9ZHAW7jQJZYevumAuXWlmcyvtDoa9tU0zuFXMbK8fq/dVpoMjl7K3gU5wvd6C1asqKXyf72o/+JoF5F1eArsXopB1RqrlwP8pH0RrJNOl9XRY4LBZtTdNhJXfGf1LmmdQ7cBMelNyZXh0nzk7yJ3LlMhju23f9g3V99mS7APMnxGEHS8hUjipsY5MSP3xkZM13cLajT6x+G5V4vYp0TR4i0hmqWgmLYQK+1UJCAr0pUvW8HfWS7yiusvCOJHugvLGvVWxsXv57rqi4KxyRgfvnhGS1O6AivKdBsVoE1W7Lzw/BAL8HjG551LLxIpLtw86h45JuTp8BcLH4BlGvI6ADh0SV0aW6Ymvba8v0bg9AXxePvokUh8RUjl64MEd4eLgUHfPl1lFNynxn4f4TyYeyABeew9INbTG9miK7J9rcfj7eySGvHIGilxjQlFowKMRerrAWV7fSc5BizK+w96iH2IWa7kejJsPv3etIbgkq4/1op9wd40p4vLTe/XtL97RuUcZHhN5azbYA/j8lPAvI8lDJdJg5KVbGj5m3bqCb9zyrD43Pi6qD0UHeF2COEstoZ8BRutQDGQs9/RgSCxSaZLn9Ug==
X-Forefront-Antispam-Report: CIP:198.47.21.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet200.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(36860700016)(23010399003)(376014)(82310400026)(18002099003)(6133799003)(3023799007)(13003099007)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ntzAPwRDkSVTTVFzmfduFpvI+0rRFBlWe4uiX71jfi7iabg3FvYI6HBWaVzF+WfhFFlHAct3D3BHOASJhNpdhhR437joHPS300WZgnJoDMaxbgB4w8M100SvZQlwYjKueBTHuaZ7KDzXIamPSxXFztlTWzq7C9iVAHVHHdAJ+4ZZVenQMoH764HJiVjwJcvn/xNwY5WVhr3t7avj6GOMos/IYR+RrvqN4mwylX4lEXodY1zV1sg+gvrjG098Qx1+GwfVqQyIhgarogyAHQAA13sqiI2RaxSsZ5fKh3EpAMWExfQf9ltQEcErcZMH4qy7+SkozxAgQD8UWFRCH3wuaqrz9y+HypSdAKvdp4/1/BEoPkL7bWko8x3MGlQD9Lav8Vxcski3Mnv5SfpJCmDj9vJzdpwJw7EaUOtfLz6z4IWFFkj47OfEbAIK1Jw2bQWf
X-Exchange-RoutingPolicyChecked: b5/MP3sYr43FZhN8hyvS3oueqz+AKTSmr6zW+n4wqFY6dm//vV+uFKRzEWMYwb8fNikUp/mIAlI4AZHMpkLDuH/kRA9HdwZDpp/G8cLpXpuPCQCEGMWW6051X5nKXkctlLQk1QV86DdxhQ/RF6YPax/XQlcS7q5jo8aRZzx6PiBVJFJl27vrH3VUrLXzlFQdLtIiTWazyRiqQV5yh0FJGoDIh+Z3pWyVgJdA2z03RehlKlcUXNjGYuDY111RrpDBwLftJjc8Uhg9vw/bmZPzgoPc6lNiDGvjlKSPZlz6dcdpp4Mv50otbFSd9eoDf02jHakXqyQew+xMMZNV3khK6A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 03:17:42.6419 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02ad64a8-5ebd-48ae-447f-08ded26851fb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.194];
 Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003448.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6363
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDAyNSBTYWx0ZWRfX3e35l8i9fkrv
 k5elVfCugVi4CCP+GiWpjubgmOjzL5cPJc8CERoHr+rEZT33FfljhLc8iULRSjlTQPn1twVNZqf
 e7c8JmHF1c+zwvXh1T9cAZ6Slv3zjBqr8UVgU06wgvzqJD+izRFjX99bYyMVWCttr4KFA3biQmk
 zDbWdlyZ8NZP1BG8emnsFYabvBgh+mlFodKBqv7BPs6oMozat0e+OS/KE6cnkQ1X/ooHzQYWUuI
 X6EDYygxjCJpR5mvn6IcAi93okkSHsX9Bi3GRJszy2zeLzpaWlYNrB1QM1Xr+gLk924TMKnXrUH
 0SeXtl2XA/vliR5vYBJ+jZ7SuoXNno6vEd5+qPb0EW6KpVcpeoDFKbCqCLYnb1wa8YQ21BCy93L
 BeQ/hiMvc5abvOwwnSYZhQB6bSoDVDKWDgiC7VtAMC4cZan2rpDXHwm5oIlD0KtAjYTzO5zrIuq
 fdxWosRm16oAvG7K8aA==
X-Proofpoint-ORIG-GUID: uuBHw6QUnfF_thyr7Vzivqm7pxspwaKY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDAyNSBTYWx0ZWRfX+T347x0iA3Cn
 Cj3izFqCSnnYedoOO83yhARc76uhyjVEUbYe6wK5UasO/+rM5YRXPCclNyrfIGDLj1cwML7QSCE
 7eTpd2bKwZhHmbrNXyQ0+h1oSEg8LBM=
X-Authority-Analysis: v=2.4 cv=RMCD2Yi+ c=1 sm=1 tr=0 ts=6a3c9ddc cx=c_pps
 a=qSv8Sft3UEt4GReRCOm4JQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=NEAV23lmAAAA:8 a=sozttTNsAAAA:8
 a=RNFsm8_HPad9dN9_EfgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: uuBHw6QUnfF_thyr7Vzivqm7pxspwaKY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_04,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1011
 bulkscore=0 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250025
Cc: Peng Fan <peng.fan@nxp.com>, Yegor Yefremov <yegorslists@googlemail.com>,
 Tuyen Dang <tuyen.dang.xa@renesas.com>,
 Casey Connolly <casey.connolly@linaro.org>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Daniel Palmer <daniel@thingy.jp>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Jimmy Ho <jimmy.ho@sifive.com>, "Lucien.Jheng" <lucienzx159@gmail.com>,
 Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Peter Korsgaard <peter@korsgaard.com>,
 Jerome Forissier <jerome.forissier@arm.com>, Romain
 Gantois <romain.gantois@bootlin.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Alice Guo <alice.guo@nxp.com>, Weijie Gao <weijie.gao@mediatek.com>,
 Lukasz Majewski <lukma@denx.de>, Nick
 Hu <nick.hu@sifive.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Peter Robinson <pbrobinson@gmail.com>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>, Mateus
 Lima Alves <mateuslima.ti@gmail.com>,
 Jamie Gibbons <jamie.gibbons@microchip.com>,
 Michael Trimarchi <michael@amarulasolutions.com>, Tien
 Fong Chee <tien.fong.chee@altera.com>,
 "Kory Maincent \(TI.com\)" <kory.maincent@bootlin.com>,
 Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 Beiyan Yun <root@infi.wang>, Anshul Dalal <anshuld@ti.com>,
 Jonathan Stroud <jonathan.stroud@amd.com>,
 Justin Swartz <justin.swartz@risingedge.co.za>,
 Bhupesh Sharma <bhupesh.linux@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Andrew Goodbody <andrew.goodbody@linaro.org>,
 Dinesh <dinesh.maniyam@altera.com>, Heiko Schocher <hs@nabladev.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Ralph Siemsen <ralph.siemsen@linaro.org>,
 Neha Malcom Francis <n-francis@ti.com>, Angelo
 Dureghello <angelo@kernel-space.org>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Padmarao Begari <padmarao.begari@amd.com>, Alexey Charkov <alchark@gmail.com>,
 Boon Khai Ng <boon.khai.ng@altera.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] treewide: Kconfig: use bool instead of
	tristate
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[ti.com : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[ti.com:s=proofpoint-05-2026,ti.com:s=selector1];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[nxp.com,googlemail.com,renesas.com,linaro.org,cherry.de,rock-chips.com,collabora.com,thingy.jp,ti.com,sifive.com,gmail.com,denx.de,konsulko.com,korsgaard.com,arm.com,bootlin.com,gmx.de,mediatek.com,samsung.com,mentallysanemainliners.org,microchip.com,amarulasolutions.com,altera.com,iopsys.eu,infi.wang,amd.com,risingedge.co.za,nabladev.com,andestech.com,kernel-space.org,chromium.org,foss.st.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	GREYLIST(0.00)[pass,body];
	DKIM_TRACE(0.00)[ti.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[anshuld@ti.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[53];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7ADC76C2933

U-Boot does not support modules, so having tristate options is useless.

Therefore this patch does a blind replace of all tristate options to
bool tree-wide.

Signed-off-by: Anshul Dalal <anshuld@ti.com>
---
CI: https://github.com/u-boot/u-boot/pull/998
---
 board/st/common/Kconfig      | 2 +-
 cmd/Kconfig                  | 4 ++--
 drivers/cache/Kconfig        | 2 +-
 drivers/clk/Kconfig          | 2 +-
 drivers/firmware/Kconfig     | 2 +-
 drivers/i2c/Kconfig          | 6 +++---
 drivers/i2c/muxes/Kconfig    | 6 +++---
 drivers/i3c/Kconfig          | 2 +-
 drivers/i3c/master/Kconfig   | 2 +-
 drivers/memory/Kconfig       | 2 +-
 drivers/misc/Kconfig         | 2 +-
 drivers/mmc/Kconfig          | 4 ++--
 drivers/mtd/nand/Kconfig     | 2 +-
 drivers/net/phy/Kconfig      | 4 ++--
 drivers/spi/Kconfig          | 2 +-
 drivers/ufs/Kconfig          | 2 +-
 drivers/usb/cdns3/Kconfig    | 6 +++---
 drivers/usb/musb-new/Kconfig | 2 +-
 drivers/usb/tcpm/Kconfig     | 4 ++--
 19 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/board/st/common/Kconfig b/board/st/common/Kconfig
index 3d00f3f3331..aafbffbf6db 100644
--- a/board/st/common/Kconfig
+++ b/board/st/common/Kconfig
@@ -14,7 +14,7 @@ config DFU_ALT_RAM0
 	  This defines the partitions of ram used to build dfu dynamically.
 
 config TYPEC_STUSB160X
-	tristate "STMicroelectronics STUSB160X Type-C controller driver"
+	bool "STMicroelectronics STUSB160X Type-C controller driver"
 	depends on DM_I2C
 	help
 	  Say Y if your system has STMicroelectronics STUSB160X Type-C port
diff --git a/cmd/Kconfig b/cmd/Kconfig
index 032e55e8127..452d11fc493 100644
--- a/cmd/Kconfig
+++ b/cmd/Kconfig
@@ -3177,7 +3177,7 @@ config CMD_STACKPROTECTOR_TEST
 endmenu
 
 config CMD_UBI
-	tristate "Enable UBI - Unsorted block images commands"
+	bool "Enable UBI - Unsorted block images commands"
 	select MTD_UBI
 	help
 	  UBI is a software layer above MTD layer which admits use of LVM-like
@@ -3197,7 +3197,7 @@ config CMD_UBI_RENAME
 	   ubi rename <oldname> <newname>
 
 config CMD_UBIFS
-	tristate "Enable UBIFS - Unsorted block images filesystem commands"
+	bool "Enable UBIFS - Unsorted block images filesystem commands"
 	depends on CMD_UBI
 	default y if CMD_UBI
 	select LZO
diff --git a/drivers/cache/Kconfig b/drivers/cache/Kconfig
index 3bf5c7f5dbf..5ebc8842acd 100644
--- a/drivers/cache/Kconfig
+++ b/drivers/cache/Kconfig
@@ -14,7 +14,7 @@ config CACHE
 	  configuring settings that be found from a device tree file.
 
 config L2X0_CACHE
-	tristate "PL310 cache driver"
+	bool "PL310 cache driver"
 	select CACHE
 	depends on ARM
 	help
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index c2da7b3938b..9080a9750d8 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -216,7 +216,7 @@ config CLK_HSDK
 	  Synopsys ARC HSDK-4xD boards
 
 config CLK_VERSACLOCK
-	tristate "Enable VersaClock 5/6 devices"
+	bool "Enable VersaClock 5/6 devices"
 	depends on CLK
 	depends on CLK_CCF
 	depends on OF_CONTROL
diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index 220de731950..f524f741e54 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -14,7 +14,7 @@ config ARM_PSCI_FW
 	select FIRMWARE
 
 config TI_SCI_PROTOCOL
-	tristate "TI System Control Interface (TISCI) Message Protocol"
+	bool "TI System Control Interface (TISCI) Message Protocol"
 	depends on K3_SEC_PROXY
 	select DEVRES
 	select FIRMWARE
diff --git a/drivers/i2c/Kconfig b/drivers/i2c/Kconfig
index 8c2f71b9fe2..063db80b7bb 100644
--- a/drivers/i2c/Kconfig
+++ b/drivers/i2c/Kconfig
@@ -98,7 +98,7 @@ config SYS_I2C_EARLY_INIT
 	  board_early_init_f.
 
 config I2C_CROS_EC_TUNNEL
-	tristate "Chrome OS EC tunnel I2C bus"
+	bool "Chrome OS EC tunnel I2C bus"
 	depends on CROS_EC
 	help
 	  This provides an I2C bus that will tunnel i2c commands through to
@@ -213,14 +213,14 @@ config SYS_FSL_I2C4_OFFSET
 endif
 
 config SYS_I2C_CADENCE
-	tristate "Cadence I2C Controller"
+	bool "Cadence I2C Controller"
 	depends on DM_I2C
 	help
 	  Say yes here to select Cadence I2C Host Controller. This controller is
 	  e.g. used by Xilinx Zynq.
 
 config SYS_I2C_CA
-	tristate "Cortina-Access I2C Controller"
+	bool "Cortina-Access I2C Controller"
 	depends on DM_I2C && CORTINA_PLATFORM
 	help
 	  Add support for the Cortina Access I2C host controller.
diff --git a/drivers/i2c/muxes/Kconfig b/drivers/i2c/muxes/Kconfig
index 3b1220b2105..89a4b82458a 100644
--- a/drivers/i2c/muxes/Kconfig
+++ b/drivers/i2c/muxes/Kconfig
@@ -26,14 +26,14 @@ config I2C_ARB_GPIO_CHALLENGE
 	  a GPIO.
 
 config I2C_MUX_PCA9541
-	tristate "NXP PCA9541 I2C Master Selector"
+	bool "NXP PCA9541 I2C Master Selector"
 	depends on I2C_MUX
 	help
 	  If you say yes here you get support for the NXP PCA9541
 	  I2C Master Selector.
 
 config I2C_MUX_PCA954x
-	tristate "TI PCA954x I2C Mux/switches"
+	bool "TI PCA954x I2C Mux/switches"
 	depends on I2C_MUX
 	help
 	  If you say yes here you get support for the TI PCA954x I2C mux/switch
@@ -49,7 +49,7 @@ config I2C_MUX_PCA954x
 		MAX7356, MAX7357, MAX7358, MAX7367, MAX7368 and MAX7369
 
 config I2C_MUX_GPIO
-        tristate "GPIO-based I2C multiplexer"
+	bool "GPIO-based I2C multiplexer"
 	depends on I2C_MUX && DM_GPIO
 	select DEVRES
 	help
diff --git a/drivers/i3c/Kconfig b/drivers/i3c/Kconfig
index 48341f9b873..41a4177b3ae 100644
--- a/drivers/i3c/Kconfig
+++ b/drivers/i3c/Kconfig
@@ -1,5 +1,5 @@
 menuconfig I3C
-	tristate "I3C support"
+	bool "I3C support"
 	select I2C
 	select DEVRES
 	help
diff --git a/drivers/i3c/master/Kconfig b/drivers/i3c/master/Kconfig
index 79776f60ae4..63467ef9cc2 100644
--- a/drivers/i3c/master/Kconfig
+++ b/drivers/i3c/master/Kconfig
@@ -1,5 +1,5 @@
 config DW_I3C_MASTER
-	tristate "Synopsys DesignWare I3C master driver"
+	bool "Synopsys DesignWare I3C master driver"
 	depends on I3C
 	help
 	  Support for Synopsys DesignWare MIPI I3C Controller.
diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
index 591d9d9c656..adec8efd58c 100644
--- a/drivers/memory/Kconfig
+++ b/drivers/memory/Kconfig
@@ -55,7 +55,7 @@ config STM32_OMM
 	    - the time between 2 transactions in multiplexed mode.
 
 config TI_AEMIF
-	tristate "Texas Instruments AEMIF driver"
+	bool "Texas Instruments AEMIF driver"
 	depends on ARCH_KEYSTONE || ARCH_DAVINCI
 	help
 	  This driver is for the AEMIF module available in Texas Instruments
diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index ea785793d18..8205b501c7f 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -505,7 +505,7 @@ config TURRIS_OMNIA_MCU
 	  board power off.
 
 config USB_HUB_USB251XB
-	tristate "USB251XB Hub Controller Configuration Driver"
+	bool "USB251XB Hub Controller Configuration Driver"
 	depends on I2C
 	help
 	  This option enables support for configuration via SMBus of the
diff --git a/drivers/mmc/Kconfig b/drivers/mmc/Kconfig
index 0996d9fc30d..8ddea79741b 100644
--- a/drivers/mmc/Kconfig
+++ b/drivers/mmc/Kconfig
@@ -576,7 +576,7 @@ config MMC_SDHCI_ATMEL
 	  specification.
 
 config MMC_SDHCI_BCM2835
-	tristate "SDHCI support for the BCM2835 SD/MMC Controller"
+	bool "SDHCI support for the BCM2835 SD/MMC Controller"
 	depends on ARCH_BCM283X
 	depends on MMC_SDHCI
 	select MMC_SDHCI_IO_ACCESSORS
@@ -589,7 +589,7 @@ config MMC_SDHCI_BCM2835
 	  If unsure, say N.
 
 config MMC_SDHCI_BCMSTB
-	tristate "SDHCI support for the BCMSTB SD/MMC Controller"
+	bool "SDHCI support for the BCMSTB SD/MMC Controller"
 	depends on MMC_SDHCI && (ARCH_BCMSTB || ARCH_BCM283X)
 	help
 	  This selects the Broadcom set-top box SD/MMC controller.
diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 78ae04bdcba..5ffec9502b6 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -1,5 +1,5 @@
 config MTD_NAND_CORE
-	tristate
+	bool
 
 source "drivers/mtd/nand/raw/Kconfig"
 
diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
index 0025c895f12..98d686d9f41 100644
--- a/drivers/net/phy/Kconfig
+++ b/drivers/net/phy/Kconfig
@@ -233,7 +233,7 @@ config PHY_MICREL_KSZ8XXX
 endif # PHY_MICREL
 
 config PHY_MOTORCOMM
-	tristate "Motorcomm PHYs"
+	bool "Motorcomm PHYs"
 	help
 	  Enables support for Motorcomm network PHYs.
 	  Currently supports the YT8511 and YT8531 Gigabit Ethernet PHYs.
@@ -246,7 +246,7 @@ config PHY_NATSEMI
 	bool "National Semiconductor Ethernet PHYs support"
 
 config PHY_NXP_C45_TJA11XX
-	tristate "NXP C45 TJA11XX PHYs"
+	bool "NXP C45 TJA11XX PHYs"
 	select DEVRES
 	help
 	  Enable support for NXP C45 TJA11XX PHYs.
diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index cfbedd64c4c..85016ec84b9 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -548,7 +548,7 @@ config SOFT_SPI
 	 the SPI protocol.
 
 config SPI_SN_F_OSPI
-	tristate "Socionext F_OSPI SPI flash controller"
+	bool "Socionext F_OSPI SPI flash controller"
 	select SPI_MEM
 	help
 	  This enables support for the Socionext F_OSPI controller
diff --git a/drivers/ufs/Kconfig b/drivers/ufs/Kconfig
index 49472933de3..6ddf0820102 100644
--- a/drivers/ufs/Kconfig
+++ b/drivers/ufs/Kconfig
@@ -24,7 +24,7 @@ config UFS_CADENCE
 	  controller present on present TI's J721e devices.
 
 config UFS_MEDIATEK
-	tristate "MediaTek UFS Host Controller Driver"
+	bool "MediaTek UFS Host Controller Driver"
 	depends on UFS && ARCH_MEDIATEK
 	select PHY_MTK_UFS
 	help
diff --git a/drivers/usb/cdns3/Kconfig b/drivers/usb/cdns3/Kconfig
index 7964f3f41d5..ad0ef8ac2ba 100644
--- a/drivers/usb/cdns3/Kconfig
+++ b/drivers/usb/cdns3/Kconfig
@@ -1,5 +1,5 @@
 config USB_CDNS3
-	tristate "Cadence USB3 Dual-Role Controller"
+	bool "Cadence USB3 Dual-Role Controller"
 	depends on USB_XHCI_HCD || USB_GADGET
 	select DEVRES
 	help
@@ -51,14 +51,14 @@ config SPL_USB_CDNS3_HOST
 	  standard XHCI driver.
 
 config USB_CDNS3_STARFIVE
-	tristate "Cadence USB3 support on Starfive platforms"
+	bool "Cadence USB3 support on Starfive platforms"
 	default y if STARFIVE_JH7110
 	help
 	  Say 'Y' here if you are building for Starfive platforms
 	  that contain Cadence USB3 controller core. E.g.: JH7110.
 
 config USB_CDNS3_TI
-	tristate "Cadence USB3 support on TI platforms"
+	bool "Cadence USB3 support on TI platforms"
 	default USB_CDNS3
 	help
 	  Say 'Y' here if you are building for Texas Instruments
diff --git a/drivers/usb/musb-new/Kconfig b/drivers/usb/musb-new/Kconfig
index f8daaddc657..eb8c9af8020 100644
--- a/drivers/usb/musb-new/Kconfig
+++ b/drivers/usb/musb-new/Kconfig
@@ -48,7 +48,7 @@ config USB_MUSB_TI
 	  silicon IP.
 
 config USB_MUSB_OMAP2PLUS
-	tristate "OMAP2430 and onwards"
+	bool "OMAP2430 and onwards"
 	depends on ARCH_OMAP2PLUS
 
 config USB_MUSB_AM35X
diff --git a/drivers/usb/tcpm/Kconfig b/drivers/usb/tcpm/Kconfig
index 9be4b496e82..b1ea7253720 100644
--- a/drivers/usb/tcpm/Kconfig
+++ b/drivers/usb/tcpm/Kconfig
@@ -1,14 +1,14 @@
 # SPDX-License-Identifier: GPL-2.0
 
 config TYPEC_TCPM
-	tristate "USB Type-C Port Controller Manager"
+	bool "USB Type-C Port Controller Manager"
 	depends on DM
 	help
 	  The Type-C Port Controller Manager provides a USB PD and USB Type-C
 	  state machine for use with Type-C Port Controllers.
 
 config TYPEC_FUSB302
-	tristate "Fairchild FUSB302 Type-C chip driver"
+	bool "Fairchild FUSB302 Type-C chip driver"
 	depends on DM && DM_I2C && TYPEC_TCPM
 	help
 	  The Fairchild FUSB302 Type-C chip driver that works with

---
base-commit: 9f16b258e5632d74fa4a1c2c93bea4474e05234b
change-id: 20260625-tristate_fix-00fbac6ead7e

Best regards,
--  
Anshul Dalal <anshuld@ti.com>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
