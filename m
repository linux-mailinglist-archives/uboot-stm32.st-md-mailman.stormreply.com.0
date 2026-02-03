Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFZWO6XtgWkFMAMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 13:44:21 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE71D9320
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 13:44:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D6C9C87EC6;
	Tue,  3 Feb 2026 12:44:21 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013042.outbound.protection.outlook.com
 [40.107.162.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 007EFC0693E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Feb 2026 12:44:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q2MW20DUY4k8HuFpX2y4AFVbrL0vehSEmMGscL6ExG31ylZKPVQ4qEBeJajIUcptBF73nfCjGVXZA7oXw3aqP7UNlqxLOB3sqPA1ZmI/dQNhQSJ9p5pZW843busUCXF1JnnOJh4Ef8EFezq8+syKBsV9gB9MyL+TBE5nQom+P2RnxD2IKbER0OIP3n2z1yJLQAwT8oS7lPVyXo1XF1Qti31ORO+SiG62fsSngVTIxd70/rl5Lv+UAAY0uQTg7wXCGQTTdSnl0MhoS5dFHAJBCK6MuKPISmacOntY8SjOni73QyZNII4rfXwhA94ukxkGOXRGcWmYCFNDbIrdVOB7HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fVjvcHqP4M1mGsGP+hH1ljbLDpuvUpUriDomEQBzRYM=;
 b=npiX+VBZoHM4jCohyD1L5X3MjA+nwVCY4kjWm93DEV50uTqjA4iiyzDddEXosDu2XM1og3ndvno/0BqC1ZEhLG2kquh5e751MFR8dPy9mqtLQyPolPid8ZhTH3YawiCD0OK79S8r1CByn19JQq/aNS7sRH2vBwNFXa6xfHyH3UmKF6ZsNgeewKJ7NBw4Kc4ThApJAz2wViFZOw7dQrBw6NAulPrrKXN/tghbbUKq7YfXh+4BXxN6BKm6xqE6nVjh56G/uUYutcoGPp36+5wxNwGEZqLhz9bbb3OJR3TOdiJ3ou6nUVuWLqkyZc94BjzLnxrqm3ogn4j2liILvFsHtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=oss.nxp.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fVjvcHqP4M1mGsGP+hH1ljbLDpuvUpUriDomEQBzRYM=;
 b=k2ww6DhVHXMhzj0HHbC0J0p5IHAg9o13ERefyo+0lz4gRD1N5MgMFPlynW2CgIKwoGcPJiPK/EB0PoSUuXQEwgEr40kuI+Gfqp7jLRVpBmuB1KxXcGzTe36Ll0+/4atYQAGdm1dzL+NliqcWSCbc23zxw4W5p7WpHUGNnowwIbbt9jaJjW6Sp/BFCEHDtiP0WDRL/2TEuKtyBF98iKzsu+Vl4itaExXHG/TaZKkLS2RcKuXIHB6R/M6qk+GkVOKNogRvdW2dNQd9H/e/O2DXtcFv31zdA3osc+uRajqTAn6JhBNY+d1Axsy3G+zyL5+jYm8SWIgl+kqYAfrsQBFWGA==
Received: from DB9PR05CA0004.eurprd05.prod.outlook.com (2603:10a6:10:1da::9)
 by PAVPR10MB7516.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2f7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 12:44:13 +0000
Received: from DB1PEPF000509F0.eurprd03.prod.outlook.com
 (2603:10a6:10:1da:cafe::20) by DB9PR05CA0004.outlook.office365.com
 (2603:10a6:10:1da::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Tue,
 3 Feb 2026 12:44:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509F0.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 12:44:12 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 3 Feb
 2026 13:45:47 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 3 Feb
 2026 13:44:01 +0100
Message-ID: <be446325-c4fb-40ba-8c57-8c6eb523276b@foss.st.com>
Date: Tue, 3 Feb 2026 13:44:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, <u-boot@lists.denx.de>, "Alexey
 Brodkin" <alexey.brodkin@synopsys.com>, Eugeniy Paltsev
 <Eugeniy.Paltsev@synopsys.com>, Tom Rini <trini@konsulko.com>, Stefan Bosch
 <stefan_b@posteo.net>, Ryan Chen <ryan_chen@aspeedtech.com>, Chia-Wei Wang
 <chiawei_wang@aspeedtech.com>, Aspeed BMC SW team <BMC-SW@aspeedtech.com>,
 Joel Stanley <joel@jms.id.au>, Stefano Babic <sbabic@nabladev.com>, "Fabio
 Estevam" <festevam@gmail.com>, NXP i.MX U-Boot Team <uboot-imx@nxp.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, Marek Vasut <marex@denx.de>,
 "Simon Goldschmidt" <simon.k.r.goldschmidt@gmail.com>, Tien Fong Chee
 <tien.fong.chee@altera.com>, Alif Zakuan Yuslaimi
 <alif.zakuan.yuslaimi@altera.com>, Michal Simek <michal.simek@amd.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>, Gregory CLEMENT
 <gregory.clement@bootlin.com>, Lars Povlsen <lars.povlsen@microchip.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>, Weijie Gao
 <weijie.gao@mediatek.com>, GSS_MTK_Uboot_upstream
 <GSS_MTK_Uboot_upstream@mediatek.com>, Aaron Williams
 <awilliams@marvell.com>, Thomas Chou <thomas@wytron.com.tw>, Rick Chen
 <rick@andestech.com>, Leo <ycliang@andestech.com>, Yao Zi <me@ziyao.cc>,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>, Simon Glass <sjg@chromium.org>,
 "Bin Meng" <bmeng.cn@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, "Wolfgang
 Wallner" <wolfgang.wallner@at.abb.com>, "Ying-Chun Liu (PaulLiu)"
 <paul.liu@linaro.org>, Oliver Graute <oliver.graute@kococonnector.com>,
 Randolph <randolph@andestech.com>, David Feng <fenghua@phytium.com.cn>,
 "Linus Walleij" <linusw@kernel.org>, Peter Hoyes <Peter.Hoyes@arm.com>, Liviu
 Dudau <liviu.dudau@foss.arm.com>, Adam Ford <aford173@gmail.com>, Nishanth
 Menon <nm@ti.com>, Robert Nelson <robertcnelson@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Gilles Talis <gilles.talis@gmail.com>, "Jagan
 Teki" <jagan@amarulasolutions.com>, Matteo Lisi <matteo.lisi@engicam.com>,
 Manoj Sai <abbaraju.manojsai@amarulasolutions.com>, Mario Six
 <mario.six@gdsys.cc>, Marco Franchi <marcofrk@gmail.com>, Alifer Moraes
 <alifer.wsdm@gmail.com>, Andre Przywara <andre.przywara@arm.com>, "Frieder
 Schrempf" <frieder.schrempf@kontron.de>, Heiko Thiery
 <heiko.thiery@gmail.com>, "Lukas F. Hartmann" <lukas@mntre.com>, "Patrick
 Wildt" <patrick@blueri.se>, Martyn Welch <martyn.welch@collabora.com>, Ian
 Ray <ian.ray@gehealthcare.com>, Peng Fan <peng.fan@nxp.com>, Teresa Remmet
 <t.remmet@phytec.de>, Mathieu Othacehe <m.othacehe@gmail.com>, "Christoph
 Stoidner" <c.stoidner@phytec.de>, Angus Ainslie <angus@akkea.ca>,
 "reviewer:PURISM LIBREM5 PHONE" <kernel@puri.sm>, Stephan Gerhold
 <stephan@gerhold.net>, Sam Day <me@samcday.com>, Casey Connolly
 <casey.connolly@linaro.org>, Sumit Garg <sumit.garg@kernel.org>, "Jorge
 Ramirez-Ortiz" <jorge.ramirez.ortiz@gmail.com>, Ilko Iliev
 <iliev@ronetix.at>, Kamil Lulko <kamil.lulko@gmail.com>, Patrick Delaunay
 <patrick.delaunay@foss.st.com>, Dario Binacchi
 <dario.binacchi@amarulasolutions.com>, Dillon Min <dillon.minfei@gmail.com>,
 Bryan Brattlof <bb@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Apurva
 Nandan" <a-nandan@ti.com>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Ilias Apalodimas
 <ilias.apalodimas@linaro.org>, Lukasz Majewski <lukma@denx.de>, "Philipp
 Tomsich" <philipp.tomsich@vrull.eu>, Kever Yang <kever.yang@rock-chips.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>, Abdellatif El Khlifi
 <abdellatif.elkhlifi@arm.com>, Heiko Schocher <hs@nabladev.com>, "Masahisa
 Kojima" <kojima.masahisa@socionext.com>, Alex Nemirovsky
 <alex.nemirovsky@cortina-access.com>, Jaehoon Chung <jh80.chung@samsung.com>, 
 Michael Trimarchi <michael@amarulasolutions.com>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Joe Hershberger <joe.hershberger@ni.com>, "Ramon
 Fried" <rfried.dev@gmail.com>, Jerome Forissier <jerome@forissier.org>,
 "Minda Chen" <minda.chen@starfivetech.com>, Hal Feng
 <hal.feng@starfivetech.com>, Stefan Roese <stefan.roese@mailbox.org>, Nathan
 Barrett-Morrison <nathan.morrison@timesys.com>, Greg Malysa
 <malysagreg@gmail.com>, "Ian Roberts" <ian.roberts@timesys.com>, Vasileios
 Bimpikas <vasileios.bimpikas@analog.com>, Utsav Agarwal
 <utsav.agarwal@analog.com>, Arturs Artamonovs <arturs.artamonovs@analog.com>, 
 Anastasiia Lukianenko <vicooodin@gmail.com>, Oleksandr Andrushchenko
 <oleksandr_andrushchenko@epam.com>, Thierry Reding <treding@nvidia.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Mateusz Kulikowski
 <mateusz.kulikowski@gmail.com>, Sebastian Reichel
 <sebastian.reichel@collabora.com>, Anatolij Gustschin
 <ag.dev.uboot@gmail.com>, Brian Sune <briansune@gmail.com>, Tingting Meng
 <tingting.meng@altera.com>, Boon Khai Ng <boon.khai.ng@altera.com>, "Mahesh
 Rao" <mahesh.rao@altera.com>, Ye Li <ye.li@nxp.com>, Naresh Kumar Ravulapalli
 <nareshkumar.ravulapalli@altera.com>, Jeremy Compostella
 <jeremy.compostella@intel.com>, Bernhard Messerklinger
 <bernhard.messerklinger@at.abb.com>, Debbie Horsfall
 <debbie.horsfall@arm.com>, Harrison Mutai <harrison.mutai@arm.com>, "Jonathan
 Humphreys" <j-humphreys@ti.com>, Mattijs Korpershoek
 <mkorpershoek@kernel.org>, Wadim Egorov <w.egorov@phytec.de>, Sam Protsenko
 <semen.protsenko@linaro.org>, Anshul Dalal <anshuld@ti.com>, Alice Guo
 <alice.guo@nxp.com>, Francesco Valla <francesco@valla.it>, "Mathieu
 Dubois-Briand" <mathieu.dubois-briand@bootlin.com>, Benjamin Hahn
 <B.Hahn@phytec.de>, Yannic Moog <y.moog@phytec.de>, Primoz Fiser
 <primoz.fiser@norik.com>, Hai Pham <hai.pham.ud@renesas.com>, "Guillaume La
 Roque (TI.com)" <glaroque@baylibre.com>, Vishal Mahaveer <vishalm@ti.com>,
 Keerthy <j-keerthy@ti.com>, Andrew Halaney <ahalaney@redhat.com>, "Vitor
 Soares" <vitor.soares@toradex.com>, Emanuele Ghidoli
 <emanuele.ghidoli@toradex.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
 Maxim Moskalets <maximmosk4@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 "Mark Kettenis" <kettenis@openbsd.org>, Adriano Cordova <adrianox@gmail.com>, 
 "Osama Abdelkader" <osama.abdelkader@gmail.com>, Rasmus Villemoes
 <ravi@prevas.dk>, Anton Moryakov <ant.v.moryakov@gmail.com>, Andrew Goodbody
 <andrew.goodbody@linaro.org>, Muhammad Hazim Izzat Zamri
 <muhammad.hazim.izzat.zamri@altera.com>, Quentin Schulz
 <quentin.schulz@cherry.de>, Joseph Chen <chenjh@rock-chips.com>, Finley Xiao
 <finley.xiao@rock-chips.com>, Elaine Zhang <zhangqing@rock-chips.com>, "Heiko
 Stuebner" <heiko@sntech.de>, David Zang <davidzangcs@gmail.com>, Viorel Suman
 <viorel.suman@nxp.com>, Sky Huang <SkyLake.Huang@mediatek.com>, Lucien.Jheng
 <lucienzx159@gmail.com>, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Varadarajan Narayanan <quic_varada@quicinc.com>, Alexander Feilke
 <alexander.feilke@ew.tq-group.com>, Markus Niebel
 <Markus.Niebel@ew.tq-group.com>, Alexander Stein
 <alexander.stein@ew.tq-group.com>, Christoph Fritz
 <chf.fritz@googlemail.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, "Sai
 Varun Venkatapuram" <saivarun.venkatapuram@amd.com>, E Shattow
 <e@freeshell.de>, Miquel Raynal <miquel.raynal@bootlin.com>, Paul Geurts
 <paul.geurts@prodrive-technologies.com>, =?UTF-8?Q?J=2E_Neusch=C3=A4fer?=
 <j.ne@posteo.net>, Aswin Murugan <aswin.murugan@oss.qualcomm.com>, "Eoin
 Dickson" <eoin.dickson@microchip.com>, Brian Ruley
 <brian.ruley@gehealthcare.com>, Swamil Jain <s-jain1@ti.com>, Zixun LI
 <admin@hifiphile.com>, Antonio Borneo <antonio.borneo@foss.st.com>, "Gabriel
 Dalimonte" <gabriel.dalimonte@gmail.com>, Sughosh Ganu
 <sughosh.ganu@linaro.org>, =?UTF-8?Q?Timo_tp_Prei=C3=9Fl?=
 <t.preissl@proton.me>, Alexander Graf <agraf@csgraf.de>, Alper Nebi Yasak
 <alpernebiyasak@gmail.com>, Alexander Sverdlin
 <alexander.sverdlin@siemens.com>, =?UTF-8?Q?Alvin_=C5=A0ipraga?=
 <alvin@pqrs.dk>, Leonard Anderweit <l.anderweit@phytec.de>, Dinesh Maniyam
 <dinesh.maniyam@altera.com>, "open list:ARC" <uboot-snps-arc@synopsys.com>,
 "open list:ARM AMLOGIC SOC SUPPORT" <u-boot-amlogic@groups.io>, "open list:DH
 electronics DHCOM i.MX8M Plus and matching c..." <u-boot@dh-electronics.com>, 
 "open list:Libra-i.MX 8M Plus" <upstream@lists.phytec.de>, "open list:ARM
 SNAPDRAGON" <u-boot-qcom@groups.io>, "moderated list:ARM STM STM32MP"
 <uboot-stm32@st-md-mailman.stormreply.com>, "open list:ARM SC5XX"
 <adsp-linux@analog.com>
References: <20260203114702.1867224-1-peng.fan@oss.nxp.com>
 <20260203114702.1867224-2-peng.fan@oss.nxp.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20260203114702.1867224-2-peng.fan@oss.nxp.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F0:EE_|PAVPR10MB7516:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d443c1b-e84a-4ef6-bcf9-08de6321ef21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|7416014|376014|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UVc0WExOZ0M2RGxZd2JUUVpkTjE1YlVZTCtBb1laRk9BenkvWWdTVVk1OW43?=
 =?utf-8?B?VkNnYzZqb2ZZM0JDNnd0bG9sUm1sMDR4YVFEMW92MWhxc1gwSGpQMHA4M0F6?=
 =?utf-8?B?dnZyNkVmM1c0WjZqS3lpZFdON1BWVk13dHBsNExFNVJYc2JtaVp5djJXS3FP?=
 =?utf-8?B?YW9lUlVjU2gwazhXK1hDSlhDazdNdDdUS3NVbDlVSVJ3VTJZWkdmakRacGRQ?=
 =?utf-8?B?ZUtxV3RWei9ZYk15Wk0rYWRwRXc1N0NXVDJLcHUzb0YwYnpXaGlYZllXN2J4?=
 =?utf-8?B?eUFMOTBkTHQ3VU5VK3FnbTA3ZHU3R044c21GZ2s4a0dUUG9vZzNuQlJXcGFZ?=
 =?utf-8?B?OWRudDZoQjduMERoWGtXQzNmS1VMRDdEQzFKY3dDcnlJMGhRZVNuN2VyNzJD?=
 =?utf-8?B?SHRkaVN1NzRIZVc5WFI2ckdMME15T2ZQMmlGaEJ5WUFSd0V4K2J2bi9aYUg1?=
 =?utf-8?B?eXJsdnI0a0M5T1RBYlFPNmozMXIvbm1NSzhLUUpJVTkrelJpTW5teTFpaUho?=
 =?utf-8?B?ajhOZlJ2RW9QYkNnYUtVQnppbXNzNFZjM21PWGpFeFRZa3Q4TUU4ZWZzdTJr?=
 =?utf-8?B?a2wzUFh2VUk0aWxEVkZudlZJOCtMdjVnQ1dCTFp0RG9KYllXVFI3YWVHc3U0?=
 =?utf-8?B?dEhvMkhlbEczVmdKQTRud0ZCZHlIbnBycVJVTkJkZFFleTlmMXltTUJsMTR4?=
 =?utf-8?B?elN4M0tqNkpjNC9tR0E3T3Z1dk1iNVlVYVZuZWhJclh6ODUrTVFLTnRuaTE4?=
 =?utf-8?B?TFBxSFV0Y0o2endnUnplcERkZTQ3YlNlQWQ1amFVUlVXN3lBKzg3NyswU0Z5?=
 =?utf-8?B?WWNJZlNkaGxFNGdEaUlaRXo3UUdsMWtjRFFlWnFFaGRkWGppYmJqdmNZd1FG?=
 =?utf-8?B?bzAwS0drUXZiZ1dqSU1BckNNbE5iM2ZlZ0hhWlhTV0J0Y2Q1a2Rhc3NvYStP?=
 =?utf-8?B?S21JaTZDT0Nqb0RzbnRrWXBPN01LT0grT2JaMXBPbkNFL01vcGtzT0pjb2xs?=
 =?utf-8?B?WnFVczVPWVJnYUNCMWRkZGFvdit0bjJJYkpnYmptR1RDazR5OEJNQUxJL1lV?=
 =?utf-8?B?dm9CSHVHV3RsTzdPUWIvQ1V4TnBxK0hFRSt3WTVOaDM3QXJrdVlPTzE3Lzd5?=
 =?utf-8?B?NGtCYlkzS0xCSFc0UFd4WFY5WURZNnkwelJxMGlaZURZSXJsTFBncVpLK29y?=
 =?utf-8?B?ZGhBYkw0Si84LzJaUm5LYmNpb0ZtcnhCZUl0VzlicUh6anM0ZUQ4OVdtVjFq?=
 =?utf-8?B?eVA3T0JSaDFkNmcvdVZGaXltSmZxOUFXOWo5MlNjVEhyeU5mZVZvZ2ZNbUhj?=
 =?utf-8?B?SUs0WndHQmFha0h2bVJMWUJ5NXlyYnNqR1JDVUsxUnpvU1BHVXYzK0llbVg3?=
 =?utf-8?B?blprNVBlS2NONlljeS9ZQ3dGR0w1Ykg2M1Uxa0hXWHhTblJZaGp2YmtSQjlS?=
 =?utf-8?B?ZGU5Q095eGQ1cFl6YXdaL1FHLzlTcm8rRlJFN3dTTHE0WVFvcHRNZVA1eEVs?=
 =?utf-8?B?ZDRQSkRXZXJobDZ5N2k0dk5VeUUwWWFBbUJ1dFpCWlc3TUlsajh6UjFZOHhz?=
 =?utf-8?B?a3Mxa3luYjdhUzhDTGFYWENTbVVwaVVhMURCb1k5YnduZFAvZEY0VWw3ZGNp?=
 =?utf-8?B?Z1ZVcTZiVlFuRjVmYlFDY25MNzFxRTFna3NIUW8xd3cxY3lDNmNBUjJTbTk2?=
 =?utf-8?B?UnAzOEsxNmJiLzI1ZnY0SXd3WjVSYVgxdUdCcnF4bUxmbXFvb1Bra3dTN2U5?=
 =?utf-8?B?bzJaYjg4NG9oYjRKOW82aFcwZnJmODViZDJxZ0luYjFNL1B0UExJVU5KcUN1?=
 =?utf-8?B?OFlMcmMxMy8veDVMTng2MUJuTUZ0U1FhZW1tREhQS0puUUl0NHdZUHU2RmZU?=
 =?utf-8?B?QytHeGN5VUlzUVlDbXJ6U0Z1aitMWUZ6d3hESnB4NUcwa1JMMXdnVFk5OGcw?=
 =?utf-8?B?S0RyT0d2ODc5V0hXa0IvRXo1TUJ4czEvQXpYTW44c1hzYWpyVHRyVURWb1hO?=
 =?utf-8?B?K2dKcTZCZVlpNHE4WHc4ZGFpOUNpbGRQWUlyM1hHWHFmZlNadk5DQ3VtRXRs?=
 =?utf-8?B?ekJRbTFkQTlWTGRybWRBUnkydEZsdDZvbU9iSFphZXlOaEh1cXgyMGl4U0VZ?=
 =?utf-8?B?UXpSR1hEbWx4NmQyRUxQaFlXVWxTYlo1UlphYXJQMkVDMzBIekxweWxNZWVa?=
 =?utf-8?B?Um9RM2s4a1cvQ0lhRmxSNkFKR1JycHFrZFlXeFVLVEkwMm9pcUpKVE5jbExi?=
 =?utf-8?Q?ydDAygZ+BlLSeQWZGZgEGSRaHT0JWrVQj2b404JxTM=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700013)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +oLmPEEqT7aMqOT6wB2KKaKGOIV/2G7i1xcclVWuqpmbxlcu4TlJv7Ooa0K5QZ/+Ykyye8kM9Y2di0KnTUu5mARjWYZlUvARnBg3G65XRBAc5zGKj9qkzchtMA88QtbJsXcdxz+FLwVNwtzsGJ3sReAOtKY9ozJuzgRvCl1CB6CDNcxw6DtxgtOCrn97HMHmwZ17N3FN1UhQWlm2JSInh7pDTr/8x5nnwiwYvEhvTmwJ5X7gIk3vnzwEXFtGGDTMsHSJVovki5UNpVWd6X0sYbKk0V49ySC2sdbd4mwVRZkgCZd1cUZKcilD+Lj31+TjuK9i5pKuCiIBWXdtgmPPs23e/sGOANIRmYkI7orGA6XY6AjyCnjD1JKUnPz/PkMJRd7ld7XBjDRS1aN/7rhohx3aDcREna9Fg+uRXtlUj9J3zP0NaMrheVc1DULhiJ3i
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 12:44:12.9018 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d443c1b-e84a-4ef6-bcf9-08de6321ef21
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7516
Subject: Re: [Uboot-stm32] [PATCH RESEND 14/14] treewide: Clean up
 DECLARE_GLOBAL_DATA_PTR usage
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:peng.fan@oss.nxp.com,m:u-boot@lists.denx.de,m:alexey.brodkin@synopsys.com,m:Eugeniy.Paltsev@synopsys.com,m:trini@konsulko.com,m:stefan_b@posteo.net,m:ryan_chen@aspeedtech.com,m:chiawei_wang@aspeedtech.com,m:BMC-SW@aspeedtech.com,m:joel@jms.id.au,m:sbabic@nabladev.com,m:festevam@gmail.com,m:uboot-imx@nxp.com,m:neil.armstrong@linaro.org,m:marex@denx.de,m:simon.k.r.goldschmidt@gmail.com,m:tien.fong.chee@altera.com,m:alif.zakuan.yuslaimi@altera.com,m:michal.simek@amd.com,m:daniel.schwierzeck@gmail.com,m:gregory.clement@bootlin.com,m:lars.povlsen@microchip.com,m:horatiu.vultur@microchip.com,m:weijie.gao@mediatek.com,m:GSS_MTK_Uboot_upstream@mediatek.com,m:awilliams@marvell.com,m:thomas@wytron.com.tw,m:rick@andestech.com,m:ycliang@andestech.com,m:me@ziyao.cc,m:iwamatsu@nigauri.org,m:sjg@chromium.org,m:bmeng.cn@gmail.com,m:jcmvbkbc@gmail.com,m:wolfgang.wallner@at.abb.com,m:paul.liu@linaro.org,m:oliver.graute@kococonnector.com,m:randolph@andestech.com,m:fenghua@phy
 tium.com.cn,m:linusw@kernel.org,m:Peter.Hoyes@arm.com,m:liviu.dudau@foss.arm.com,m:aford173@gmail.com,m:nm@ti.com,m:robertcnelson@gmail.com,m:christophe.leroy@csgroup.eu,m:gilles.talis@gmail.com,m:jagan@amarulasolutions.com,m:matteo.lisi@engicam.com,m:abbaraju.manojsai@amarulasolutions.com,m:mario.six@gdsys.cc,m:marcofrk@gmail.com,m:alifer.wsdm@gmail.com,m:andre.przywara@arm.com,m:frieder.schrempf@kontron.de,m:heiko.thiery@gmail.com,m:lukas@mntre.com,m:patrick@blueri.se,m:martyn.welch@collabora.com,m:ian.ray@gehealthcare.com,m:peng.fan@nxp.com,m:t.remmet@phytec.de,m:m.othacehe@gmail.com,m:c.stoidner@phytec.de,m:angus@akkea.ca,m:kernel@puri.sm,m:stephan@gerhold.net,m:me@samcday.com,m:casey.connolly@linaro.org,m:sumit.garg@kernel.org,m:jorge.ramirez.ortiz@gmail.com,m:iliev@ronetix.at,m:kamil.lulko@gmail.com,m:patrick.delaunay@foss.st.com,m:dario.binacchi@amarulasolutions.com,m:dillon.minfei@gmail.com,m:bb@ti.com,m:vigneshr@ti.com,m:a-nandan@ti.com,m:francesco.dolcini@toradex.com,m:xyp
 ron.glpk@gmx.de,m:ilias.apalodimas@linaro.org,m:lukma@denx.de,m:philipp.tomsich@vrull.eu,m:kever.yang@rock-chips.com,m:ryder.lee@mediatek.com,m:chunfeng.yun@mediatek.com,m:igor.belwon@mentallysanemainliners.org,m:abdellatif.elkhlifi@arm.com,m:hs@nabladev.com,m:kojima.masahisa@socionext.com,m:alex.nemirovsky@cortina-access.com,m:jh80.chung@samsung.com,m:michael@amarulasolutions.com,m:tudor.ambarus@linaro.org,m:joe.hershberger@ni.com,m:rfried.dev@gmail.com,m:jerome@forissier.org,m:minda.chen@starfivetech.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_TO(0.00)[oss.nxp.com,lists.denx.de,synopsys.com,konsulko.com,posteo.net,aspeedtech.com,jms.id.au,nabladev.com,gmail.com,nxp.com,linaro.org,denx.de,altera.com,amd.com,bootlin.com,microchip.com,mediatek.com,marvell.com,wytron.com.tw,andestech.com,ziyao.cc,nigauri.org,chromium.org,at.abb.com,kococonnector.com,phytium.com.cn,kernel.org,arm.com,foss.arm.com,ti.com,csgroup.eu,amarulasolutions.com,engicam.com,gdsys.cc,kontron.de,mntre.com,blueri.se,collabora.com,gehealthcare.com,phytec.de,akkea.ca,puri.sm,gerhold.net,samcday.com,ronetix.at,foss.st.com,toradex.com,gmx.de,vrull.eu,rock-chips.com,mentallysanemainliners.org,socionext.com,cortina-access.com,samsung.com,ni.com,forissier.org,starfivetech.com,mailbox.org,timesys.com,analog.com,epam.com,nvidia.com,intel.com,valla.it,norik.com,renesas.com,baylibre.com,redhat.com,ventanamicro.com,kwiboo.se,openbsd.org,prevas.dk,cherry.de,sntech.de,oss.qualcomm.com,quicinc.com,ew.tq-group.com,googlemail.com,freeshell.de,prodrive-technologies.
 com,hifiphile.com,proton.me,csgraf.de,siemens.com,pqrs.dk,groups.io,dh-electronics.com,lists.phytec.de,st-md-mailman.stormreply.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,nxp.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[195];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8CE71D9320
X-Rspamd-Action: no action



On 2/3/26 12:47, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Remove DECLARE_GLOBAL_DATA_PTR from files where gd is not used, and
> drop the unnecessary inclusion of asm/global_data.h.
> 
> Headers should be included directly by the files that need them,
> rather than indirectly via global_data.h.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

[...]
>  board/st/stm32f429-discovery/stm32f429-discovery.c          | 3 ---
>  board/st/stm32f429-evaluation/stm32f429-evaluation.c        | 3 ---
>  board/st/stm32f469-discovery/stm32f469-discovery.c          | 3 ---
>  board/st/stm32f746-disco/stm32f746-disco.c                  | 3 ---
>  board/st/stm32h743-disco/stm32h743-disco.c                  | 3 ---
>  board/st/stm32h743-eval/stm32h743-eval.c                    | 3 ---
>  board/st/stm32h747-disco/stm32h747-disco.c                  | 3 ---
>  board/st/stm32h750-art-pi/stm32h750-art-pi.c                | 3 ---
>  drivers/ram/stm32mp1/stm32mp1_tests.c                       | 3 ---

For STMicroelectronics boards and STM32MP1 ram test driver:

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>



Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
