Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WG3aCvE7g2ngjwMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 04 Feb 2026 13:30:41 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA25E5CF5
	for <lists+uboot-stm32@lfdr.de>; Wed, 04 Feb 2026 13:30:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2246BC87ECC;
	Wed,  4 Feb 2026 12:30:40 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012049.outbound.protection.outlook.com [40.107.209.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB500C32EB0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Feb 2026 03:59:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fXlArur1VT0TIuDB2yQh7xloHA10caCXVYsfkOeV3igTPQt2UaL4LcPUZNtY5srBAif6haBN9qm+Mohz/G0mEVu2BNKIzr2n7ly7dOiwkmF4DBpotj5D2W49AoSN+9Xn5h0+JFr4kUPOPexkDceuYadrLrNEJTGhcEvi+zT+KgE2I+2BV0jLZPwpqwnEMTU5W5ahVXuN2fWOz1A7e6sm/0NsbVRovWjY2XX8rNp55H1wW2KKtgxkACPuZnRdmKXGtPlv3sE4rN+MgRUFIuEi/JbamXsho/bgKQlqfuKgNc3N+tzc1NfJvIzbY1F5qCxM9IvdN6+4J3clZfbGQp5csg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2fFY4P62BgonmzfnHemPSUIV9mDI0X9zOxxZ4/T9xpo=;
 b=ZYqp2SB21xr7tHQ8GuaPNioK7MjFXHYIKg3x7owskrtcg5aWLN6oXdAsfaKsQdJUhIW0l+IbWMjGNlPS12hUObspomY7yGXR0BItItqpA2Ewh3HmK+qDtcApJDuWAYg/o53AUdoX9YOe/Bu0JmQOSYU0VeVs39KhG/X/20UbD2UvR7NmMDuVme/5awrVPLcSlXWJN4YXElnuHeelVHLU1JTQhm2n15FOaalrPV6+rkVktPEXQFbXTGcXYqP3odaOdHNhiYDN7UkTdAzVyJ1QDArYfZyGN13f9yTnjrHM+ZIbE3PIt+PAHHPezLeXv0KGKft8spmYGTpxSNJdI6ZDbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=foss.st.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2fFY4P62BgonmzfnHemPSUIV9mDI0X9zOxxZ4/T9xpo=;
 b=kq+yGEDrc3W15OrizMLozZFNU9VKQIU6P0pIbD5+bkthj1i/w1pBRgm25h3NV1SU7iu6Vgr+4wZd3slHRxXF5ni3wNImrH/CZ2/lyYVUjAz7mkoceycw+qxEtbPvEWgwDo8armNM8HFaSpe9ZGw555aBmf1JizhaNCBmjJzIlgo=
Received: from PH8PR15CA0009.namprd15.prod.outlook.com (2603:10b6:510:2d2::8)
 by PH7PR10MB6601.namprd10.prod.outlook.com (2603:10b6:510:205::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 03:59:30 +0000
Received: from CY4PEPF0000FCBF.namprd03.prod.outlook.com
 (2603:10b6:510:2d2:cafe::24) by PH8PR15CA0009.outlook.office365.com
 (2603:10b6:510:2d2::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Wed,
 4 Feb 2026 03:59:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000FCBF.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 4 Feb 2026 03:59:29 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 21:59:28 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 21:58:58 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Feb 2026 21:58:58 -0600
Received: from localhost (ada0543016.dhcp.ti.com [172.24.233.9])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6143wucP859918;
 Tue, 3 Feb 2026 21:58:56 -0600
MIME-Version: 1.0
Date: Wed, 4 Feb 2026 09:28:55 +0530
Message-ID: <DG5VKDJGAOMP.38WFSJD3IA8GM@ti.com>
From: Anshul Dalal <anshuld@ti.com>
To: Peng Fan <peng.fan@nxp.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>, GSS_MTK_Uboot_upstream
 <GSS_MTK_Uboot_upstream@mediatek.com>, dl-uboot-imx <uboot-imx@nxp.com>,
 Aspeed BMC SW team <BMC-SW@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Christoph Stoidner <c.stoidner@phytec.de>, "kernel@puri.sm" <kernel@puri.sm>, 
 Sam Day <me@samcday.com>, Sumit Garg <sumit.garg@kernel.org>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, "uboot-snps-arc@synopsys.com"
 <uboot-snps-arc@synopsys.com>, "u-boot-amlogic@groups.io"
 <u-boot-amlogic@groups.io>, "u-boot@dh-electronics.com"
 <u-boot@dh-electronics.com>, "upstream@lists.phytec.de"
 <upstream@lists.phytec.de>, "u-boot-qcom@groups.io" <u-boot-qcom@groups.io>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>, "adsp-linux@analog.com"
 <adsp-linux@analog.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260203-cleanup-v1-0-4221c13e7558@nxp.com>
 <PAXPR04MB84594DBC04C4957716EA9C79889BA@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB84594DBC04C4957716EA9C79889BA@PAXPR04MB8459.eurprd04.prod.outlook.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBF:EE_|PH7PR10MB6601:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eee38f5-4920-40e2-bb6c-08de63a1cbb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|7416014|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YlJqOXFWbVpKRDZWVERXTnlUTnpENVVHdmRWRHZ5ampxR0VIOHJFUDNNdUdJ?=
 =?utf-8?B?RWo3RnRIWTdQay8rK0ZKK2RtMkJOYkYzbE10UmxrWUdGZnhycEIwVFBSSnRo?=
 =?utf-8?B?QmtybkhpNG9sSlNoZzhXM0lDUUdoR3U0RzYrK2JOd21UM1V5K1pGeEpxaDl5?=
 =?utf-8?B?YWtOTHpXVHJMRFFyeXpKc0xyeGppbXJpYkpKTi9OVDNsRFNQdXBHUDlwU3Yr?=
 =?utf-8?B?QlJ2aDZMV1BSQ0V5QUxYbFo4VjFNSDRBVTJ6YnEwaGQybndvUXpNWVJpSklU?=
 =?utf-8?B?MFFmekJTQjBzWktjdVBFaGFjRE1RZ1RxekZPS3JudVRHQUpsR2RJTGRZSWlW?=
 =?utf-8?B?NVIzNFB2a1pjVnBxWTFOWnl5MlVpcCtTMDB6Vjc2Y3BpeEVTejBWV0xjN0w0?=
 =?utf-8?B?UUsxWnlmcHF0bWxCNVBja09ZQ1VTQnhjMUEwc3BtZFh2dDg0VktHdXNNVk44?=
 =?utf-8?B?QnRGc3o2UWVNZUFxOGlhaDVMNjdMdE5nREhTRytVbUs5WVJuZG1wb2xiRGxM?=
 =?utf-8?B?WnI5ZGE5TmRsODJhQS9tL2Q5VGNtV3NBSWZGTVJFT0g2RmdhVHYvQjZCczBF?=
 =?utf-8?B?WjVtdXMyVUw4cXZWcGN2UWZUWkpKVTJZNHRuZHNDYmgwQ1ZnaW5TN1VxSGVT?=
 =?utf-8?B?aWN2MndzSm9ueDJHdEpTTTBzY09yRGV5dHZqNGFxQ0lyZWdWL3dxaUtQZk1R?=
 =?utf-8?B?dUxwTE14ZjltOUR4VDNaWG1LdW5zM3daZFRMcHJSZGFnTUZpaVFtUXB2ckVG?=
 =?utf-8?B?eGRHa3BTN1JKYTU5aU1ZekNKNE9WRW5zbFRGMUVicTRVeG5kOVJZRmFyMTQr?=
 =?utf-8?B?L09hMkp6bThwdU1meUFvQWFsSlNabHN5MmpBdC8rUmRpZmhXWHhJdmRrMHlo?=
 =?utf-8?B?YjJ0dlFsS1hMR0pyaFdkRGRmNUFNbUpUaEc5SkdVWjRDc0tVN2VBZlV4U0lV?=
 =?utf-8?B?NWoyVDZib3Z1U2psSVlvVG1nckFhSEk4TllXQ2tvc2E5TTZhU3B0UVlNSUd5?=
 =?utf-8?B?NDVKeCszRExHRVNSbFRuZ0h6SVFmdEFGQllscGNtZjVrMFZLWDVTZ2RDUkI1?=
 =?utf-8?B?cjFpSEw5MWhSM1MzT1U1NlBrblZ2N3lqRXVielVULzBiQ0dVY1FYWVRMaXRK?=
 =?utf-8?B?WC9laGtpOGxhT2d3MWtoNWJ3VkVJUnF2Y3BJdzJPanRUbllLMjhLU3VQSmRQ?=
 =?utf-8?B?MmdFN3lueWsxd0xaejdsRVhWRkVLUnh4a1RzaHdKMnB0OXZBbm16QXJxMWZP?=
 =?utf-8?B?SnhYK21wM2N0aktVR0JuWnBZc1M2cGxpYVlZT0xlYW9GcmtnVG4waEFNZjN3?=
 =?utf-8?B?NytVaDduSmdoY1Vpb3BTSXpmSHRIT1J4UXJSclFKb29UN1dmZFBwdkRDNlEw?=
 =?utf-8?B?SStFdWdVMHFLdzJFNXNDblBQQkZxKzYvOE5Ia3F1MHJxKzhkZmZpRnlQTnJ3?=
 =?utf-8?B?emEvTkRYUGVGeGUvaXRTR2EzcUREYTRyRTFZaHB0OUxmb1pHM0tzYUwrL2tr?=
 =?utf-8?B?RGh1Sk1IUTNmb1JkUi9Ka3F0SmUvOGJOZk5mTzBmRXhQRUlVM1cwZUhvQ3ph?=
 =?utf-8?B?b3pJUG5aaThtekxKM0h1SmRzemJQazdnYmtrWHVFWHRucmhVZVNSdjFzNmVR?=
 =?utf-8?B?SVZOblpLeWJQR2NwZWlnQ21uODFyZHVudzdrSUY1Y0pTZDhyVE50SXFGZElp?=
 =?utf-8?B?UlV4NTFvdTBieHpFdG1uK1dqb3Rmd3Vjc0czaUM0SjNpUDVZSExsQkpMS3FR?=
 =?utf-8?B?MDFjcGo0enk3ZTZqQ1d2UDY5bE15SjFZSXNFTVM3U3RHMmUrc2QxdDJUSkNl?=
 =?utf-8?B?d053Q2xoUnRVMkFJcmdmbXhoRGdrSURCdXBxeHNVWEx1NTFZZVMrN2JEOVlj?=
 =?utf-8?B?c0tYQ04zUjBuUUlReTdQUE5TbVhSUTZLMG94S1crM0RnSmxkRnN0TVBSSHc2?=
 =?utf-8?B?SmRHMjAyWjNjTlpOYXpIb0FxTG0zUTNta0ZZNkxMbytEQmNRYW5uNmNGeThR?=
 =?utf-8?B?Y0hvVTFiWkFzQTFacUZtUDdRNFJwS2lZRFc3Vkg2NGQ3dWl2VW1OL2Z3WmZl?=
 =?utf-8?B?RWZNTEtrclFPZnN6MmJrR2VRSXZ4dkxidHg0SlVQcWV5ZUlaT0U3dGQ0Yy9t?=
 =?utf-8?B?ZjRyZGRDZlFGeFI2dkJTbFdWdDlHNkxLTHlwVGcxSGtvLzJaTHlzZkRMMmtI?=
 =?utf-8?Q?ZkVEXjKQaLwziklj+M/kpbw=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet201.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: uSc3jGMbCzoP4nr8In+i6DlBwmFZuAhJzdVtK9MXTBu0YaL+hHMpVCL2N1gzCDFn78cOzZg7T+yU5+IQpWj0hhHL+QzJ2GgqkPoOYg7Hrkq8zNUSdyF13FELiA8aZVET48XEQodzHAw6qnHmhey1yR4V2ajK2c3NOU4lZbCcfqSu6GnvCOcGcyrZkQ2E1rziC8RiPq/cb5FieyCtKCSLdH0sH320ZOUpzziYeXgU1MaOy0RUjTadRZ4xXM5xEGg8Oh8sLgG7E8PunPgjc3c3u1Pm6BCOpVKumyoYYc3TI1MYzpLqPbx82m/XvUN2Noyl0fnI91mVyGhpewVgWmzHp9rQpSWdjQOVABIk7w0r9hdbXCmgxzci+QuVPcJqgM+1RZh+PEXmdoqLZ6W4Hpbv11PfDkoeBmRNG/QGaqk+1FXFnddRftoS64al2CpHGEQX
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 03:59:29.1082 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eee38f5-4920-40e2-bb6c-08de63a1cbb4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.195];
 Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCBF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6601
X-Mailman-Approved-At: Wed, 04 Feb 2026 12:30:39 +0000
Cc: Debbie Horsfall <debbie.horsfall@arm.com>, Heiko Stuebner <heiko@sntech.de>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>, Angus Ainslie <angus@akkea.ca>,
 Antonio Borneo <antonio.borneo@foss.st.com>,
 Ian Ray <ian.ray@gehealthcare.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin@pqrs.dk>, Finley
 Xiao <finley.xiao@rock-chips.com>, Zixun LI <admin@hifiphile.com>,
 Vitor Soares <vitor.soares@toradex.com>,
 Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Jaehoon Chung <jh80.chung@samsung.com>, Swamil Jain <s-jain1@ti.com>,
 Peter Hoyes <Peter.Hoyes@arm.com>, Eoin
 Dickson <eoin.dickson@microchip.com>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>, Lukasz Majewski <lukma@denx.de>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Hal Feng <hal.feng@starfivetech.com>, Marco Franchi <marcofrk@gmail.com>,
 Neha Malcom Francis <n-francis@ti.com>, Ramon Fried <rfried.dev@gmail.com>,
 Viorel Suman <viorel.suman@nxp.com>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Thierry Reding <treding@nvidia.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Ye Li <ye.li@nxp.com>,
 E Shattow <e@freeshell.de>, Sam Protsenko <semen.protsenko@linaro.org>,
 Masahisa Kojima <kojima.masahisa@socionext.com>,
 Teresa Remmet <T.remmet@phytec.de>, Benjamin Hahn <B.Hahn@phytec.de>,
 Francesco Valla <francesco@valla.it>, "Lukas F. Hartmann" <lukas@mntre.com>,
 Heiko Schocher <hs@nabladev.com>,
 Paul Geurts <paul.geurts@prodrive-technologies.com>,
 Tingting Meng <tingting.meng@altera.com>,
 =?utf-8?q?Timo_tp_Prei=C3=9Fl?= <t.preissl@proton.me>, Ilias
 Apalodimas <ilias.apalodimas@linaro.org>, Gilles Talis <gilles.talis@gmail.com>,
 Kamil Lulko <kamil.lulko@gmail.com>,
 Christoph Fritz <chf.fritz@googlemail.com>,
 Leonard Anderweit <l.anderweit@phytec.de>, Stefano
 Babic <sbabic@nabladev.com>, David Feng <fenghua@phytium.com.cn>,
 Bryan Brattlof <bb@ti.com>, Alice Guo <alice.guo@nxp.com>,
 Stefan Roese <stefan.roese@mailbox.org>,
 Alexey Brodkin <alexey.brodkin@synopsys.com>,
 Kever Yang <kever.yang@rock-chips.com>, "Lucien.Jheng" <lucienzx159@gmail.com>,
 Stefan Bosch <stefan_b@posteo.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Gabriel Dalimonte <gabriel.dalimonte@gmail.com>,
 "Ying-Chun Liu \(PaulLiu\)" <paul.liu@linaro.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Mateusz Kulikowski <mateusz.kulikowski@gmail.com>,
 Anastasiia Lukianenko <vicooodin@gmail.com>,
 Mark Kettenis <kettenis@openbsd.org>, Jerome Forissier <jerome@forissier.org>,
 Sky Huang <SkyLake.Huang@mediatek.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Primoz Fiser <primoz.fiser@norik.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Alex Nemirovsky <alex.nemirovsky@cortina-access.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Joseph Chen <chenjh@rock-chips.com>, Elaine
 Zhang <zhangqing@rock-chips.com>, Tien Fong Chee <tien.fong.chee@altera.com>,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>, Sam Shih <sam.shih@mediatek.com>,
 Rasmus Villemoes <ravi@prevas.dk>, Mathieu Othacehe <m.othacehe@gmail.com>,
 Minda Chen <minda.chen@starfivetech.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Anton Moryakov <ant.v.moryakov@gmail.com>, Mahesh Rao <mahesh.rao@altera.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>, Michal Simek <michal.simek@amd.com>,
 Andrew Goodbody <andrew.goodbody@linaro.org>,
 Alifer Moraes <alifer.wsdm@gmail.com>,
 Utsav Agarwal <utsav.agarwal@analog.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Brian Sune <briansune@gmail.com>,
 Leo <ycliang@andestech.com>, Greg Malysa <malysagreg@gmail.com>,
 David Zang <davidzangcs@gmail.com>, Ian Roberts <ian.roberts@timesys.com>,
 Simon Glass <sjg@chromium.org>, Osama
 Abdelkader <osama.abdelkader@gmail.com>, Alexander Graf <agraf@csgraf.de>,
 Mario Six <mario.six@gdsys.cc>, Ryan Chen <ryan_chen@aspeedtech.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Andy Yan <andy.yan@rock-chips.com>,
 Varadarajan Narayanan <quic_varada@quicinc.com>,
 =?utf-8?b?Si4gTmV1c2Now6RmZXI=?= <j.ne@posteo.net>,
 Yannic Moog <y.moog@phytec.de>,
 Alif Zakuan Yuslaimi <alif.zakuan.yuslaimi@altera.com>,
 Liviu Dudau <liviu.dudau@foss.arm.com>, Dhruva Gole <d-gole@ti.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>, Jonathan
 Humphreys <j-humphreys@ti.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Naresh Kumar Ravulapalli <nareshkumar.ravulapalli@altera.com>,
 Fabio Estevam <festevam@gmail.com>, Tom Rini <trini@konsulko.com>,
 Dillon Min <dillon.minfei@gmail.com>, Nathan
 Barrett-Morrison <nathan.morrison@timesys.com>,
 Thomas Chou <thomas@wytron.com.tw>, Manoj
 Sai <abbaraju.manojsai@amarulasolutions.com>,
 Bernhard Messerklinger <bernhard.messerklinger@at.abb.com>,
 Stephan Gerhold <stephan@gerhold.net>, Jonas Karlman <jonas@kwiboo.se>,
 Wolfgang Wallner <wolfgang.wallner@at.abb.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>, Francesco
 Dolcini <francesco.dolcini@toradex.com>,
 Muhammad Hazim Izzat Zamri <muhammad.hazim.izzat.zamri@altera.com>,
 Adam Ford <aford173@gmail.com>, Sai
 Varun Venkatapuram <saivarun.venkatapuram@amd.com>,
 Wadim Egorov <w.egorov@phytec.de>, Joe Hershberger <joe.hershberger@ni.com>,
 Linus Walleij <linusw@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Harrison Mutai <harrison.mutai@arm.com>,
 Aaron Williams <awilliams@marvell.com>, Boon Khai Ng <boon.khai.ng@altera.com>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jeremy Compostella <jeremy.compostella@intel.com>,
 Casey Connolly <casey.connolly@linaro.org>, Yao Zi <me@ziyao.cc>,
 Rick Chen <rick@andestech.com>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 Aswin Murugan <aswin.murugan@oss.qualcomm.com>, "Guillaume La
 Roque \(TI.com\)" <glaroque@baylibre.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Brian Ruley <brian.ruley@gehealthcare.com>, Marek Vasut <marex@denx.de>,
 Hai Pham <hai.pham.ud@renesas.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Randolph <randolph@andestech.com>,
 Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Vishal Mahaveer <vishalm@ti.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Ilko Iliev <iliev@ronetix.at>,
 Arturs Artamonovs <arturs.artamonovs@analog.com>,
 "matteo.lisi" <matteo.lisi@engicam.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Oliver Graute <Oliver.Graute@KoCoConnector.com>, Mathieu
 Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Maxim
 Moskalets <maximmosk4@gmail.com>,
 Alexander Feilke <alexander.feilke@ew.tq-group.com>,
 Markus Niebel <Markus.Niebel@ew.tq-group.com>, Apurva
 Nandan <a-nandan@ti.com>, Vasileios
 Bimpikas <vasileios.bimpikas@analog.com>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
 Lars Povlsen <lars.povlsen@microchip.com>, Patrick Wildt <patrick@blueri.se>,
 Adriano
 Cordova <adrianox@gmail.com>, Martyn Welch <martyn.welch@collabora.com>,
 Keerthy <j-keerthy@ti.com>, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Dinesh Maniyam <dinesh.maniyam@altera.com>,
 Ferass El Hafidi <funderscore@postmarketos.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 Robert Nelson <robertcnelson@gmail.com>,
 Anatolij Gustschin <ag.dev.uboot@gmail.com>, Anshul Dalal <anshuld@ti.com>
Subject: Re: [Uboot-stm32] [PATCH 00/14] treewide: Clean up usage of
 DECLARE_GLOBAL_DATA_PTR
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[ti.com : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[ti.com:s=selector1];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:peng.fan@nxp.com,m:peng.fan@oss.nxp.com,m:u-boot@lists.denx.de,m:GSS_MTK_Uboot_upstream@mediatek.com,m:uboot-imx@nxp.com,m:BMC-SW@aspeedtech.com,m:joel@jms.id.au,m:c.stoidner@phytec.de,m:kernel@puri.sm,m:me@samcday.com,m:sumit.garg@kernel.org,m:tudor.ambarus@linaro.org,m:uboot-snps-arc@synopsys.com,m:u-boot-amlogic@groups.io,m:u-boot@dh-electronics.com,m:upstream@lists.phytec.de,m:u-boot-qcom@groups.io,m:uboot-stm32@st-md-mailman.stormreply.com,m:adsp-linux@analog.com,m:debbie.horsfall@arm.com,m:heiko@sntech.de,m:mkorpershoek@kernel.org,m:angus@akkea.ca,m:antonio.borneo@foss.st.com,m:ian.ray@gehealthcare.com,m:mchitale@ventanamicro.com,m:alvin@pqrs.dk,m:finley.xiao@rock-chips.com,m:admin@hifiphile.com,m:vitor.soares@toradex.com,m:jorge.ramirez.ortiz@gmail.com,m:horatiu.vultur@microchip.com,m:jh80.chung@samsung.com,m:s-jain1@ti.com,m:Peter.Hoyes@arm.com,m:eoin.dickson@microchip.com,m:chiawei_wang@aspeedtech.com,m:lukma@denx.de,m:christophe.leroy@csgroup.eu,m
 :hal.feng@starfivetech.com,m:marcofrk@gmail.com,m:n-francis@ti.com,m:rfried.dev@gmail.com,m:viorel.suman@nxp.com,m:s-vadapalli@ti.com,m:treding@nvidia.com,m:Eugeniy.Paltsev@synopsys.com,m:marek.vasut+renesas@mailbox.org,m:ye.li@nxp.com,m:e@freeshell.de,m:semen.protsenko@linaro.org,m:kojima.masahisa@socionext.com,m:T.remmet@phytec.de,m:B.Hahn@phytec.de,m:francesco@valla.it,m:lukas@mntre.com,m:hs@nabladev.com,m:paul.geurts@prodrive-technologies.com,m:tingting.meng@altera.com,m:t.preissl@proton.me,m:ilias.apalodimas@linaro.org,m:gilles.talis@gmail.com,m:kamil.lulko@gmail.com,m:chf.fritz@googlemail.com,m:l.anderweit@phytec.de,m:sbabic@nabladev.com,m:fenghua@phytium.com.cn,m:bb@ti.com,m:alice.guo@nxp.com,m:stefan.roese@mailbox.org,m:alexey.brodkin@synopsys.com,m:kever.yang@rock-chips.com,m:lucienzx159@gmail.com,m:stefan_b@posteo.net,m:jcmvbkbc@gmail.com,m:gabriel.dalimonte@gmail.com,m:paul.liu@linaro.org,m:dario.binacchi@amarulasolutions.com,m:mateusz.kulikowski@gmail.com,m:vicooodin@gma
 il.com,m:kettenis@openbsd.org,m:jerome@forissier.org,m:SkyLake.Huang@mediatek.com,m:gregory.clement@bootlin.com,m:frieder.schrempf@kontron.de,m:primoz.fiser@norik.com,m:jagan@amarulasolutions.com,m:alex.nemirovsky@cortina-access.com,m:michael@amarulasolutions.com,m:chenjh@rock-chips.com,m:zhangqing@rock-chips.com,m:tien.fong.chee@altera.com,m:iwamatsu@nigauri.org,m:sam.shih@mediatek.com,m:ravi@prevas.dk,m:m.othacehe@gmail.com,m:minda.chen@starfivetech.com,m:philipp.tomsich@vrull.eu,m:ant.v.moryakov@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[anshuld@ti.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,ti.com:mid,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ti.com:-];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[200];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anshuld@ti.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[arm.com,sntech.de,kernel.org,akkea.ca,foss.st.com,gehealthcare.com,ventanamicro.com,pqrs.dk,rock-chips.com,hifiphile.com,toradex.com,gmail.com,microchip.com,samsung.com,ti.com,aspeedtech.com,denx.de,csgroup.eu,starfivetech.com,nxp.com,nvidia.com,synopsys.com,mailbox.org,freeshell.de,linaro.org,socionext.com,phytec.de,valla.it,mntre.com,nabladev.com,prodrive-technologies.com,altera.com,proton.me,googlemail.com,phytium.com.cn,posteo.net,amarulasolutions.com,openbsd.org,forissier.org,mediatek.com,bootlin.com,kontron.de,norik.com,cortina-access.com,nigauri.org,prevas.dk,vrull.eu,amd.com,analog.com,andestech.com,timesys.com,chromium.org,csgraf.de,gdsys.cc,gmx.de,quicinc.com,foss.arm.com,ew.tq-group.com,cherry.de,collabora.com,konsulko.com,wytron.com.tw,at.abb.com,gerhold.net,kwiboo.se,ni.com,marvell.com,intel.com,ziyao.cc,siemens.com,oss.qualcomm.com,baylibre.com,renesas.com,epam.com,mentallysanemainliners.org,ronetix.at,engicam.com,KoCoConnector.com,blueri.se,postmarke
 tos.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 7CA25E5CF5
X-Rspamd-Action: no action

On Tue Feb 3, 2026 at 5:12 PM IST, Peng Fan wrote:
>> Subject: [PATCH 00/14] treewide: Clean up usage of
>> DECLARE_GLOBAL_DATA_PTR
>
> B4 fails to send the last 2 patches. And I am not sure how to send
> patch 13 and 14 in the same thread. So just resend, but seems
> resend still fails for patch 13 and 14. (:

You can manually add an 'In-Reply-To: <Message id for the cover letter>'
to each of the leftover patches, git send-email should pick it up :)

>
> Regards
> Peng.
>
>> 
>> This patch set primarily removes unused DECLARE_GLOBAL_DATA_PTR
>> instances.
>> 
>> Many files declare DECLARE_GLOBAL_DATA_PTR and include
>> asm/global_data.h even though gd is never used. In these cases,
>> asm/global_data.h is effectively treated as a proxy header, which is not
>> a good practice.
>> 
>> Following the Include What You Use principle, files should include only
>> the headers they actually depend on, rather than relying on
>> global_data.h indirectly. This approach is also adopted in Linux kernel
>> [1].
>> 
>> The first few patches are prepartion to avoid building break after
>> remove the including of global_data.h.
>> 
>> A script is for filtering the files:
>> list=`find . -name "*.[ch]"`
>> for source in ${list}
>> do
>>         result=`sed -n '/DECLARE_GLOBAL_DATA_PTR/p' ${source}`
>>         if [ "${result}" == "DECLARE_GLOBAL_DATA_PTR;" ]; then
>>                 echo "Found in ${source}"
>> 
>>                 result=`sed -n '/\<gd\>/p' ${source}`
>>                 result2=`sed -n '/\<gd_/p' ${source}`
>>                 result3=`sed -n '/\<gd->/p' ${source}`
>>                 if [ "${result}" == "" ] && [ "${result2}" == "" ] && [ "${result3}"
>> == "" ];then
>>                         echo "Cleanup ${source}"
>>                         sed -i
>> '/DECLARE_GLOBAL_DATA_PTR/{N;/\n[[:space:]]*$/d;s/.*\n//;}'
>> ${source}
>>                         sed -i '/DECLARE_GLOBAL_DATA_PTR/d' ${source}
>>                         sed -i '/global_data.h/d' ${source}
>>                         git add ${source}
>>                 fi
>>         fi
>> done
>> 
>> [1]
>> https://lpc.events/event/17/contributions/1620/attachments/1228/25
>> 20/Linux%20Kernel%20Header%20Optimization.pdf
>> 
>> CI: https://source.denx.de/u-boot/custodians/u-boot-mmc/-
>> /pipelines/29177
>> 
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>> Peng Fan (14):
>>       beacon: imx8mm/n: Drop useless files
>>       mediatek: mt7622: Drop useless board files
>>       common: cli_hush: Include vsprintf.h
>>       cmd: mem: Include vsprintf.h
>>       test: log_filter: Include vsprintf.h
>>       xtensa: relocate: Add missing headers
>>       toradex: common: Add missing headers
>>       tegra: pmc: Cleanup headers
>>       rockchip: evk_rk3308: Cleanup headers
>>       nxp: emc2305: Cleanup headers
>>       pci: layerspace: Add missing header files
>>       renesas: common: Include asm-generic/u-boot.h
>>       socfpga: clock_manager_s10: Add missing header files
>>       treewide: Clean up DECLARE_GLOBAL_DATA_PTR usage
>> 
>>  arch/arc/lib/bootm.c                                        |  3 ---
>>  arch/arm/cpu/armv7/s5p4418/cpu.c                            |  3 ---
>>  arch/arm/mach-aspeed/ast2600/spl.c                          |  3 ---
>>  arch/arm/mach-imx/imx8/clock.c                              |  3 ---
>>  arch/arm/mach-imx/imx8/fdt.c                                |  3 ---
>>  arch/arm/mach-imx/imx8/iomux.c                              |  3 ---
>>  arch/arm/mach-imx/imx8m/clock_imx8mm.c                      |  3 ---
>>  arch/arm/mach-imx/imx8ulp/cgc.c                             |  3 ---
>>  arch/arm/mach-imx/imx8ulp/clock.c                           |  3 ---
>>  arch/arm/mach-imx/imx9/clock.c                              |  3 ---
>>  arch/arm/mach-imx/imx9/clock_root.c                         |  3 ---
>>  arch/arm/mach-imx/misc.c                                    |  3 ---
>>  arch/arm/mach-imx/spl_imx_romapi.c                          |  3 ---
>>  arch/arm/mach-meson/board-axg.c                             |  3 ---
>>  arch/arm/mach-meson/board-g12a.c                            |  3 ---
>>  arch/arm/mach-meson/board-gx.c                              |  3 ---
>>  arch/arm/mach-socfpga/clock_manager_agilex.c                |  3 ---
>>  arch/arm/mach-socfpga/clock_manager_agilex5.c               |  3 ---
>>  arch/arm/mach-socfpga/clock_manager_n5x.c                   |  3 ---
>>  arch/arm/mach-socfpga/clock_manager_s10.c                   |  5 ++---
>>  arch/arm/mach-socfpga/mailbox_s10.c                         |  3 ---
>>  arch/arm/mach-socfpga/misc_gen5.c                           |  3 ---
>>  arch/arm/mach-socfpga/misc_soc64.c                          |  3 ---
>>  arch/arm/mach-socfpga/mmu-arm64_s10.c                       |  3 ---
>>  arch/arm/mach-socfpga/reset_manager_s10.c                   |  3 ---
>>  arch/arm/mach-socfpga/spl_agilex.c                          |  3 ---
>>  arch/arm/mach-socfpga/spl_agilex5.c                         |  3 ---
>>  arch/arm/mach-socfpga/spl_agilex7m.c                        |  3 ---
>>  arch/arm/mach-socfpga/spl_gen5.c                            |  3 ---
>>  arch/arm/mach-socfpga/spl_n5x.c                             |  3 ---
>>  arch/arm/mach-socfpga/spl_s10.c                             |  3 ---
>>  arch/arm/mach-socfpga/system_manager_soc64.c                |  3 ---
>>  arch/arm/mach-tegra/pmc.c                                   |  4 +---
>>  arch/microblaze/lib/bootm.c                                 |  3 ---
>>  arch/mips/mach-ath79/qca956x/ddr.c                          |  3 ---
>>  arch/mips/mach-mscc/cpu.c                                   |  3 ---
>>  arch/mips/mach-mtmips/ddr_cal.c                             |  3 ---
>>  arch/mips/mach-octeon/cvmx-pko.c                            |  2 --
>>  arch/nios2/lib/bootm.c                                      |  3 ---
>>  arch/riscv/cpu/andes/spl.c                                  |  3 ---
>>  arch/riscv/cpu/cv1800b/dram.c                               |  3 ---
>>  arch/riscv/cpu/generic/dram.c                               |  3 ---
>>  arch/riscv/cpu/k230/dram.c                                  |  3 ---
>>  arch/riscv/cpu/th1520/spl.c                                 |  2 --
>>  arch/sh/lib/bootm.c                                         |  3 ---
>>  arch/x86/cpu/ivybridge/model_206ax.c                        |  3 ---
>>  arch/x86/lib/init_helpers.c                                 |  3 ---
>>  arch/x86/lib/zimage.c                                       |  3 ---
>>  arch/xtensa/lib/relocate.c                                  |  2 ++
>>  arch/xtensa/lib/time.c                                      |  3 ---
>>  board/BuR/brsmarc1/board.c                                  |  3 ---
>>  board/BuR/common/common.c                                   |  3 ---
>>  board/Marvell/octeontx/smc.c                                |  3 ---
>>  board/Marvell/octeontx2/smc.c                               |  3 ---
>>  board/advantech/imx8mp_rsb3720a1/imx8mp_rsb3720a1.c         |  2
>> --
>>  board/advantech/imx8mp_rsb3720a1/spl.c                      |  2 --
>>  board/advantech/imx8qm_dmsse20_a1/imx8qm_dmsse20_a1.c       |
>> 2 --
>>  board/advantech/imx8qm_rom7720_a1/imx8qm_rom7720_a1.c       |
>> 3 ---
>>  board/andestech/voyager/voyager.c                           |  3 ---
>>  board/armltd/vexpress64/vexpress64.c                        |  3 ---
>>  board/beacon/imx8mm/Makefile                                |  1 -
>>  board/beacon/imx8mm/imx8mm_beacon.c                         |  8 --------
>>  board/beacon/imx8mm/spl.c                                   |  3 ---
>>  board/beacon/imx8mn/Makefile                                |  1 -
>>  board/beacon/imx8mn/imx8mn_beacon.c                         |  8 --------
>>  board/beacon/imx8mn/spl.c                                   |  3 ---
>>  board/beacon/imx8mp/spl.c                                   |  3 ---
>>  board/beagle/beagleboneai64/beagleboneai64.c                |  2 --
>>  board/beagle/beagleplay/beagleplay.c                        |  2 --
>>  board/broadcom/bcmns/ns.c                                   |  3 ---
>>  board/cloos/imx8mm_phg/imx8mm_phg.c                         |  3 ---
>>  board/cloos/imx8mm_phg/spl.c                                |  3 ---
>>  board/compulab/imx8mm-cl-iot-gate/spl.c                     |  2 --
>>  board/coreboot/coreboot/coreboot.c                          |  3 ---
>>  board/cssi/cmpc885/cmpc885.c                                |  2 --
>> 
>> board/data_modul/imx8mm_edm_sbc/imx8mm_data_modul_edm_sb
>> c.c |  2 --
>>  board/data_modul/imx8mm_edm_sbc/spl.c                       |  2 --
>> 
>> board/data_modul/imx8mp_edm_sbc/imx8mp_data_modul_edm_sbc.
>> c |  2 --
>>  board/data_modul/imx8mp_edm_sbc/spl.c                       |  2 --
>>  board/dhelectronics/dh_imx8mp/common.c                      |  2 --
>>  board/dhelectronics/dh_imx8mp/imx8mp_dhcom_pdk2.c           |  2 --
>>  board/dhelectronics/dh_imx8mp/spl.c                         |  2 --
>>  board/emcraft/imx8mp_navqp/spl.c                            |  3 ---
>>  board/emulation/qemu-riscv/qemu-riscv.c                     |  2 --
>>  board/engicam/imx8mm/icore_mx8mm.c                          |  2 --
>>  board/engicam/imx8mm/spl.c                                  |  2 --
>>  board/engicam/imx8mp/icore_mx8mp.c                          |  3 ---
>>  board/engicam/imx8mp/spl.c                                  |  3 ---
>>  board/gdsys/mpc8308/gazerbeam.c                             |  3 ---
>>  board/google/imx8mq_phanbell/imx8mq_phanbell.c              |  3 ---
>>  board/highbank/highbank.c                                   |  3 ---
>>  board/kontron/osm-s-mx8mp/osm-s-mx8mp.c                     |  3 ---
>>  board/kontron/osm-s-mx93/osm-s-mx93.c                       |  3 ---
>>  board/kontron/pitx_imx8m/pitx_imx8m.c                       |  2 --
>>  board/mediatek/mt7622/Makefile                              |  2 +-
>>  board/mediatek/mt7622/mt7622_rfb.c                          | 12 ------------
>>  board/mntre/imx8mq_reform2/imx8mq_reform2.c                 |  3 ---
>>  board/msc/sm2s_imx8mp/sm2s_imx8mp.c                         |  2 --
>>  board/msc/sm2s_imx8mp/spl.c                                 |  3 ---
>>  board/nxp/common/emc2305.c                                  |  4 +---
>>  board/nxp/imx8mm_evk/imx8mm_evk.c                           |  3 ---
>>  board/nxp/imx8mm_evk/spl.c                                  |  3 ---
>>  board/nxp/imx8mn_evk/spl.c                                  |  3 ---
>>  board/nxp/imx8mp_evk/spl.c                                  |  3 ---
>>  board/nxp/imx8qm_mek/imx8qm_mek.c                           |  3 ---
>>  board/nxp/imx8qxp_mek/imx8qxp_mek.c                         |  3 ---
>>  board/nxp/imx8ulp_evk/imx8ulp_evk.c                         |  2 --
>>  board/nxp/imx8ulp_evk/spl.c                                 |  2 --
>>  board/nxp/imx93_frdm/imx93_frdm.c                           |  3 ---
>>  board/phytec/imx8mp-libra-fpsc/spl.c                        |  3 ---
>>  board/phytec/phycore_imx8mm/phycore-imx8mm.c                |  3 ---
>>  board/phytec/phycore_imx8mm/spl.c                           |  3 ---
>>  board/phytec/phycore_imx8mp/phycore-imx8mp.c                |  3 ---
>>  board/phytec/phycore_imx8mp/spl.c                           |  3 ---
>>  board/phytec/phycore_imx93/phycore-imx93.c                  |  3 ---
>>  board/polyhex/imx8mp_debix_model_a/imx8mp_debix_model_a.c   |
>> 3 ---
>>  board/polyhex/imx8mp_debix_model_a/spl.c                    |  3 ---
>>  board/purism/librem5/librem5.c                              |  2 --
>>  board/purism/librem5/spl.c                                  |  2 --
>>  board/qualcomm/dragonboard410c/dragonboard410c.c            |  3 ---
>>  board/qualcomm/dragonboard820c/dragonboard820c.c            |  3 ---
>>  board/renesas/common/gen3-common.c                          |  4 +---
>>  board/renesas/common/gen4-common.c                          |  4 +---
>>  board/renesas/common/gen5-common.c                          |  4 +---
>>  board/rockchip/evb_rk3308/evb_rk3308.c                      |  5 ++---
>>  board/ronetix/imx8mq-cm/imx8mq_cm.c                         |  2 --
>>  board/samsung/common/exynos5-dt.c                           |  3 ---
>>  board/samsung/common/misc.c                                 |  3 ---
>>  board/st/stm32f429-discovery/stm32f429-discovery.c          |  3 ---
>>  board/st/stm32f429-evaluation/stm32f429-evaluation.c        |  3 ---
>>  board/st/stm32f469-discovery/stm32f469-discovery.c          |  3 ---
>>  board/st/stm32f746-disco/stm32f746-disco.c                  |  3 ---
>>  board/st/stm32h743-disco/stm32h743-disco.c                  |  3 ---
>>  board/st/stm32h743-eval/stm32h743-eval.c                    |  3 ---
>>  board/st/stm32h747-disco/stm32h747-disco.c                  |  3 ---
>>  board/st/stm32h750-art-pi/stm32h750-art-pi.c                |  3 ---
>>  board/technexion/pico-imx8mq/pico-imx8mq.c                  |  3 ---
>>  board/ti/am62x/evm.c                                        |  2 --
>>  board/ti/am64x/evm.c                                        |  2 --
>>  board/ti/j784s4/evm.c                                       |  2 --
>>  board/toradex/apalis-imx8/apalis-imx8.c                     |  3 ---
>>  board/toradex/apalis_t30/apalis_t30.c                       |  3 ---
>>  board/toradex/colibri-imx8x/colibri-imx8x.c                 |  3 ---
>>  board/toradex/colibri_t20/colibri_t20.c                     |  3 ---
>>  board/toradex/common/tdx-cfg-block.c                        |  3 ---
>>  board/toradex/common/tdx-cfg-block.h                        |  2 ++
>>  board/toradex/common/tdx-common.h                           |  2 ++
>>  board/toradex/smarc-imx8mp/smarc-imx8mp.c                   |  3 ---
>>  board/toradex/smarc-imx8mp/spl.c                            |  3 ---
>>  board/toradex/verdin-imx8mm/spl.c                           |  3 ---
>>  board/toradex/verdin-imx8mm/verdin-imx8mm.c                 |  3 ---
>>  board/toradex/verdin-imx8mp/spl.c                           |  3 ---
>>  board/toradex/verdin-imx8mp/verdin-imx8mp.c                 |  3 ---
>>  board/xilinx/zynq/bootimg.c                                 |  3 ---
>>  boot/bootmeth-uclass.c                                      |  2 --
>>  boot/fdt_simplefb.c                                         |  3 ---
>>  boot/image-sig.c                                            |  2 --
>>  boot/image.c                                                |  3 ---
>>  cmd/bloblist.c                                              |  3 ---
>>  cmd/bootefi.c                                               |  3 ---
>>  cmd/bootm.c                                                 |  3 ---
>>  cmd/date.c                                                  |  3 ---
>>  cmd/mem.c                                                   |  4 +---
>>  cmd/sound.c                                                 |  3 ---
>>  cmd/spl.c                                                   |  3 ---
>>  common/cli_hush.c                                           |  4 +---
>>  common/stdio.c                                              |  3 ---
>>  drivers/block/sandbox.c                                     |  3 ---
>>  drivers/bootcount/pmic_pfuze100.c                           |  2 --
>>  drivers/cache/sandbox_cache.c                               |  3 ---
>>  drivers/clk/altera/clk-agilex.c                             |  3 ---
>>  drivers/clk/altera/clk-agilex5.c                            |  3 ---
>>  drivers/clk/altera/clk-mem-n5x.c                            |  3 ---
>>  drivers/clk/altera/clk-n5x.c                                |  3 ---
>>  drivers/clk/rockchip/clk_px30.c                             |  3 ---
>>  drivers/clk/rockchip/clk_rk3308.c                           |  3 ---
>>  drivers/clk/rockchip/clk_rk3528.c                           |  2 --
>>  drivers/clk/rockchip/clk_rk3568.c                           |  2 --
>>  drivers/clk/rockchip/clk_rk3576.c                           |  2 --
>>  drivers/clk/rockchip/clk_rk3588.c                           |  2 --
>>  drivers/clk/rockchip/clk_rv1108.c                           |  3 ---
>>  drivers/clk/rockchip/clk_rv1126.c                           |  2 --
>>  drivers/cpu/bcm283x_cpu.c                                   |  3 ---
>>  drivers/cpu/cpu-uclass.c                                    |  2 --
>>  drivers/cpu/imx8_cpu.c                                      |  3 ---
>>  drivers/cpu/mtk_cpu.c                                       |  3 ---
>>  drivers/firmware/arm-ffa/arm-ffa-uclass.c                   |  3 ---
>>  drivers/firmware/arm-ffa/arm-ffa.c                          |  3 ---
>>  drivers/firmware/arm-ffa/ffa-emul-uclass.c                  |  3 ---
>>  drivers/firmware/arm-ffa/sandbox_ffa.c                      |  3 ---
>>  drivers/gpio/gpio-uclass.c                                  |  3 ---
>>  drivers/gpio/nx_gpio.c                                      |  3 ---
>>  drivers/i2c/mxc_i2c.c                                       |  3 ---
>>  drivers/i2c/nx_i2c.c                                        |  3 ---
>>  drivers/i2c/ocores_i2c.c                                    |  3 ---
>>  drivers/i2c/soft_i2c.c                                      |  3 ---
>>  drivers/i2c/synquacer_i2c.c                                 |  2 --
>>  drivers/mailbox/imx-mailbox.c                               |  2 --
>>  drivers/misc/atsha204a-i2c.c                                |  3 ---
>>  drivers/misc/fs_loader.c                                    |  3 ---
>>  drivers/misc/imx8/fuse.c                                    |  3 ---
>>  drivers/mmc/ca_dw_mmc.c                                     |  3 ---
>>  drivers/mmc/f_sdh30.c                                       |  2 --
>>  drivers/mmc/jz_mmc.c                                        |  3 ---
>>  drivers/mmc/msm_sdhci.c                                     |  3 ---
>>  drivers/mmc/mv_sdhci.c                                      |  3 ---
>>  drivers/mtd/nand/raw/pxa3xx_nand.c                          |  3 ---
>>  drivers/mtd/nand/raw/tegra_nand.c                           |  3 ---
>>  drivers/mtd/nvmxip/nvmxip_qspi.c                            |  3 ---
>>  drivers/mtd/spi/sf-uclass.c                                 |  3 ---
>>  drivers/net/dwmac_s700.c                                    |  3 ---
>>  drivers/net/fec_mxc.c                                       |  3 ---
>>  drivers/net/gmac_rockchip.c                                 |  2 --
>>  drivers/net/mvneta.c                                        |  3 ---
>>  drivers/net/octeontx/smi.c                                  |  3 ---
>>  drivers/net/phy/fixed.c                                     |  3 ---
>>  drivers/net/phy/phy.c                                       |  3 ---
>>  drivers/net/phy/xilinx_gmii2rgmii.c                         |  3 ---
>>  drivers/net/sandbox-raw.c                                   |  3 ---
>>  drivers/net/sandbox.c                                       |  3 ---
>>  drivers/net/ti/keystone_net.c                               |  3 ---
>>  drivers/net/xilinx_axi_emac.c                               |  3 ---
>>  drivers/pci/pci_octeontx.c                                  |  3 ---
>>  drivers/pci/pcie_dw_meson.c                                 |  3 ---
>>  drivers/pci/pcie_dw_qcom.c                                  |  3 ---
>>  drivers/pci/pcie_dw_rockchip.c                              |  3 ---
>>  drivers/pci/pcie_dw_ti.c                                    |  3 ---
>>  drivers/pci/pcie_layerscape.c                               |  3 ---
>>  drivers/pci/pcie_layerscape.h                               |  4 +++-
>>  drivers/pci/pcie_starfive_jh7110.c                          |  3 ---
>>  drivers/pci_endpoint/pci_ep-uclass.c                        |  3 ---
>>  drivers/phy/marvell/comphy_core.c                           |  3 ---
>>  drivers/phy/omap-usb2-phy.c                                 |  3 ---
>>  drivers/phy/rockchip/phy-rockchip-pcie.c                    |  3 ---
>>  drivers/phy/rockchip/phy-rockchip-typec.c                   |  3 ---
>>  drivers/pinctrl/mtmips/pinctrl-mt7628.c                     |  3 ---
>>  drivers/pinctrl/nexell/pinctrl-nexell.c                     |  3 ---
>>  drivers/pinctrl/nexell/pinctrl-s5pxx18.c                    |  3 ---
>>  drivers/pinctrl/nxp/pinctrl-imx-mmio.c                      |  3 ---
>>  drivers/pinctrl/nxp/pinctrl-imx.c                           |  3 ---
>>  drivers/pinctrl/nxp/pinctrl-imx8.c                          |  3 ---
>>  drivers/pinctrl/nxp/pinctrl-mxs.c                           |  3 ---
>>  drivers/power/domain/imx8m-power-domain.c                   |  3 ---
>>  drivers/power/pmic/bd71837.c                                |  3 ---
>>  drivers/power/pmic/mc34708.c                                |  3 ---
>>  drivers/power/pmic/mp5416.c                                 |  3 ---
>>  drivers/power/pmic/pca9450.c                                |  3 ---
>>  drivers/power/regulator/pwm_regulator.c                     |  3 ---
>>  drivers/pwm/pwm-sifive.c                                    |  3 ---
>>  drivers/pwm/rk_pwm.c                                        |  3 ---
>>  drivers/pwm/sunxi_pwm.c                                     |  3 ---
>>  drivers/ram/stm32mp1/stm32mp1_tests.c                       |  3 ---
>>  drivers/reboot-mode/reboot-mode-gpio.c                      |  2 --
>>  drivers/reboot-mode/reboot-mode-rtc.c                       |  2 --
>>  drivers/remoteproc/rproc-uclass.c                           |  2 --
>>  drivers/serial/ns16550.c                                    |  3 ---
>>  drivers/serial/sandbox.c                                    |  3 ---
>>  drivers/serial/serial_adi_uart4.c                           |  2 --
>>  drivers/serial/serial_htif.c                                |  3 ---
>>  drivers/serial/serial_xen.c                                 |  3 ---
>>  drivers/smem/msm_smem.c                                     |  3 ---
>>  drivers/spi/ca_sflash.c                                     |  3 ---
>>  drivers/spi/microchip_coreqspi.c                            |  2 --
>>  drivers/spi/mvebu_a3700_spi.c                               |  3 ---
>>  drivers/spi/omap3_spi.c                                     |  3 ---
>>  drivers/spi/spi-sunxi.c                                     |  3 ---
>>  drivers/spi/spi-synquacer.c                                 |  2 --
>>  drivers/spi/spi-uclass.c                                    |  3 ---
>>  drivers/spi/tegra210_qspi.c                                 |  3 ---
>>  drivers/spmi/spmi-msm.c                                     |  3 ---
>>  drivers/thermal/imx_tmu.c                                   |  3 ---
>>  drivers/timer/ostm_timer.c                                  |  3 ---
>>  drivers/timer/sp804_timer.c                                 |  3 ---
>>  drivers/usb/common/common.c                                 |  3 ---
>>  drivers/usb/phy/rockchip_usb2_phy.c                         |  3 ---
>>  drivers/usb/tcpm/tcpm.c                                     |  2 --
>>  drivers/video/hx8238d.c                                     |  2 --
>>  drivers/video/imx/mxc_ipuv3_fb.c                            |  3 ---
>>  drivers/video/nexell_display.c                              |  3 ---
>>  drivers/video/rockchip/rk_lvds.c                            |  3 ---
>>  drivers/video/rockchip/rk_mipi.c                            |  3 ---
>>  drivers/video/sandbox_sdl.c                                 |  3 ---
>>  drivers/video/tidss/tidss_drv.c                             |  2 --
>>  drivers/video/zynqmp/zynqmp_dpsub.c                         |  3 ---
>>  drivers/watchdog/armada-37xx-wdt.c                          |  3 ---
>>  drivers/watchdog/at91sam9_wdt.c                             |  3 ---
>>  drivers/watchdog/mt7621_wdt.c                               |  3 ---
>>  drivers/watchdog/orion_wdt.c                                |  3 ---
>>  drivers/watchdog/sbsa_gwdt.c                                |  3 ---
>>  drivers/watchdog/wdt-uclass.c                               |  3 ---
>>  fs/fs.c                                                     |  3 ---
>>  fs/ubifs/ubifs.c                                            |  3 ---
>>  include/relocate.h                                          |  2 --
>>  lib/efi_loader/efi_capsule.c                                |  3 ---
>>  lib/efi_loader/efi_gop.c                                    |  3 ---
>>  lib/efi_loader/efi_rng.c                                    |  3 ---
>>  net/eth-uclass.c                                            |  3 ---
>>  net/tftp.c                                                  |  3 ---
>>  net/wget.c                                                  |  3 ---
>>  test/cmd/exit.c                                             |  3 ---
>>  test/cmd/test_echo.c                                        |  3 ---
>>  test/cmd/test_pause.c                                       |  3 ---
>>  test/dm/blk.c                                               |  3 ---
>>  test/dm/i3c.c                                               |  2 --
>>  test/lib/test_print.c                                       |  3 ---
>>  test/log/log_filter.c                                       |  4 +---
>>  306 files changed, 22 insertions(+), 867 deletions(-)
>> ---
>> base-commit: 1de103fc29761fa729dffaa15d0cfb2766be05e4
>> change-id: 20260202-cleanup-560c900f7bc3
>> 
>> Best regards,
>> --
>> Peng Fan <peng.fan@nxp.com>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
