Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CvGA/E7g2ngjwMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 04 Feb 2026 13:30:41 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF15E5CF6
	for <lists+uboot-stm32@lfdr.de>; Wed, 04 Feb 2026 13:30:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3CA67C87ECF;
	Wed,  4 Feb 2026 12:30:40 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012056.outbound.protection.outlook.com
 [40.107.200.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85119C58D7A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Feb 2026 04:53:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XM3PoRk+xVscVT1ADMHaL+rg/AYxWeIpXTp1n1Ou2JLYekgx/AykRQuVw3ddPV2m4T/H8QyeZbyKX5aaBWjaclZQXEcSdx94FR69HFrbE8mRnUSShClsa45U58AGQ1ftvuQWJXay1o6++6v1m9ATbJ5hW5LrP9D+J5qpoy7tElO3iP1D2jrQuMMlye48EwjtYAu0kStqzFeHex8OtsfiKGwE8xUmehwGJNhJkbkrWHb9AC/uBE0VyLPSdSbRZsj4OJ93Le8hufAryYKyhwJeMF4cZPivQBHxLQ3IVMKfZRdzrn9XvC6aNdyOguEkPQo8MFp7GaUNV/Ety3kNST23Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aiF/zoUtooD0BR3VQA5QuB6TV+w7JKUhW/3rCsYmMaU=;
 b=PcHXpY1rtw/WBTcioFcVUn/11PmAbRoKLRf0QfEcFKye7iA1MSxrzUg2aUa1kMkv7DsBN1g0O5MKwR70Pz6z6rkdupLsA20xIQduzJHcJEGIrFUozR+ughNQvkzCe1BizyPL37JE5DeZBDde5yr7D3H0GhMgI9v0V9QwYZjNSanYZUzD2fLsGjnLFhB0eU9Fwv12ZGKF0hjTwnGASwJ0/HUTcREKxDUW7D71iGaV51w9Z6Oke7VWp5XG7TzzvS3PmiIFkOWT8BcYlCiu2/yEg7vE4Xg/m+WJ0b/1VpM2S25yOf+sJr59ZyYS6IjQqQaX6mcs3cMH9ntFK9KRYzaSMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=analog.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aiF/zoUtooD0BR3VQA5QuB6TV+w7JKUhW/3rCsYmMaU=;
 b=GGU2/qYRhxMzpTawhb0EZi3UhXLdDIVwNm+QhPTy6l7p6GqQFZo7Kcd4h97nA9slfAbsggRx0gNCm7kOSq5ZBHQjw7/dxHndr1cQXSmO2BTqjzrJqFWK51+5aaHbzsN8Masku86Ymf1IsYVjwkeZzE2fiUesaGBbtZ+J3odbKV4=
Received: from SJ0PR05CA0030.namprd05.prod.outlook.com (2603:10b6:a03:33b::35)
 by CO1PR10MB4580.namprd10.prod.outlook.com (2603:10b6:303:98::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 04:53:11 +0000
Received: from SJ5PEPF000001D7.namprd05.prod.outlook.com
 (2603:10b6:a03:33b:cafe::d1) by SJ0PR05CA0030.outlook.office365.com
 (2603:10b6:a03:33b::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Wed,
 4 Feb 2026 04:53:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001D7.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 4 Feb 2026 04:53:11 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 22:53:10 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 22:52:39 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Feb 2026 22:52:39 -0600
Received: from localhost (ada0543016.dhcp.ti.com [172.24.233.9])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6144qbV3501178;
 Tue, 3 Feb 2026 22:52:37 -0600
MIME-Version: 1.0
Date: Wed, 4 Feb 2026 10:22:37 +0530
Message-ID: <DG5WPHBSHQPS.1VYPWTYYAMOXJ@ti.com>
From: Anshul Dalal <anshuld@ti.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, <u-boot@lists.denx.de>, "Alexey
 Brodkin" <alexey.brodkin@synopsys.com>, Eugeniy Paltsev
 <Eugeniy.Paltsev@synopsys.com>, Tom Rini <trini@konsulko.com>, Stefan Bosch
 <stefan_b@posteo.net>, Ryan Chen <ryan_chen@aspeedtech.com>, Chia-Wei Wang
 <chiawei_wang@aspeedtech.com>, Aspeed BMC SW team <BMC-SW@aspeedtech.com>,
 Joel Stanley <joel@jms.id.au>, Stefano Babic <sbabic@nabladev.com>, "Fabio
 Estevam" <festevam@gmail.com>, NXP i.MX U-Boot Team <uboot-imx@nxp.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Marek Vasut <marex@denx.de>, Simon
 Goldschmidt <simon.k.r.goldschmidt@gmail.com>, Tien Fong Chee
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
 Wildt" <patrick@blueri.se>, Martyn Welch <martyn.welch@collabora.com>, "Ian
 Ray" <ian.ray@gehealthcare.com>, Peng Fan <peng.fan@nxp.com>, Teresa Remmet
 <t.remmet@phytec.de>, Mathieu Othacehe <m.othacehe@gmail.com>, "Christoph
 Stoidner" <c.stoidner@phytec.de>, Angus Ainslie <angus@akkea.ca>,
 "reviewer:PURISM LIBREM5 PHONE" <kernel@puri.sm>, Stephan Gerhold
 <stephan@gerhold.net>, Sam Day <me@samcday.com>, Casey Connolly
 <casey.connolly@linaro.org>, Sumit Garg <sumit.garg@kernel.org>, "Jorge
 Ramirez-Ortiz" <jorge.ramirez.ortiz@gmail.com>, Ilko Iliev
 <iliev@ronetix.at>, Kamil Lulko <kamil.lulko@gmail.com>, Patrick Delaunay
 <patrick.delaunay@foss.st.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Dario Binacchi
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
 Rao" <mahesh.rao@altera.com>, Ye Li <ye.li@nxp.com>, "Naresh Kumar
 Ravulapalli" <nareshkumar.ravulapalli@altera.com>, Jeremy Compostella
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
 <quentin.schulz@cherry.de>, Joseph Chen <chenjh@rock-chips.com>, "Finley
 Xiao" <finley.xiao@rock-chips.com>, Elaine Zhang <zhangqing@rock-chips.com>,
 Heiko Stuebner <heiko@sntech.de>, David Zang <davidzangcs@gmail.com>, Viorel
 Suman <viorel.suman@nxp.com>, Sky Huang <SkyLake.Huang@mediatek.com>,
 Lucien.Jheng <lucienzx159@gmail.com>, "Loic Poulain"
 <loic.poulain@oss.qualcomm.com>, Varadarajan Narayanan
 <quic_varada@quicinc.com>, Alexander Feilke
 <alexander.feilke@ew.tq-group.com>, Markus Niebel
 <Markus.Niebel@ew.tq-group.com>, Alexander Stein
 <alexander.stein@ew.tq-group.com>, Christoph Fritz
 <chf.fritz@googlemail.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, "Sai
 Varun Venkatapuram" <saivarun.venkatapuram@amd.com>, E Shattow
 <e@freeshell.de>, Miquel Raynal <miquel.raynal@bootlin.com>, Paul Geurts
 <paul.geurts@prodrive-technologies.com>, =?utf-8?b?Si4gTmV1c2Now6RmZXI=?=
 <j.ne@posteo.net>, Aswin Murugan <aswin.murugan@oss.qualcomm.com>, "Eoin
 Dickson" <eoin.dickson@microchip.com>, Brian Ruley
 <brian.ruley@gehealthcare.com>, Swamil Jain <s-jain1@ti.com>, Zixun LI
 <admin@hifiphile.com>, Antonio Borneo <antonio.borneo@foss.st.com>, "Gabriel
 Dalimonte" <gabriel.dalimonte@gmail.com>, Sughosh Ganu
 <sughosh.ganu@linaro.org>, =?utf-8?q?Timo_tp_Prei=C3=9Fl?=
 <t.preissl@proton.me>, Alexander Graf <agraf@csgraf.de>, Alper Nebi Yasak
 <alpernebiyasak@gmail.com>, Alexander Sverdlin
 <alexander.sverdlin@siemens.com>, =?utf-8?q?Alvin_=C5=A0ipraga?=
 <alvin@pqrs.dk>, Leonard Anderweit <l.anderweit@phytec.de>, Dinesh Maniyam
 <dinesh.maniyam@altera.com>, "open list:ARC" <uboot-snps-arc@synopsys.com>,
 "open list:ARM AMLOGIC SOC SUPPORT" <u-boot-amlogic@groups.io>, "open list:DH
 electronics DHCOM i.MX8M Plus and matching c..." <u-boot@dh-electronics.com>, 
 "open list:Libra-i.MX 8M Plus" <upstream@lists.phytec.de>, "open list:ARM
 SNAPDRAGON" <u-boot-qcom@groups.io>, "moderated list:ARM STM STM32MP"
 <uboot-stm32@st-md-mailman.stormreply.com>, "open list:ARM SC5XX"
 <adsp-linux@analog.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260203114702.1867224-1-peng.fan@oss.nxp.com>
 <20260203114702.1867224-2-peng.fan@oss.nxp.com>
In-Reply-To: <20260203114702.1867224-2-peng.fan@oss.nxp.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D7:EE_|CO1PR10MB4580:EE_
X-MS-Office365-Filtering-Correlation-Id: c22d9581-cc39-4006-afc7-08de63a94c2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|7416014|376014|1800799024|36860700013|13003099007|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d1RDSW9HMENLOFQ0UUQ2Tyt1TWJ2TGdrMUFWK0pPZXVOQ1ZtV0RDa2YzTmlV?=
 =?utf-8?B?aU5UVkltd0JzTnh2Y2FnRnR5bElxcGttUG54WmNtRGVnREMzSzVWSlhkNDZC?=
 =?utf-8?B?NHVkeWgzbndmZGF5YXU1UzlPUE9SRzRxSVBqeEdqdk1SY3puUHpOdWJoQXJ2?=
 =?utf-8?B?S1VMaHI0SnZuSzBoMXJ2K25jZDRPSU93Tzd5NWlLL2RGYmthN1RUVG5vVTVV?=
 =?utf-8?B?d0lCU2JEQTYrK055THM3WWhxNU5DMTZQYWt5dTkrT0ZuL24zd2RsaUpDOFhY?=
 =?utf-8?B?ck1OendZbkdFKzAzNFc0cUJ5eTc0SlF0bVFjK2pjbjhrVTBPRG1ReW5hMmJp?=
 =?utf-8?B?SGlrd2JaM1NGZk1ZekZIaXJjS3hYYm5LbTFKOSs5alg1bURBUHoxUUQ5ZTJZ?=
 =?utf-8?B?bjRmZVpTQ2Iva1NNd3dPK3FzcEIxWHNsMEltRStBTytWTkZKK1VKWE0wTDBj?=
 =?utf-8?B?ZGpjZjRJbFZkTWFQWEMrMURTSGYza3kvTkM0Sm9YbXFyUjNGZzN0VVpnVmRt?=
 =?utf-8?B?QXp5Nk1PNnduallYZ0JWTzdNT0trK2JWWTJYZng0aVZUTElhdnJ1VHB0dXAv?=
 =?utf-8?B?b0sreDNBdzI3eWpLcnUwZTNkNVdzMmdaa1ZBTnk3d1h3aE5vKytCalhuV2c4?=
 =?utf-8?B?K1dFSXVyTkxmR294cTFnRnVURUgrNXVGdHpTS2FKN0VqL0IxOXB6azBIN05N?=
 =?utf-8?B?TnJQcHJ0SjBpd05sdEJUb3pEUjRNSk5vc2VDWlc0SDF5SUVQQm5kWldDKzFC?=
 =?utf-8?B?ekZxQWhKVDU2ak5UNnZSc2V2OHhUNXpUaVNWWjRyZk1GMTBCdmljRjJTbmds?=
 =?utf-8?B?YkFjcjY3eXd1amxvMWhZUVFHZS9RckxBeHlBNC9BM2QyUHZyM21qNHhteTBN?=
 =?utf-8?B?ZmZpRit4cVBIQ01XQ2JCUlp1ckYydlUrUzFBMFhyU3Z1eGFraURCNDRQTmJi?=
 =?utf-8?B?WWkvUzJWajF2TmFPaWxFeU5RNDUwSzdQNXJQZ093VHExRXZ4Y2N5SmpnRVpZ?=
 =?utf-8?B?UmkwK3JKandzS0RnU3pSamRUY013b2pna1FPeklmM2FHMzZXQjBOaFRIK1Ri?=
 =?utf-8?B?YnBad2c2YmJBY3QvMXNuL1FIa1RaTURQSjBMaENMZGpqZkZqczFaRDhTWkM3?=
 =?utf-8?B?SnQ3NVBYNFpzT1JRQjNmM1YvUExRNzlZQjRLUzRrN2ExTUhUVTNoQ3N4aEhk?=
 =?utf-8?B?UWdTN2JjMjd5TldFN2xxWFBwZWEwcjhvV3doaDA3SnBzbXo3aXBJUzJrbE9F?=
 =?utf-8?B?VEdPa2xINkorSS96L0U3bitIMnVsTmEwZmpsVDBOYk13U09ETDUzYnF4SzZi?=
 =?utf-8?B?U1VaKy9Yd1lwbVp5M1RFSEZCbzhjellXQ3hZWFhPYWtPZ1IyYmRhQXFZN2xM?=
 =?utf-8?B?Sno1dWtraTY0QTB5VWNtSUZFTmR3eERRNHIyc3U2RUNMeVZ4SEJ2ODlTQ3c0?=
 =?utf-8?B?OFVYQ00vbkJ3eU8yMm1uUDdvelFKMnNjVDVES1Z2UnNoSHJ2Y3dQb0UzTnVX?=
 =?utf-8?B?QVhpQS9oSTZaZTNNWVBXdHVickJIdnZ3c015UDdlYTk4TEJiZnVQWitaTVNs?=
 =?utf-8?B?cWVMaU5MVFhHeFJlOWJzK3krRG5tRzNvZ0pneEFnZlcveVpVTlRMSzhOamx2?=
 =?utf-8?B?b0ovdHNoU0lsRHVHME1zQSt3RFhxakpWUmsvekNMU0dRVXNYUUMzQVFaUzdz?=
 =?utf-8?B?dVRyRnlhZDJwazQ0TDExN1N3ZG1BT1pTOHpRaVlJc2RiOThQQk1HTjlhMjcr?=
 =?utf-8?B?MnRKWS90dC9kd1g2TlJBTGt3d2pjYkpORjV1bEFOTDl0RWNsM0xUT1VGWmhG?=
 =?utf-8?B?QnduRzFDampQTG1YWUg3bVhDaW5ramFTcGxWTUE5OHRCTmY2RTNkVVN6N0ZX?=
 =?utf-8?B?MXA2S2Jjdm83MkM2c0pzUHVIWGdzeE9rVllEdE10ektPY2NUSTlUd2dQUUlV?=
 =?utf-8?B?WHY1QW9QQlhDUkNFVXlDNC8zZEFHSFgyc3VUcEd6bU1pSmg0RWUvRkVZYTBU?=
 =?utf-8?B?Tlh6bUMreGtwcG8wTFFpYWJjVFdHM0RMeDNTVk80alZoWDJST3ZtbEhmNTJ2?=
 =?utf-8?B?cUJmVWNCYzgrSExiSm1aMFAxUmd1VC95Q25DbGlVR1NodFh6VmJwZVZZVEEw?=
 =?utf-8?B?aEU3L1RhOWxOUXZFSWZTcGZKWUdBZW9oOUU4QzZtbGVabkF0TTl4ZERrSG8r?=
 =?utf-8?Q?36kRwgKKItvqXVy1qu0C1QQ=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet201.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013)(13003099007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: xH5Ip6R8uT4RBz7PzBLUgdShu16kjYCHVCjk+0wJzqCmmW5kKTe5pErxouQFu1tE1o0aeqe0QbWfW5qe/J6WxC3T/hWItW3oPJmToasW1dt9ldnF6UY8qqwwzGnSg0oEJnnYN4+510ooxXpVxymPZ8SmRXu4hSUTy+S0nEJVsv0AchG7MboCgG6AxZlB7UManGvISPp6FTVmMWhJLBqMFUN+S+xBkDF5sOJo09N4i+YMHC44tIqwzdz8UmUwaesxSJmuDesDt4qnuGxVb3XgbHMK6YG92ueg3hRZcxq7wIcFdENtkNY83yQz33u1UO8deHUrbYtOAjk2Cg1zQAgmGysCGVG1tCq+nZ4LQMBA6OQdFYQKq2le47/OXW1KuMrda7lU5QBdzgetcllZTIYDH/iuCa+vxmGDT1AypkAIyIVDLSuWpKt57Di/HWrXOl9B
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 04:53:11.0902 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c22d9581-cc39-4006-afc7-08de63a94c2d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.195];
 Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4580
X-Mailman-Approved-At: Wed, 04 Feb 2026 12:30:39 +0000
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
X-Spamd-Result: default: False [5.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[ti.com : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[ti.com:s=selector1];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[anshuld@ti.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:peng.fan@oss.nxp.com,m:u-boot@lists.denx.de,m:alexey.brodkin@synopsys.com,m:Eugeniy.Paltsev@synopsys.com,m:trini@konsulko.com,m:stefan_b@posteo.net,m:ryan_chen@aspeedtech.com,m:chiawei_wang@aspeedtech.com,m:BMC-SW@aspeedtech.com,m:joel@jms.id.au,m:sbabic@nabladev.com,m:festevam@gmail.com,m:uboot-imx@nxp.com,m:neil.armstrong@linaro.org,m:marex@denx.de,m:simon.k.r.goldschmidt@gmail.com,m:tien.fong.chee@altera.com,m:alif.zakuan.yuslaimi@altera.com,m:michal.simek@amd.com,m:daniel.schwierzeck@gmail.com,m:gregory.clement@bootlin.com,m:lars.povlsen@microchip.com,m:horatiu.vultur@microchip.com,m:weijie.gao@mediatek.com,m:GSS_MTK_Uboot_upstream@mediatek.com,m:awilliams@marvell.com,m:thomas@wytron.com.tw,m:rick@andestech.com,m:ycliang@andestech.com,m:me@ziyao.cc,m:iwamatsu@nigauri.org,m:sjg@chromium.org,m:bmeng.cn@gmail.com,m:jcmvbkbc@gmail.com,m:wolfgang.wallner@at.abb.com,m:paul.liu@linaro.org,m:oliver.graute@kococonnector.com,m:randolph@andestech.com,m:fenghua@phy
 tium.com.cn,m:linusw@kernel.org,m:Peter.Hoyes@arm.com,m:liviu.dudau@foss.arm.com,m:aford173@gmail.com,m:nm@ti.com,m:robertcnelson@gmail.com,m:christophe.leroy@csgroup.eu,m:gilles.talis@gmail.com,m:jagan@amarulasolutions.com,m:matteo.lisi@engicam.com,m:abbaraju.manojsai@amarulasolutions.com,m:mario.six@gdsys.cc,m:marcofrk@gmail.com,m:alifer.wsdm@gmail.com,m:andre.przywara@arm.com,m:frieder.schrempf@kontron.de,m:heiko.thiery@gmail.com,m:lukas@mntre.com,m:patrick@blueri.se,m:martyn.welch@collabora.com,m:ian.ray@gehealthcare.com,m:peng.fan@nxp.com,m:t.remmet@phytec.de,m:m.othacehe@gmail.com,m:c.stoidner@phytec.de,m:angus@akkea.ca,m:kernel@puri.sm,m:stephan@gerhold.net,m:me@samcday.com,m:casey.connolly@linaro.org,m:sumit.garg@kernel.org,m:jorge.ramirez.ortiz@gmail.com,m:iliev@ronetix.at,m:kamil.lulko@gmail.com,m:patrick.delaunay@foss.st.com,m:patrice.chotard@foss.st.com,m:dario.binacchi@amarulasolutions.com,m:dillon.minfei@gmail.com,m:bb@ti.com,m:vigneshr@ti.com,m:a-nandan@ti.com,m:franc
 esco.dolcini@toradex.com,m:xypron.glpk@gmx.de,m:ilias.apalodimas@linaro.org,m:lukma@denx.de,m:philipp.tomsich@vrull.eu,m:kever.yang@rock-chips.com,m:ryder.lee@mediatek.com,m:chunfeng.yun@mediatek.com,m:igor.belwon@mentallysanemainliners.org,m:abdellatif.elkhlifi@arm.com,m:hs@nabladev.com,m:kojima.masahisa@socionext.com,m:alex.nemirovsky@cortina-access.com,m:jh80.chung@samsung.com,m:michael@amarulasolutions.com,m:tudor.ambarus@linaro.org,m:joe.hershberger@ni.com,m:rfried.dev@gmail.com,m:jerome@forissier.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_TO(0.00)[oss.nxp.com,lists.denx.de,synopsys.com,konsulko.com,posteo.net,aspeedtech.com,jms.id.au,nabladev.com,gmail.com,nxp.com,linaro.org,denx.de,altera.com,amd.com,bootlin.com,microchip.com,mediatek.com,marvell.com,wytron.com.tw,andestech.com,ziyao.cc,nigauri.org,chromium.org,at.abb.com,kococonnector.com,phytium.com.cn,kernel.org,arm.com,foss.arm.com,ti.com,csgroup.eu,amarulasolutions.com,engicam.com,gdsys.cc,kontron.de,mntre.com,blueri.se,collabora.com,gehealthcare.com,phytec.de,akkea.ca,puri.sm,gerhold.net,samcday.com,ronetix.at,foss.st.com,toradex.com,gmx.de,vrull.eu,rock-chips.com,mentallysanemainliners.org,socionext.com,cortina-access.com,samsung.com,ni.com,forissier.org,starfivetech.com,mailbox.org,timesys.com,analog.com,epam.com,nvidia.com,intel.com,valla.it,norik.com,renesas.com,baylibre.com,redhat.com,ventanamicro.com,kwiboo.se,openbsd.org,prevas.dk,cherry.de,sntech.de,oss.qualcomm.com,quicinc.com,ew.tq-group.com,googlemail.com,freeshell.de,prodrive-technologies.
 com,hifiphile.com,proton.me,csgraf.de,siemens.com,pqrs.dk,groups.io,dh-electronics.com,lists.phytec.de,st-md-mailman.stormreply.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:mid,ti.com:email,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,spdx.org:url,gaisler.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[196];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anshuld@ti.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[ti.com:-];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 8FF15E5CF6
X-Rspamd-Action: no action

On Tue Feb 3, 2026 at 5:17 PM IST, Peng Fan (OSS) wrote:
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
>  arch/arc/lib/bootm.c                                        | 3 ---
>  arch/arm/cpu/armv7/s5p4418/cpu.c                            | 3 ---
>  arch/arm/mach-aspeed/ast2600/spl.c                          | 3 ---
>  arch/arm/mach-imx/imx8/clock.c                              | 3 ---
>  arch/arm/mach-imx/imx8/fdt.c                                | 3 ---
>  arch/arm/mach-imx/imx8/iomux.c                              | 3 ---
>  arch/arm/mach-imx/imx8m/clock_imx8mm.c                      | 3 ---
>  arch/arm/mach-imx/imx8ulp/cgc.c                             | 3 ---
>  arch/arm/mach-imx/imx8ulp/clock.c                           | 3 ---
>  arch/arm/mach-imx/imx9/clock.c                              | 3 ---
>  arch/arm/mach-imx/imx9/clock_root.c                         | 3 ---
>  arch/arm/mach-imx/misc.c                                    | 3 ---
>  arch/arm/mach-imx/spl_imx_romapi.c                          | 3 ---
>  arch/arm/mach-meson/board-axg.c                             | 3 ---
>  arch/arm/mach-meson/board-g12a.c                            | 3 ---
>  arch/arm/mach-meson/board-gx.c                              | 3 ---
>  arch/arm/mach-socfpga/clock_manager_agilex.c                | 3 ---
>  arch/arm/mach-socfpga/clock_manager_agilex5.c               | 3 ---
>  arch/arm/mach-socfpga/clock_manager_n5x.c                   | 3 ---
>  arch/arm/mach-socfpga/clock_manager_s10.c                   | 3 ---
>  arch/arm/mach-socfpga/mailbox_s10.c                         | 3 ---
>  arch/arm/mach-socfpga/misc_gen5.c                           | 3 ---
>  arch/arm/mach-socfpga/misc_soc64.c                          | 3 ---
>  arch/arm/mach-socfpga/mmu-arm64_s10.c                       | 3 ---
>  arch/arm/mach-socfpga/reset_manager_s10.c                   | 3 ---
>  arch/arm/mach-socfpga/spl_agilex.c                          | 3 ---
>  arch/arm/mach-socfpga/spl_agilex5.c                         | 3 ---
>  arch/arm/mach-socfpga/spl_agilex7m.c                        | 3 ---
>  arch/arm/mach-socfpga/spl_gen5.c                            | 3 ---
>  arch/arm/mach-socfpga/spl_n5x.c                             | 3 ---
>  arch/arm/mach-socfpga/spl_s10.c                             | 3 ---
>  arch/arm/mach-socfpga/system_manager_soc64.c                | 3 ---
>  arch/microblaze/lib/bootm.c                                 | 3 ---
>  arch/mips/mach-ath79/qca956x/ddr.c                          | 3 ---
>  arch/mips/mach-mscc/cpu.c                                   | 3 ---
>  arch/mips/mach-mtmips/ddr_cal.c                             | 3 ---
>  arch/mips/mach-octeon/cvmx-pko.c                            | 2 --
>  arch/nios2/lib/bootm.c                                      | 3 ---
>  arch/riscv/cpu/andes/spl.c                                  | 3 ---
>  arch/riscv/cpu/cv1800b/dram.c                               | 3 ---
>  arch/riscv/cpu/generic/dram.c                               | 3 ---
>  arch/riscv/cpu/k230/dram.c                                  | 3 ---
>  arch/riscv/cpu/th1520/spl.c                                 | 2 --
>  arch/sh/lib/bootm.c                                         | 3 ---
>  arch/x86/cpu/ivybridge/model_206ax.c                        | 3 ---
>  arch/x86/lib/init_helpers.c                                 | 3 ---
>  arch/x86/lib/zimage.c                                       | 3 ---
>  arch/xtensa/lib/time.c                                      | 3 ---
>  board/BuR/brsmarc1/board.c                                  | 3 ---
>  board/BuR/common/common.c                                   | 3 ---
>  board/Marvell/octeontx/smc.c                                | 3 ---
>  board/Marvell/octeontx2/smc.c                               | 3 ---
>  board/advantech/imx8mp_rsb3720a1/imx8mp_rsb3720a1.c         | 2 --
>  board/advantech/imx8mp_rsb3720a1/spl.c                      | 2 --
>  board/advantech/imx8qm_dmsse20_a1/imx8qm_dmsse20_a1.c       | 2 --
>  board/advantech/imx8qm_rom7720_a1/imx8qm_rom7720_a1.c       | 3 ---
>  board/andestech/voyager/voyager.c                           | 3 ---
>  board/armltd/vexpress64/vexpress64.c                        | 3 ---
>  board/beacon/imx8mm/spl.c                                   | 3 ---
>  board/beacon/imx8mn/spl.c                                   | 3 ---
>  board/beacon/imx8mp/spl.c                                   | 3 ---
>  board/beagle/beagleboneai64/beagleboneai64.c                | 2 --
>  board/beagle/beagleplay/beagleplay.c                        | 2 --
>  board/broadcom/bcmns/ns.c                                   | 3 ---
>  board/cloos/imx8mm_phg/imx8mm_phg.c                         | 3 ---
>  board/cloos/imx8mm_phg/spl.c                                | 3 ---
>  board/compulab/imx8mm-cl-iot-gate/spl.c                     | 2 --
>  board/coreboot/coreboot/coreboot.c                          | 3 ---
>  board/cssi/cmpc885/cmpc885.c                                | 2 --
>  board/data_modul/imx8mm_edm_sbc/imx8mm_data_modul_edm_sbc.c | 2 --
>  board/data_modul/imx8mm_edm_sbc/spl.c                       | 2 --
>  board/data_modul/imx8mp_edm_sbc/imx8mp_data_modul_edm_sbc.c | 2 --
>  board/data_modul/imx8mp_edm_sbc/spl.c                       | 2 --
>  board/dhelectronics/dh_imx8mp/common.c                      | 2 --
>  board/dhelectronics/dh_imx8mp/imx8mp_dhcom_pdk2.c           | 2 --
>  board/dhelectronics/dh_imx8mp/spl.c                         | 2 --
>  board/emcraft/imx8mp_navqp/spl.c                            | 3 ---
>  board/emulation/qemu-riscv/qemu-riscv.c                     | 2 --
>  board/engicam/imx8mm/icore_mx8mm.c                          | 2 --
>  board/engicam/imx8mm/spl.c                                  | 2 --
>  board/engicam/imx8mp/icore_mx8mp.c                          | 3 ---
>  board/engicam/imx8mp/spl.c                                  | 3 ---
>  board/gdsys/mpc8308/gazerbeam.c                             | 3 ---
>  board/google/imx8mq_phanbell/imx8mq_phanbell.c              | 3 ---
>  board/highbank/highbank.c                                   | 3 ---
>  board/kontron/osm-s-mx8mp/osm-s-mx8mp.c                     | 3 ---
>  board/kontron/osm-s-mx93/osm-s-mx93.c                       | 3 ---
>  board/kontron/pitx_imx8m/pitx_imx8m.c                       | 2 --
>  board/mntre/imx8mq_reform2/imx8mq_reform2.c                 | 3 ---
>  board/msc/sm2s_imx8mp/sm2s_imx8mp.c                         | 2 --
>  board/msc/sm2s_imx8mp/spl.c                                 | 3 ---
>  board/nxp/imx8mm_evk/imx8mm_evk.c                           | 3 ---
>  board/nxp/imx8mm_evk/spl.c                                  | 3 ---
>  board/nxp/imx8mn_evk/spl.c                                  | 3 ---
>  board/nxp/imx8mp_evk/spl.c                                  | 3 ---
>  board/nxp/imx8qm_mek/imx8qm_mek.c                           | 3 ---
>  board/nxp/imx8qxp_mek/imx8qxp_mek.c                         | 3 ---
>  board/nxp/imx8ulp_evk/imx8ulp_evk.c                         | 2 --
>  board/nxp/imx8ulp_evk/spl.c                                 | 2 --
>  board/nxp/imx93_frdm/imx93_frdm.c                           | 3 ---
>  board/phytec/imx8mp-libra-fpsc/spl.c                        | 3 ---
>  board/phytec/phycore_imx8mm/phycore-imx8mm.c                | 3 ---
>  board/phytec/phycore_imx8mm/spl.c                           | 3 ---
>  board/phytec/phycore_imx8mp/phycore-imx8mp.c                | 3 ---
>  board/phytec/phycore_imx8mp/spl.c                           | 3 ---
>  board/phytec/phycore_imx93/phycore-imx93.c                  | 3 ---
>  board/polyhex/imx8mp_debix_model_a/imx8mp_debix_model_a.c   | 3 ---
>  board/polyhex/imx8mp_debix_model_a/spl.c                    | 3 ---
>  board/purism/librem5/librem5.c                              | 2 --
>  board/purism/librem5/spl.c                                  | 2 --
>  board/qualcomm/dragonboard410c/dragonboard410c.c            | 3 ---
>  board/qualcomm/dragonboard820c/dragonboard820c.c            | 3 ---
>  board/renesas/common/gen3-common.c                          | 3 ---
>  board/renesas/common/gen4-common.c                          | 3 ---
>  board/renesas/common/gen5-common.c                          | 3 ---
>  board/ronetix/imx8mq-cm/imx8mq_cm.c                         | 2 --
>  board/samsung/common/exynos5-dt.c                           | 3 ---
>  board/samsung/common/misc.c                                 | 3 ---
>  board/st/stm32f429-discovery/stm32f429-discovery.c          | 3 ---
>  board/st/stm32f429-evaluation/stm32f429-evaluation.c        | 3 ---
>  board/st/stm32f469-discovery/stm32f469-discovery.c          | 3 ---
>  board/st/stm32f746-disco/stm32f746-disco.c                  | 3 ---
>  board/st/stm32h743-disco/stm32h743-disco.c                  | 3 ---
>  board/st/stm32h743-eval/stm32h743-eval.c                    | 3 ---
>  board/st/stm32h747-disco/stm32h747-disco.c                  | 3 ---
>  board/st/stm32h750-art-pi/stm32h750-art-pi.c                | 3 ---
>  board/technexion/pico-imx8mq/pico-imx8mq.c                  | 3 ---
>  board/ti/am62x/evm.c                                        | 2 --
>  board/ti/am64x/evm.c                                        | 2 --
>  board/ti/j784s4/evm.c                                       | 2 --

For board/ti/*:

Tested-by: Anshul Dalal <anshuld@ti.com>

>  board/toradex/apalis-imx8/apalis-imx8.c                     | 3 ---
>  board/toradex/apalis_t30/apalis_t30.c                       | 3 ---
>  board/toradex/colibri-imx8x/colibri-imx8x.c                 | 3 ---
>  board/toradex/colibri_t20/colibri_t20.c                     | 3 ---
>  board/toradex/common/tdx-cfg-block.c                        | 3 ---
>  board/toradex/smarc-imx8mp/smarc-imx8mp.c                   | 3 ---
>  board/toradex/smarc-imx8mp/spl.c                            | 3 ---
>  board/toradex/verdin-imx8mm/spl.c                           | 3 ---
>  board/toradex/verdin-imx8mm/verdin-imx8mm.c                 | 3 ---
>  board/toradex/verdin-imx8mp/spl.c                           | 3 ---
>  board/toradex/verdin-imx8mp/verdin-imx8mp.c                 | 3 ---
>  board/xilinx/zynq/bootimg.c                                 | 3 ---
>  boot/bootmeth-uclass.c                                      | 2 --
>  boot/fdt_simplefb.c                                         | 3 ---
>  boot/image-sig.c                                            | 2 --
>  boot/image.c                                                | 3 ---
>  cmd/bloblist.c                                              | 3 ---
>  cmd/bootefi.c                                               | 3 ---
>  cmd/bootm.c                                                 | 3 ---
>  cmd/date.c                                                  | 3 ---
>  cmd/mem.c                                                   | 3 ---
>  cmd/sound.c                                                 | 3 ---
>  cmd/spl.c                                                   | 3 ---
>  common/cli_hush.c                                           | 3 ---
>  common/stdio.c                                              | 3 ---
>  drivers/block/sandbox.c                                     | 3 ---
>  drivers/bootcount/pmic_pfuze100.c                           | 2 --
>  drivers/cache/sandbox_cache.c                               | 3 ---
>  drivers/clk/altera/clk-agilex.c                             | 3 ---
>  drivers/clk/altera/clk-agilex5.c                            | 3 ---
>  drivers/clk/altera/clk-mem-n5x.c                            | 3 ---
>  drivers/clk/altera/clk-n5x.c                                | 3 ---
>  drivers/clk/rockchip/clk_px30.c                             | 3 ---
>  drivers/clk/rockchip/clk_rk3308.c                           | 3 ---
>  drivers/clk/rockchip/clk_rk3528.c                           | 2 --
>  drivers/clk/rockchip/clk_rk3568.c                           | 2 --
>  drivers/clk/rockchip/clk_rk3576.c                           | 2 --
>  drivers/clk/rockchip/clk_rk3588.c                           | 2 --
>  drivers/clk/rockchip/clk_rv1108.c                           | 3 ---
>  drivers/clk/rockchip/clk_rv1126.c                           | 2 --
>  drivers/cpu/bcm283x_cpu.c                                   | 3 ---
>  drivers/cpu/cpu-uclass.c                                    | 2 --
>  drivers/cpu/imx8_cpu.c                                      | 3 ---
>  drivers/cpu/mtk_cpu.c                                       | 3 ---
>  drivers/firmware/arm-ffa/arm-ffa-uclass.c                   | 3 ---
>  drivers/firmware/arm-ffa/arm-ffa.c                          | 3 ---
>  drivers/firmware/arm-ffa/ffa-emul-uclass.c                  | 3 ---
>  drivers/firmware/arm-ffa/sandbox_ffa.c                      | 3 ---
>  drivers/gpio/gpio-uclass.c                                  | 3 ---
>  drivers/gpio/nx_gpio.c                                      | 3 ---
>  drivers/i2c/mxc_i2c.c                                       | 3 ---
>  drivers/i2c/nx_i2c.c                                        | 3 ---
>  drivers/i2c/ocores_i2c.c                                    | 3 ---
>  drivers/i2c/soft_i2c.c                                      | 3 ---
>  drivers/i2c/synquacer_i2c.c                                 | 2 --
>  drivers/mailbox/imx-mailbox.c                               | 2 --
>  drivers/misc/atsha204a-i2c.c                                | 3 ---
>  drivers/misc/fs_loader.c                                    | 3 ---
>  drivers/misc/imx8/fuse.c                                    | 3 ---
>  drivers/mmc/ca_dw_mmc.c                                     | 3 ---
>  drivers/mmc/f_sdh30.c                                       | 2 --
>  drivers/mmc/jz_mmc.c                                        | 3 ---
>  drivers/mmc/msm_sdhci.c                                     | 3 ---
>  drivers/mmc/mv_sdhci.c                                      | 3 ---
>  drivers/mtd/nand/raw/pxa3xx_nand.c                          | 3 ---
>  drivers/mtd/nand/raw/tegra_nand.c                           | 3 ---
>  drivers/mtd/nvmxip/nvmxip_qspi.c                            | 3 ---
>  drivers/mtd/spi/sf-uclass.c                                 | 3 ---
>  drivers/net/dwmac_s700.c                                    | 3 ---
>  drivers/net/fec_mxc.c                                       | 3 ---
>  drivers/net/gmac_rockchip.c                                 | 2 --
>  drivers/net/mvneta.c                                        | 3 ---
>  drivers/net/octeontx/smi.c                                  | 3 ---
>  drivers/net/phy/fixed.c                                     | 3 ---
>  drivers/net/phy/phy.c                                       | 3 ---
>  drivers/net/phy/xilinx_gmii2rgmii.c                         | 3 ---
>  drivers/net/sandbox-raw.c                                   | 3 ---
>  drivers/net/sandbox.c                                       | 3 ---
>  drivers/net/ti/keystone_net.c                               | 3 ---
>  drivers/net/xilinx_axi_emac.c                               | 3 ---
>  drivers/pci/pci_octeontx.c                                  | 3 ---
>  drivers/pci/pcie_dw_meson.c                                 | 3 ---
>  drivers/pci/pcie_dw_qcom.c                                  | 3 ---
>  drivers/pci/pcie_dw_rockchip.c                              | 3 ---
>  drivers/pci/pcie_dw_ti.c                                    | 3 ---
>  drivers/pci/pcie_layerscape.c                               | 3 ---
>  drivers/pci/pcie_starfive_jh7110.c                          | 3 ---
>  drivers/pci_endpoint/pci_ep-uclass.c                        | 3 ---
>  drivers/phy/marvell/comphy_core.c                           | 3 ---
>  drivers/phy/omap-usb2-phy.c                                 | 3 ---
>  drivers/phy/rockchip/phy-rockchip-pcie.c                    | 3 ---
>  drivers/phy/rockchip/phy-rockchip-typec.c                   | 3 ---
>  drivers/pinctrl/mtmips/pinctrl-mt7628.c                     | 3 ---
>  drivers/pinctrl/nexell/pinctrl-nexell.c                     | 3 ---
>  drivers/pinctrl/nexell/pinctrl-s5pxx18.c                    | 3 ---
>  drivers/pinctrl/nxp/pinctrl-imx-mmio.c                      | 3 ---
>  drivers/pinctrl/nxp/pinctrl-imx.c                           | 3 ---
>  drivers/pinctrl/nxp/pinctrl-imx8.c                          | 3 ---
>  drivers/pinctrl/nxp/pinctrl-mxs.c                           | 3 ---
>  drivers/power/domain/imx8m-power-domain.c                   | 3 ---
>  drivers/power/pmic/bd71837.c                                | 3 ---
>  drivers/power/pmic/mc34708.c                                | 3 ---
>  drivers/power/pmic/mp5416.c                                 | 3 ---
>  drivers/power/pmic/pca9450.c                                | 3 ---
>  drivers/power/regulator/pwm_regulator.c                     | 3 ---
>  drivers/pwm/pwm-sifive.c                                    | 3 ---
>  drivers/pwm/rk_pwm.c                                        | 3 ---
>  drivers/pwm/sunxi_pwm.c                                     | 3 ---
>  drivers/ram/stm32mp1/stm32mp1_tests.c                       | 3 ---
>  drivers/reboot-mode/reboot-mode-gpio.c                      | 2 --
>  drivers/reboot-mode/reboot-mode-rtc.c                       | 2 --
>  drivers/remoteproc/rproc-uclass.c                           | 2 --
>  drivers/serial/ns16550.c                                    | 3 ---
>  drivers/serial/sandbox.c                                    | 3 ---
>  drivers/serial/serial_adi_uart4.c                           | 2 --
>  drivers/serial/serial_htif.c                                | 3 ---
>  drivers/serial/serial_xen.c                                 | 3 ---
>  drivers/smem/msm_smem.c                                     | 3 ---
>  drivers/spi/ca_sflash.c                                     | 3 ---
>  drivers/spi/microchip_coreqspi.c                            | 2 --
>  drivers/spi/mvebu_a3700_spi.c                               | 3 ---
>  drivers/spi/omap3_spi.c                                     | 3 ---
>  drivers/spi/spi-sunxi.c                                     | 3 ---
>  drivers/spi/spi-synquacer.c                                 | 2 --
>  drivers/spi/spi-uclass.c                                    | 3 ---
>  drivers/spi/tegra210_qspi.c                                 | 3 ---
>  drivers/spmi/spmi-msm.c                                     | 3 ---
>  drivers/thermal/imx_tmu.c                                   | 3 ---
>  drivers/timer/ostm_timer.c                                  | 3 ---
>  drivers/timer/sp804_timer.c                                 | 3 ---
>  drivers/usb/common/common.c                                 | 3 ---
>  drivers/usb/phy/rockchip_usb2_phy.c                         | 3 ---
>  drivers/usb/tcpm/tcpm.c                                     | 2 --
>  drivers/video/hx8238d.c                                     | 2 --
>  drivers/video/imx/mxc_ipuv3_fb.c                            | 3 ---
>  drivers/video/nexell_display.c                              | 3 ---
>  drivers/video/rockchip/rk_lvds.c                            | 3 ---
>  drivers/video/rockchip/rk_mipi.c                            | 3 ---
>  drivers/video/sandbox_sdl.c                                 | 3 ---
>  drivers/video/tidss/tidss_drv.c                             | 2 --
>  drivers/video/zynqmp/zynqmp_dpsub.c                         | 3 ---
>  drivers/watchdog/armada-37xx-wdt.c                          | 3 ---
>  drivers/watchdog/at91sam9_wdt.c                             | 3 ---
>  drivers/watchdog/mt7621_wdt.c                               | 3 ---
>  drivers/watchdog/orion_wdt.c                                | 3 ---
>  drivers/watchdog/sbsa_gwdt.c                                | 3 ---
>  drivers/watchdog/wdt-uclass.c                               | 3 ---
>  fs/fs.c                                                     | 3 ---
>  fs/ubifs/ubifs.c                                            | 3 ---
>  include/relocate.h                                          | 2 --
>  lib/efi_loader/efi_capsule.c                                | 3 ---
>  lib/efi_loader/efi_gop.c                                    | 3 ---
>  lib/efi_loader/efi_rng.c                                    | 3 ---
>  net/eth-uclass.c                                            | 3 ---
>  net/tftp.c                                                  | 3 ---
>  net/wget.c                                                  | 3 ---
>  test/cmd/exit.c                                             | 3 ---
>  test/cmd/test_echo.c                                        | 3 ---
>  test/cmd/test_pause.c                                       | 3 ---
>  test/dm/blk.c                                               | 3 ---
>  test/dm/i3c.c                                               | 2 --
>  test/lib/test_print.c                                       | 3 ---
>  test/log/log_filter.c                                       | 3 ---
>  293 files changed, 826 deletions(-)
>
> diff --git a/arch/arc/lib/bootm.c b/arch/arc/lib/bootm.c
> index b143392ee6c..91bce5235a5 100644
> --- a/arch/arc/lib/bootm.c
> +++ b/arch/arc/lib/bootm.c
> @@ -10,9 +10,6 @@
>  #include <irq_func.h>
>  #include <log.h>
>  #include <asm/cache.h>
> -#include <asm/global_data.h>
> -
> -DECLARE_GLOBAL_DATA_PTR;
>  
>  static int cleanup_before_linux(void)
>  {
> diff --git a/arch/arm/cpu/armv7/s5p4418/cpu.c b/arch/arm/cpu/armv7/s5p4418/cpu.c
> index 27ffb450378..2c550439559 100644
> --- a/arch/arm/cpu/armv7/s5p4418/cpu.c
> +++ b/arch/arm/cpu/armv7/s5p4418/cpu.c
> @@ -7,7 +7,6 @@
>  #include <command.h>
>  #include <asm/system.h>
>  #include <asm/cache.h>
> -#include <asm/global_data.h>
>  #include <asm/sections.h>
>  #include <asm/io.h>
>  #include <asm/arch/nexell.h>
> @@ -15,8 +14,6 @@
>  #include <asm/arch/tieoff.h>
>  #include <cpu_func.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #ifndef	CONFIG_ARCH_CPU_INIT
>  #error must be define the macro "CONFIG_ARCH_CPU_INIT"
>  #endif
> diff --git a/arch/arm/mach-aspeed/ast2600/spl.c b/arch/arm/mach-aspeed/ast2600/spl.c
> index 0c5a82ed094..60f2c5d291e 100644
> --- a/arch/arm/mach-aspeed/ast2600/spl.c
> +++ b/arch/arm/mach-aspeed/ast2600/spl.c
> @@ -9,9 +9,6 @@
>  #include <linux/err.h>
>  #include <asm/io.h>
>  #include <asm/arch/scu_ast2600.h>
> -#include <asm/global_data.h>
> -
> -DECLARE_GLOBAL_DATA_PTR;
>  
>  void board_init_f(ulong dummy)
>  {
> diff --git a/arch/arm/mach-imx/imx8/clock.c b/arch/arm/mach-imx/imx8/clock.c
> index 4e49b5bf375..e37d3bf31e4 100644
> --- a/arch/arm/mach-imx/imx8/clock.c
> +++ b/arch/arm/mach-imx/imx8/clock.c
> @@ -3,12 +3,9 @@
>   * Copyright 2018 NXP
>   */
>  
> -#include <asm/global_data.h>
>  #include <linux/errno.h>
>  #include <asm/arch/clock.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  u32 mxc_get_clock(enum mxc_clock clk)
>  {
>  	switch (clk) {
> diff --git a/arch/arm/mach-imx/imx8/fdt.c b/arch/arm/mach-imx/imx8/fdt.c
> index ce78c8ce919..8337edc2f62 100644
> --- a/arch/arm/mach-imx/imx8/fdt.c
> +++ b/arch/arm/mach-imx/imx8/fdt.c
> @@ -6,7 +6,6 @@
>  #include <log.h>
>  #include <firmware/imx/sci/sci.h>
>  #include <asm/arch/sys_proto.h>
> -#include <asm/global_data.h>
>  #include <dm/ofnode.h>
>  #include <fdt_support.h>
>  #include <linux/libfdt.h>
> @@ -14,8 +13,6 @@
>  #include <cpu.h>
>  #include <dm.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  static bool check_owned_resource(sc_rsrc_t rsrc_id)
>  {
>  	bool owned;
> diff --git a/arch/arm/mach-imx/imx8/iomux.c b/arch/arm/mach-imx/imx8/iomux.c
> index 3e27d75827a..b6175a50226 100644
> --- a/arch/arm/mach-imx/imx8/iomux.c
> +++ b/arch/arm/mach-imx/imx8/iomux.c
> @@ -4,13 +4,10 @@
>   */
>  
>  #include <log.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <asm/arch/iomux.h>
>  #include <firmware/imx/sci/sci.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  /*
>   * configures a single pad in the iomuxer
>   */
> diff --git a/arch/arm/mach-imx/imx8m/clock_imx8mm.c b/arch/arm/mach-imx/imx8m/clock_imx8mm.c
> index 77c8efc7899..b7b3702041e 100644
> --- a/arch/arm/mach-imx/imx8m/clock_imx8mm.c
> +++ b/arch/arm/mach-imx/imx8m/clock_imx8mm.c
> @@ -8,7 +8,6 @@
>  #include <asm/arch/clock.h>
>  #include <asm/arch/imx-regs.h>
>  #include <asm/arch/sys_proto.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <div64.h>
>  #include <errno.h>
> @@ -16,8 +15,6 @@
>  #include <linux/delay.h>
>  #include <phy.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  static struct anamix_pll *ana_pll = (struct anamix_pll *)ANATOP_BASE_ADDR;
>  
>  static u32 get_root_clk(enum clk_root_index clock_id);
> diff --git a/arch/arm/mach-imx/imx8ulp/cgc.c b/arch/arm/mach-imx/imx8ulp/cgc.c
> index f9d8ed5b048..69585a3605b 100644
> --- a/arch/arm/mach-imx/imx8ulp/cgc.c
> +++ b/arch/arm/mach-imx/imx8ulp/cgc.c
> @@ -10,12 +10,9 @@
>  #include <asm/arch/cgc.h>
>  #include <asm/arch/clock.h>
>  #include <asm/arch/sys_proto.h>
> -#include <asm/global_data.h>
>  #include <linux/delay.h>
>  #include <hang.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  static struct cgc1_regs *cgc1_regs = (struct cgc1_regs *)0x292C0000UL;
>  static struct cgc2_regs *cgc2_regs = (struct cgc2_regs *)0x2da60000UL;
>  
> diff --git a/arch/arm/mach-imx/imx8ulp/clock.c b/arch/arm/mach-imx/imx8ulp/clock.c
> index c390f20d769..1b5cbd56f50 100644
> --- a/arch/arm/mach-imx/imx8ulp/clock.c
> +++ b/arch/arm/mach-imx/imx8ulp/clock.c
> @@ -12,11 +12,8 @@
>  #include <asm/arch/pcc.h>
>  #include <asm/arch/cgc.h>
>  #include <asm/arch/sys_proto.h>
> -#include <asm/global_data.h>
>  #include <linux/delay.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define PLL_USB_EN_USB_CLKS_MASK	(0x01 << 6)
>  #define PLL_USB_PWR_MASK		(0x01 << 12)
>  #define PLL_USB_ENABLE_MASK		(0x01 << 13)
> diff --git a/arch/arm/mach-imx/imx9/clock.c b/arch/arm/mach-imx/imx9/clock.c
> index e65cabef2c9..14a2bdf5762 100644
> --- a/arch/arm/mach-imx/imx9/clock.c
> +++ b/arch/arm/mach-imx/imx9/clock.c
> @@ -10,7 +10,6 @@
>  #include <asm/arch/imx-regs.h>
>  #include <asm/arch/ccm_regs.h>
>  #include <asm/arch/sys_proto.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <div64.h>
>  #include <errno.h>
> @@ -19,8 +18,6 @@
>  #include <log.h>
>  #include <phy.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  static struct anatop_reg *ana_regs = (struct anatop_reg *)ANATOP_BASE_ADDR;
>  
>  static struct imx_intpll_rate_table imx9_intpll_tbl[] = {
> diff --git a/arch/arm/mach-imx/imx9/clock_root.c b/arch/arm/mach-imx/imx9/clock_root.c
> index 5dbc398e97f..acf79a40584 100644
> --- a/arch/arm/mach-imx/imx9/clock_root.c
> +++ b/arch/arm/mach-imx/imx9/clock_root.c
> @@ -11,11 +11,8 @@
>  #include <asm/arch/clock.h>
>  #include <asm/arch/imx-regs.h>
>  #include <asm/arch/sys_proto.h>
> -#include <asm/global_data.h>
>  #include <linux/iopoll.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  static struct ccm_reg *ccm_reg = (struct ccm_reg *)CCM_BASE_ADDR;
>  
>  static enum ccm_clk_src clk_root_mux[][4] = {
> diff --git a/arch/arm/mach-imx/misc.c b/arch/arm/mach-imx/misc.c
> index 7452b82f110..90d91b2300a 100644
> --- a/arch/arm/mach-imx/misc.c
> +++ b/arch/arm/mach-imx/misc.c
> @@ -6,14 +6,11 @@
>  #include <lmb.h>
>  #include <log.h>
>  #include <asm/arch/sys_proto.h>
> -#include <asm/global_data.h>
>  #include <linux/delay.h>
>  #include <linux/errno.h>
>  #include <asm/io.h>
>  #include <asm/mach-imx/regs-common.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  /* 1 second delay should be plenty of time for block reset. */
>  #define	RESET_MAX_TIMEOUT	1000000
>  
> diff --git a/arch/arm/mach-imx/spl_imx_romapi.c b/arch/arm/mach-imx/spl_imx_romapi.c
> index b7008df8e35..d36536e600e 100644
> --- a/arch/arm/mach-imx/spl_imx_romapi.c
> +++ b/arch/arm/mach-imx/spl_imx_romapi.c
> @@ -7,13 +7,10 @@
>  #include <image.h>
>  #include <imx_container.h>
>  #include <log.h>
> -#include <asm/global_data.h>
>  #include <linux/libfdt.h>
>  #include <spl.h>
>  #include <asm/arch/sys_proto.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  /* Caller need ensure the offset and size to align with page size */
>  ulong spl_romapi_raw_seekable_read(u32 offset, u32 size, void *buf)
>  {
> diff --git a/arch/arm/mach-meson/board-axg.c b/arch/arm/mach-meson/board-axg.c
> index 6535539184c..542792cad1b 100644
> --- a/arch/arm/mach-meson/board-axg.c
> +++ b/arch/arm/mach-meson/board-axg.c
> @@ -10,13 +10,10 @@
>  #include <asm/arch/eth.h>
>  #include <asm/arch/axg.h>
>  #include <asm/arch/mem.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <asm/armv8/mmu.h>
>  #include <linux/sizes.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  int meson_get_boot_device(void)
>  {
>  	return readl(AXG_AO_SEC_GP_CFG0) & AXG_AO_BOOT_DEVICE;
> diff --git a/arch/arm/mach-meson/board-g12a.c b/arch/arm/mach-meson/board-g12a.c
> index dc4abe1e107..17722cb897d 100644
> --- a/arch/arm/mach-meson/board-g12a.c
> +++ b/arch/arm/mach-meson/board-g12a.c
> @@ -12,13 +12,10 @@
>  #include <asm/arch/g12a.h>
>  #include <asm/arch/mem.h>
>  #include <asm/arch/meson-vpu.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <asm/armv8/mmu.h>
>  #include <linux/sizes.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  int meson_get_boot_device(void)
>  {
>  	return readl(G12A_AO_SEC_GP_CFG0) & G12A_AO_BOOT_DEVICE;
> diff --git a/arch/arm/mach-meson/board-gx.c b/arch/arm/mach-meson/board-gx.c
> index 0370ed57e20..d5c506df22b 100644
> --- a/arch/arm/mach-meson/board-gx.c
> +++ b/arch/arm/mach-meson/board-gx.c
> @@ -11,14 +11,11 @@
>  #include <asm/arch/gx.h>
>  #include <asm/arch/mem.h>
>  #include <asm/arch/meson-vpu.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <asm/armv8/mmu.h>
>  #include <linux/printk.h>
>  #include <linux/sizes.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  int meson_get_boot_device(void)
>  {
>  	return readl(GX_AO_SEC_GP_CFG0) & GX_AO_BOOT_DEVICE;
> diff --git a/arch/arm/mach-socfpga/clock_manager_agilex.c b/arch/arm/mach-socfpga/clock_manager_agilex.c
> index 9987d5bcee6..95c7f044952 100644
> --- a/arch/arm/mach-socfpga/clock_manager_agilex.c
> +++ b/arch/arm/mach-socfpga/clock_manager_agilex.c
> @@ -10,12 +10,9 @@
>  #include <malloc.h>
>  #include <asm/arch/clock_manager.h>
>  #include <asm/arch/system_manager.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <dt-bindings/clock/agilex-clock.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  static ulong cm_get_rate_dm(u32 id)
>  {
>  	struct udevice *dev;
> diff --git a/arch/arm/mach-socfpga/clock_manager_agilex5.c b/arch/arm/mach-socfpga/clock_manager_agilex5.c
> index 7ec28d91ef3..fa068a9eeb1 100644
> --- a/arch/arm/mach-socfpga/clock_manager_agilex5.c
> +++ b/arch/arm/mach-socfpga/clock_manager_agilex5.c
> @@ -14,7 +14,6 @@
>  #include <stdio.h>
>  #include <time.h>
>  #include <vsprintf.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <linux/kernel.h>
>  #include <linux/string.h>
> @@ -23,8 +22,6 @@
>  #include <asm/arch/system_manager.h>
>  #include <dt-bindings/clock/agilex5-clock.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  static ulong cm_get_rate_dm(u32 id)
>  {
>  	struct udevice *dev;
> diff --git a/arch/arm/mach-socfpga/clock_manager_n5x.c b/arch/arm/mach-socfpga/clock_manager_n5x.c
> index c4c071330fc..8e47b4b8f5b 100644
> --- a/arch/arm/mach-socfpga/clock_manager_n5x.c
> +++ b/arch/arm/mach-socfpga/clock_manager_n5x.c
> @@ -6,15 +6,12 @@
>  
>  #include <asm/arch/clock_manager.h>
>  #include <asm/arch/system_manager.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <clk.h>
>  #include <dm.h>
>  #include <dt-bindings/clock/n5x-clock.h>
>  #include <malloc.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  static ulong cm_get_rate_dm(u32 id)
>  {
>  	struct udevice *dev;
> diff --git a/arch/arm/mach-socfpga/clock_manager_s10.c b/arch/arm/mach-socfpga/clock_manager_s10.c
> index d6c64e98010..fd27470f967 100644
> --- a/arch/arm/mach-socfpga/clock_manager_s10.c
> +++ b/arch/arm/mach-socfpga/clock_manager_s10.c
> @@ -7,14 +7,11 @@
>  #include <compiler.h>
>  #include <dm/device.h>
>  #include <linux/errno.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <asm/arch/clock_manager.h>
>  #include <asm/arch/handoff_soc64.h>
>  #include <asm/arch/system_manager.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  /*
>   * function to write the bypass register which requires a poll of the
>   * busy bit
> diff --git a/arch/arm/mach-socfpga/mailbox_s10.c b/arch/arm/mach-socfpga/mailbox_s10.c
> index f9c34e85711..5e8768168d3 100644
> --- a/arch/arm/mach-socfpga/mailbox_s10.c
> +++ b/arch/arm/mach-socfpga/mailbox_s10.c
> @@ -8,15 +8,12 @@
>  #include <asm/arch/mailbox_s10.h>
>  #include <asm/arch/smc_api.h>
>  #include <asm/arch/system_manager.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <asm/secure.h>
>  #include <asm/system.h>
>  #include <hang.h>
>  #include <wait_bit.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define MBOX_READL(reg)			\
>  	 readl(SOCFPGA_MAILBOX_ADDRESS + (reg))
>  
> diff --git a/arch/arm/mach-socfpga/misc_gen5.c b/arch/arm/mach-socfpga/misc_gen5.c
> index 5259ef54d73..ae33051c00f 100644
> --- a/arch/arm/mach-socfpga/misc_gen5.c
> +++ b/arch/arm/mach-socfpga/misc_gen5.c
> @@ -6,7 +6,6 @@
>  #include <config.h>
>  #include <cpu_func.h>
>  #include <init.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <env.h>
>  #include <errno.h>
> @@ -28,8 +27,6 @@
>  
>  #include <dt-bindings/reset/altr,rst-mgr.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  static struct pl310_regs *const pl310 =
>  	(struct pl310_regs *)CFG_SYS_PL310_BASE;
>  static struct nic301_registers *nic301_regs =
> diff --git a/arch/arm/mach-socfpga/misc_soc64.c b/arch/arm/mach-socfpga/misc_soc64.c
> index 5222b384434..356240a647e 100644
> --- a/arch/arm/mach-socfpga/misc_soc64.c
> +++ b/arch/arm/mach-socfpga/misc_soc64.c
> @@ -17,11 +17,8 @@
>  #include <asm/arch/system_manager.h>
>  #include <asm/io.h>
>  #include <asm/system.h>
> -#include <asm/global_data.h>
>  #include <mach/clock_manager.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  /* Agilex5 Sub Device Jtag ID List */
>  #define A3690_JTAG_ID	0x036090DD
>  #define A3694_JTAG_ID	0x436090DD
> diff --git a/arch/arm/mach-socfpga/mmu-arm64_s10.c b/arch/arm/mach-socfpga/mmu-arm64_s10.c
> index 1dc44ab4797..1a7f8d42415 100644
> --- a/arch/arm/mach-socfpga/mmu-arm64_s10.c
> +++ b/arch/arm/mach-socfpga/mmu-arm64_s10.c
> @@ -5,9 +5,6 @@
>   */
>  
>  #include <asm/armv8/mmu.h>
> -#include <asm/global_data.h>
> -
> -DECLARE_GLOBAL_DATA_PTR;
>  
>  #if IS_ENABLED(CONFIG_TARGET_SOCFPGA_AGILEX5)
>  static struct mm_region socfpga_agilex5_mem_map[] = {
> diff --git a/arch/arm/mach-socfpga/reset_manager_s10.c b/arch/arm/mach-socfpga/reset_manager_s10.c
> index abb62a9b49f..7e1ecc1cd1d 100644
> --- a/arch/arm/mach-socfpga/reset_manager_s10.c
> +++ b/arch/arm/mach-socfpga/reset_manager_s10.c
> @@ -7,7 +7,6 @@
>  
>  #include <errno.h>
>  #include <hang.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <asm/secure.h>
>  #include <asm/arch/reset_manager.h>
> @@ -20,8 +19,6 @@
>  #include <linux/intel-smc.h>
>  #include <wait_bit.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define TIMEOUT_300MS     300
>  
>  /* F2S manager registers */
> diff --git a/arch/arm/mach-socfpga/spl_agilex.c b/arch/arm/mach-socfpga/spl_agilex.c
> index 48f258a37b4..53a9aa55f80 100644
> --- a/arch/arm/mach-socfpga/spl_agilex.c
> +++ b/arch/arm/mach-socfpga/spl_agilex.c
> @@ -7,7 +7,6 @@
>  
>  #include <init.h>
>  #include <log.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <asm/utils.h>
>  #include <hang.h>
> @@ -22,8 +21,6 @@
>  #include <wdt.h>
>  #include <dm/uclass.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  u32 reset_flag(u32 flag)
>  {
>  	/* Check rstmgr.stat for warm reset status */
> diff --git a/arch/arm/mach-socfpga/spl_agilex5.c b/arch/arm/mach-socfpga/spl_agilex5.c
> index 1be347360f5..2c3e40b664a 100644
> --- a/arch/arm/mach-socfpga/spl_agilex5.c
> +++ b/arch/arm/mach-socfpga/spl_agilex5.c
> @@ -6,7 +6,6 @@
>   */
>  
>  #include <init.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <hang.h>
>  #include <spl.h>
> @@ -19,8 +18,6 @@
>  #include <wdt.h>
>  #include <dm/uclass.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  u32 reset_flag(u32 flag)
>  {
>  	/* Check rstmgr.stat for warm reset status */
> diff --git a/arch/arm/mach-socfpga/spl_agilex7m.c b/arch/arm/mach-socfpga/spl_agilex7m.c
> index 90065ccee6f..7371202a712 100644
> --- a/arch/arm/mach-socfpga/spl_agilex7m.c
> +++ b/arch/arm/mach-socfpga/spl_agilex7m.c
> @@ -15,14 +15,11 @@
>  #include <asm/arch/misc.h>
>  #include <asm/arch/reset_manager.h>
>  #include <asm/arch/system_manager.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <asm/u-boot.h>
>  #include <asm/utils.h>
>  #include <dm/uclass.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  void board_init_f(ulong dummy)
>  {
>  	int ret;
> diff --git a/arch/arm/mach-socfpga/spl_gen5.c b/arch/arm/mach-socfpga/spl_gen5.c
> index df79cfe0f7f..08b756db2ca 100644
> --- a/arch/arm/mach-socfpga/spl_gen5.c
> +++ b/arch/arm/mach-socfpga/spl_gen5.c
> @@ -6,7 +6,6 @@
>  #include <hang.h>
>  #include <init.h>
>  #include <log.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <asm/utils.h>
>  #include <image.h>
> @@ -25,8 +24,6 @@
>  #include <dm/uclass.h>
>  #include <linux/bitops.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  u32 spl_boot_device(void)
>  {
>  	const u32 bsel = readl(socfpga_get_sysmgr_addr() +
> diff --git a/arch/arm/mach-socfpga/spl_n5x.c b/arch/arm/mach-socfpga/spl_n5x.c
> index 81283ef7162..a49be837921 100644
> --- a/arch/arm/mach-socfpga/spl_n5x.c
> +++ b/arch/arm/mach-socfpga/spl_n5x.c
> @@ -10,7 +10,6 @@
>  #include <asm/arch/misc.h>
>  #include <asm/arch/reset_manager.h>
>  #include <asm/arch/system_manager.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <asm/utils.h>
>  #include <dm/uclass.h>
> @@ -20,8 +19,6 @@
>  #include <spl.h>
>  #include <watchdog.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  void board_init_f(ulong dummy)
>  {
>  	int ret;
> diff --git a/arch/arm/mach-socfpga/spl_s10.c b/arch/arm/mach-socfpga/spl_s10.c
> index fa83ff96adc..a0d3c96d456 100644
> --- a/arch/arm/mach-socfpga/spl_s10.c
> +++ b/arch/arm/mach-socfpga/spl_s10.c
> @@ -7,7 +7,6 @@
>  #include <hang.h>
>  #include <init.h>
>  #include <log.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <asm/utils.h>
>  #include <debug_uart.h>
> @@ -22,8 +21,6 @@
>  #include <watchdog.h>
>  #include <dm/uclass.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  void board_init_f(ulong dummy)
>  {
>  	const struct cm_config *cm_default_cfg = cm_get_default_config();
> diff --git a/arch/arm/mach-socfpga/system_manager_soc64.c b/arch/arm/mach-socfpga/system_manager_soc64.c
> index 913f93c8f94..a5c0387190b 100644
> --- a/arch/arm/mach-socfpga/system_manager_soc64.c
> +++ b/arch/arm/mach-socfpga/system_manager_soc64.c
> @@ -6,12 +6,9 @@
>  
>  #include <asm/arch/handoff_soc64.h>
>  #include <asm/arch/system_manager.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <linux/bitfield.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #if IS_ENABLED(CONFIG_TARGET_SOCFPGA_AGILEX5)
>  /*
>   * Setting RESET_PULSE_OVERRIDE bit for successful reset staggering pulse
> diff --git a/arch/microblaze/lib/bootm.c b/arch/microblaze/lib/bootm.c
> index 4879a41aab3..2410515f4ac 100644
> --- a/arch/microblaze/lib/bootm.c
> +++ b/arch/microblaze/lib/bootm.c
> @@ -17,12 +17,9 @@
>  #include <image.h>
>  #include <log.h>
>  #include <asm/cache.h>
> -#include <asm/global_data.h>
>  #include <u-boot/zlib.h>
>  #include <asm/byteorder.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  static void boot_jump_linux(struct bootm_headers *images, int flag)
>  {
>  	void (*thekernel)(char *cmdline, ulong rd, ulong dt);
> diff --git a/arch/mips/mach-ath79/qca956x/ddr.c b/arch/mips/mach-ath79/qca956x/ddr.c
> index 2e46e24f483..754e2573e37 100644
> --- a/arch/mips/mach-ath79/qca956x/ddr.c
> +++ b/arch/mips/mach-ath79/qca956x/ddr.c
> @@ -5,7 +5,6 @@
>   * Based on QSDK
>   */
>  
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <asm/addrspace.h>
>  #include <asm/types.h>
> @@ -182,8 +181,6 @@
>  	DDR_CTL_CONFIG_MISC_SRC1_SRAM_SYNC_SET(0x1) | \
>  	DDR_CTL_CONFIG_MISC_SRC2_SRAM_SYNC_SET(0x1)
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  void qca956x_ddr_init(void)
>  {
>  	u32 ddr_config, ddr_config2, ddr_config3, mod_val, \
> diff --git a/arch/mips/mach-mscc/cpu.c b/arch/mips/mach-mscc/cpu.c
> index 22b1b98e0ef..8ae6fb9437a 100644
> --- a/arch/mips/mach-mscc/cpu.c
> +++ b/arch/mips/mach-mscc/cpu.c
> @@ -4,7 +4,6 @@
>   */
>  
>  #include <init.h>
> -#include <asm/global_data.h>
>  #include <linux/bitops.h>
>  
>  #include <asm/io.h>
> @@ -14,8 +13,6 @@
>  #include <mach/tlb.h>
>  #include <mach/ddr.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #if CFG_SYS_SDRAM_SIZE <= SZ_64M
>  #define MSCC_RAM_TLB_SIZE   SZ_64M
>  #define MSCC_ATTRIB2   MMU_REGIO_INVAL
> diff --git a/arch/mips/mach-mtmips/ddr_cal.c b/arch/mips/mach-mtmips/ddr_cal.c
> index e2e1760a646..5fc4e0c49e8 100644
> --- a/arch/mips/mach-mtmips/ddr_cal.c
> +++ b/arch/mips/mach-mtmips/ddr_cal.c
> @@ -7,13 +7,10 @@
>  
>  #include <asm/addrspace.h>
>  #include <asm/cacheops.h>
> -#include <asm/global_data.h>
>  #include <linux/bitops.h>
>  #include <linux/io.h>
>  #include <mach/mc.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define COARSE_MIN_START	6
>  #define FINE_MIN_START		15
>  #define COARSE_MAX_START	7
> diff --git a/arch/mips/mach-octeon/cvmx-pko.c b/arch/mips/mach-octeon/cvmx-pko.c
> index 8a9181362bd..432488f7815 100644
> --- a/arch/mips/mach-octeon/cvmx-pko.c
> +++ b/arch/mips/mach-octeon/cvmx-pko.c
> @@ -52,8 +52,6 @@
>  #include <mach/cvmx-helper-pki.h>
>  #include <mach/cvmx-helper-pko.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define CVMX_PKO_NQ_PER_PORT_MAX 32
>  
>  static cvmx_pko_return_value_t cvmx_pko2_config_port(short ipd_port,
> diff --git a/arch/nios2/lib/bootm.c b/arch/nios2/lib/bootm.c
> index 71319839ba2..294ebfb508b 100644
> --- a/arch/nios2/lib/bootm.c
> +++ b/arch/nios2/lib/bootm.c
> @@ -10,9 +10,6 @@
>  #include <image.h>
>  #include <irq_func.h>
>  #include <log.h>
> -#include <asm/global_data.h>
> -
> -DECLARE_GLOBAL_DATA_PTR;
>  
>  #define NIOS_MAGIC 0x534f494e /* enable command line and initrd passing */
>  
> diff --git a/arch/riscv/cpu/andes/spl.c b/arch/riscv/cpu/andes/spl.c
> index a13dc4095a4..1e19fad9288 100644
> --- a/arch/riscv/cpu/andes/spl.c
> +++ b/arch/riscv/cpu/andes/spl.c
> @@ -8,11 +8,8 @@
>  #include <init.h>
>  #include <log.h>
>  #include <spl.h>
> -#include <asm/global_data.h>
>  #include <asm/system.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #if CONFIG_IS_ENABLED(RAM_SUPPORT)
>  struct legacy_img_hdr *spl_get_load_buffer(ssize_t offset, size_t size)
>  {
> diff --git a/arch/riscv/cpu/cv1800b/dram.c b/arch/riscv/cpu/cv1800b/dram.c
> index 91007c0a3d3..5d7659887b9 100644
> --- a/arch/riscv/cpu/cv1800b/dram.c
> +++ b/arch/riscv/cpu/cv1800b/dram.c
> @@ -5,11 +5,8 @@
>  
>  #include <fdtdec.h>
>  #include <init.h>
> -#include <asm/global_data.h>
>  #include <linux/sizes.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  int dram_init(void)
>  {
>  	return fdtdec_setup_mem_size_base();
> diff --git a/arch/riscv/cpu/generic/dram.c b/arch/riscv/cpu/generic/dram.c
> index 91007c0a3d3..5d7659887b9 100644
> --- a/arch/riscv/cpu/generic/dram.c
> +++ b/arch/riscv/cpu/generic/dram.c
> @@ -5,11 +5,8 @@
>  
>  #include <fdtdec.h>
>  #include <init.h>
> -#include <asm/global_data.h>
>  #include <linux/sizes.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  int dram_init(void)
>  {
>  	return fdtdec_setup_mem_size_base();
> diff --git a/arch/riscv/cpu/k230/dram.c b/arch/riscv/cpu/k230/dram.c
> index b2d3e4fd6a9..5d7659887b9 100644
> --- a/arch/riscv/cpu/k230/dram.c
> +++ b/arch/riscv/cpu/k230/dram.c
> @@ -3,13 +3,10 @@
>   * Copyright (C) 2018, Bin Meng <bmeng.cn@gmail.com>
>   */
>  
> -#include <asm/global_data.h>
>  #include <fdtdec.h>
>  #include <init.h>
>  #include <linux/sizes.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  int dram_init(void)
>  {
>  	return fdtdec_setup_mem_size_base();
> diff --git a/arch/riscv/cpu/th1520/spl.c b/arch/riscv/cpu/th1520/spl.c
> index b95470485f6..ceb934021d9 100644
> --- a/arch/riscv/cpu/th1520/spl.c
> +++ b/arch/riscv/cpu/th1520/spl.c
> @@ -10,8 +10,6 @@
>  #include <log.h>
>  #include <init.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define TH1520_SUBSYS_CLK		(void __iomem *)(0xffff011000 + 0x220)
>  #define  TH1520_SUBSYS_CLK_VO_EN	BIT(2)
>  #define  TH1520_SUBSYS_CLK_VI_EN	BIT(1)
> diff --git a/arch/sh/lib/bootm.c b/arch/sh/lib/bootm.c
> index bb0f59e0aa2..1c118870dad 100644
> --- a/arch/sh/lib/bootm.c
> +++ b/arch/sh/lib/bootm.c
> @@ -13,11 +13,8 @@
>  #include <env.h>
>  #include <image.h>
>  #include <asm/byteorder.h>
> -#include <asm/global_data.h>
>  #include <asm/zimage.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #ifdef CONFIG_SH_SDRAM_OFFSET
>  #define GET_INITRD_START(initrd, linux) (initrd - linux + CONFIG_SH_SDRAM_OFFSET)
>  #else
> diff --git a/arch/x86/cpu/ivybridge/model_206ax.c b/arch/x86/cpu/ivybridge/model_206ax.c
> index b72de96a277..ed0ad686b3f 100644
> --- a/arch/x86/cpu/ivybridge/model_206ax.c
> +++ b/arch/x86/cpu/ivybridge/model_206ax.c
> @@ -14,7 +14,6 @@
>  #include <asm/cpu.h>
>  #include <asm/cpu_common.h>
>  #include <asm/cpu_x86.h>
> -#include <asm/global_data.h>
>  #include <asm/msr.h>
>  #include <asm/msr-index.h>
>  #include <asm/mtrr.h>
> @@ -23,8 +22,6 @@
>  #include <asm/turbo.h>
>  #include <asm/arch/model_206ax.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  static void enable_vmx(void)
>  {
>  	struct cpuid_result regs;
> diff --git a/arch/x86/lib/init_helpers.c b/arch/x86/lib/init_helpers.c
> index bd0efde00c1..96943cb8c46 100644
> --- a/arch/x86/lib/init_helpers.c
> +++ b/arch/x86/lib/init_helpers.c
> @@ -5,13 +5,10 @@
>   */
>  
>  #include <init.h>
> -#include <asm/global_data.h>
>  #include <linux/errno.h>
>  #include <asm/mtrr.h>
>  #include <asm/u-boot-x86.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  int init_cache_f_r(void)
>  {
>  	bool do_mtrr = CONFIG_IS_ENABLED(X86_32BIT_INIT) ||
> diff --git a/arch/x86/lib/zimage.c b/arch/x86/lib/zimage.c
> index 2ea9bcf59c2..a5f2231aa52 100644
> --- a/arch/x86/lib/zimage.c
> +++ b/arch/x86/lib/zimage.c
> @@ -30,7 +30,6 @@
>  #include <asm/bootm.h>
>  #include <asm/bootparam.h>
>  #include <asm/efi.h>
> -#include <asm/global_data.h>
>  #ifdef CONFIG_SYS_COREBOOT
>  #include <asm/arch/timestamp.h>
>  #endif
> @@ -38,8 +37,6 @@
>  #include <linux/ctype.h>
>  #include <linux/libfdt.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  /*
>   * Memory lay-out:
>   *
> diff --git a/arch/xtensa/lib/time.c b/arch/xtensa/lib/time.c
> index 319635c6b09..1fe33a4c62b 100644
> --- a/arch/xtensa/lib/time.c
> +++ b/arch/xtensa/lib/time.c
> @@ -5,12 +5,9 @@
>  
>  #include <clock_legacy.h>
>  #include <time.h>
> -#include <asm/global_data.h>
>  #include <linux/delay.h>
>  #include <linux/stringify.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #if XCHAL_HAVE_CCOUNT
>  static ulong get_ccount(void)
>  {
> diff --git a/board/BuR/brsmarc1/board.c b/board/BuR/brsmarc1/board.c
> index c05eec6b35e..01d7a8c39e2 100644
> --- a/board/BuR/brsmarc1/board.c
> +++ b/board/BuR/brsmarc1/board.c
> @@ -18,7 +18,6 @@
>  #include <asm/arch/clock.h>
>  #include <asm/arch/sys_proto.h>
>  #include <asm/arch/mem.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <asm/gpio.h>
>  #include <asm/emif.h>
> @@ -30,8 +29,6 @@
>  /* -- defines for used GPIO Hardware -- */
>  #define PER_RESET		(2 * 32 + 0)
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #if defined(CONFIG_XPL_BUILD)
>  static const struct ddr_data ddr3_data = {
>  	.datardsratio0 = MT41K256M16HA125E_RD_DQS,
> diff --git a/board/BuR/common/common.c b/board/BuR/common/common.c
> index 3513f43a9f5..bbafecd7909 100644
> --- a/board/BuR/common/common.c
> +++ b/board/BuR/common/common.c
> @@ -13,12 +13,9 @@
>  #include <env.h>
>  #include <fdtdec.h>
>  #include <i2c.h>
> -#include <asm/global_data.h>
>  #include <linux/delay.h>
>  #include "bur_common.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  /* --------------------------------------------------------------------------*/
>  
>  int ft_board_setup(void *blob, struct bd_info *bd)
> diff --git a/board/Marvell/octeontx/smc.c b/board/Marvell/octeontx/smc.c
> index 8df32049bda..ab6284a732c 100644
> --- a/board/Marvell/octeontx/smc.c
> +++ b/board/Marvell/octeontx/smc.c
> @@ -5,13 +5,10 @@
>   * https://spdx.org/licenses
>   */
>  
> -#include <asm/global_data.h>
>  #include <asm/ptrace.h>
>  #include <asm/system.h>
>  #include <asm/arch/smc.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  ssize_t smc_dram_size(unsigned int node)
>  {
>  	struct pt_regs regs;
> diff --git a/board/Marvell/octeontx2/smc.c b/board/Marvell/octeontx2/smc.c
> index 9e3169576c6..10645a74f69 100644
> --- a/board/Marvell/octeontx2/smc.c
> +++ b/board/Marvell/octeontx2/smc.c
> @@ -5,15 +5,12 @@
>   * https://spdx.org/licenses
>   */
>  
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <asm/psci.h>
>  #include <asm/ptrace.h>
>  #include <asm/system.h>
>  #include <asm/arch/smc.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  ssize_t smc_dram_size(unsigned int node)
>  {
>  	struct pt_regs regs;
> diff --git a/board/advantech/imx8mp_rsb3720a1/imx8mp_rsb3720a1.c b/board/advantech/imx8mp_rsb3720a1/imx8mp_rsb3720a1.c
> index 8c9e9830876..a9a12a4f659 100644
> --- a/board/advantech/imx8mp_rsb3720a1/imx8mp_rsb3720a1.c
> +++ b/board/advantech/imx8mp_rsb3720a1/imx8mp_rsb3720a1.c
> @@ -26,8 +26,6 @@
>  #include <linux/kernel.h>
>  #include <power/pmic.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #ifdef CONFIG_NAND_MXS
>  static void setup_gpmi_nand(void)
>  {
> diff --git a/board/advantech/imx8mp_rsb3720a1/spl.c b/board/advantech/imx8mp_rsb3720a1/spl.c
> index 1f7c1f25adc..fb8e8437759 100644
> --- a/board/advantech/imx8mp_rsb3720a1/spl.c
> +++ b/board/advantech/imx8mp_rsb3720a1/spl.c
> @@ -29,8 +29,6 @@
>  #include <power/pmic.h>
>  #include <power/pca9450.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  int spl_board_boot_device(enum boot_device boot_dev_spl)
>  {
>  #ifdef CONFIG_SPL_BOOTROM_SUPPORT
> diff --git a/board/advantech/imx8qm_dmsse20_a1/imx8qm_dmsse20_a1.c b/board/advantech/imx8qm_dmsse20_a1/imx8qm_dmsse20_a1.c
> index accd300df04..fbe8b247e69 100644
> --- a/board/advantech/imx8qm_dmsse20_a1/imx8qm_dmsse20_a1.c
> +++ b/board/advantech/imx8qm_dmsse20_a1/imx8qm_dmsse20_a1.c
> @@ -16,8 +16,6 @@
>  #include <asm/arch/sys_proto.h>
>  /* #include <power-domain.h> */
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define UART_PAD_CTRL	((SC_PAD_CONFIG_OUT_IN << PADRING_CONFIG_SHIFT) | \
>  			(SC_PAD_ISO_OFF << PADRING_LPCONFIG_SHIFT) | \
>  			(SC_PAD_28FDSOI_DSE_DV_HIGH << PADRING_DSE_SHIFT) | \
> diff --git a/board/advantech/imx8qm_rom7720_a1/imx8qm_rom7720_a1.c b/board/advantech/imx8qm_rom7720_a1/imx8qm_rom7720_a1.c
> index 3def182f296..8214e627768 100644
> --- a/board/advantech/imx8qm_rom7720_a1/imx8qm_rom7720_a1.c
> +++ b/board/advantech/imx8qm_rom7720_a1/imx8qm_rom7720_a1.c
> @@ -8,7 +8,6 @@
>  #include <env.h>
>  #include <errno.h>
>  #include <init.h>
> -#include <asm/global_data.h>
>  #include <linux/delay.h>
>  #include <linux/libfdt.h>
>  #include <asm/io.h>
> @@ -19,8 +18,6 @@
>  #include <asm/arch/iomux.h>
>  #include <asm/arch/sys_proto.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define UART_PAD_CTRL	((SC_PAD_CONFIG_OUT_IN << PADRING_CONFIG_SHIFT) | \
>  			 (SC_PAD_ISO_OFF << PADRING_LPCONFIG_SHIFT) | \
>  			 (SC_PAD_28FDSOI_DSE_DV_HIGH << PADRING_DSE_SHIFT) | \
> diff --git a/board/andestech/voyager/voyager.c b/board/andestech/voyager/voyager.c
> index dc8f1347775..23fd0910ef8 100644
> --- a/board/andestech/voyager/voyager.c
> +++ b/board/andestech/voyager/voyager.c
> @@ -5,7 +5,6 @@
>   */
>  
>  #include <asm/csr.h>
> -#include <asm/global_data.h>
>  #include <asm/sbi.h>
>  #include <config.h>
>  #include <cpu_func.h>
> @@ -19,8 +18,6 @@
>  #include <net.h>
>  #include <spl.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  int dram_init(void)
>  {
>  	return fdtdec_setup_mem_size_base();
> diff --git a/board/armltd/vexpress64/vexpress64.c b/board/armltd/vexpress64/vexpress64.c
> index e8f1c2fe9fe..d68da0e3d65 100644
> --- a/board/armltd/vexpress64/vexpress64.c
> +++ b/board/armltd/vexpress64/vexpress64.c
> @@ -12,7 +12,6 @@
>  #include <errno.h>
>  #include <net.h>
>  #include <netdev.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <linux/compiler.h>
>  #include <linux/sizes.h>
> @@ -24,8 +23,6 @@
>  #include <virtio.h>
>  #endif
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  static const struct pl01x_serial_plat serial_plat = {
>  	.base = V2M_UART0,
>  	.type = TYPE_PL011,
> diff --git a/board/beacon/imx8mm/spl.c b/board/beacon/imx8mm/spl.c
> index 93ee5b7ee0c..1e5935788ff 100644
> --- a/board/beacon/imx8mm/spl.c
> +++ b/board/beacon/imx8mm/spl.c
> @@ -5,7 +5,6 @@
>  #include <init.h>
>  #include <log.h>
>  #include <spl.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <asm/mach-imx/iomux-v3.h>
>  #include <asm/arch/clock.h>
> @@ -23,8 +22,6 @@
>  #include <power/pmic.h>
>  #include <power/bd71837.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  int spl_board_boot_device(enum boot_device boot_dev_spl)
>  {
>  	switch (boot_dev_spl) {
> diff --git a/board/beacon/imx8mn/spl.c b/board/beacon/imx8mn/spl.c
> index e91d3fdcf5e..46db42ec921 100644
> --- a/board/beacon/imx8mn/spl.c
> +++ b/board/beacon/imx8mn/spl.c
> @@ -9,7 +9,6 @@
>  #include <log.h>
>  #include <asm/io.h>
>  #include <errno.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <asm/arch/ddr.h>
>  #include <asm/arch/imx8mn_pins.h>
> @@ -32,8 +31,6 @@
>  #include <dm/uclass-internal.h>
>  #include <dm/device-internal.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  int spl_board_boot_device(enum boot_device boot_dev_spl)
>  {
>  	return BOOT_DEVICE_BOOTROM;
> diff --git a/board/beacon/imx8mp/spl.c b/board/beacon/imx8mp/spl.c
> index 027fae38278..e82e385b774 100644
> --- a/board/beacon/imx8mp/spl.c
> +++ b/board/beacon/imx8mp/spl.c
> @@ -8,7 +8,6 @@
>  #include <init.h>
>  #include <log.h>
>  #include <spl.h>
> -#include <asm/global_data.h>
>  #include <asm/arch/clock.h>
>  #include <asm/arch/imx8mp_pins.h>
>  #include <asm/arch/sys_proto.h>
> @@ -22,8 +21,6 @@
>  #include <dm/uclass.h>
>  #include <dm/device.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  int spl_board_boot_device(enum boot_device boot_dev_spl)
>  {
>  	return BOOT_DEVICE_BOOTROM;
> diff --git a/board/beagle/beagleboneai64/beagleboneai64.c b/board/beagle/beagleboneai64/beagleboneai64.c
> index 500fcc58ed8..27b1f22562c 100644
> --- a/board/beagle/beagleboneai64/beagleboneai64.c
> +++ b/board/beagle/beagleboneai64/beagleboneai64.c
> @@ -13,8 +13,6 @@
>  #include <fdt_support.h>
>  #include <spl.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  struct efi_fw_image fw_images[] = {
>  	{
>  		.image_type_id = BEAGLEBONEAI64_TIBOOT3_IMAGE_GUID,
> diff --git a/board/beagle/beagleplay/beagleplay.c b/board/beagle/beagleplay/beagleplay.c
> index 9bc9ca30e95..70d296de9f8 100644
> --- a/board/beagle/beagleplay/beagleplay.c
> +++ b/board/beagle/beagleplay/beagleplay.c
> @@ -14,8 +14,6 @@
>  
>  #include <asm/arch/hardware.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  struct efi_fw_image fw_images[] = {
>  	{
>  		.image_type_id = BEAGLEPLAY_TIBOOT3_IMAGE_GUID,
> diff --git a/board/broadcom/bcmns/ns.c b/board/broadcom/bcmns/ns.c
> index 47a01227a35..cb53ec68cf8 100644
> --- a/board/broadcom/bcmns/ns.c
> +++ b/board/broadcom/bcmns/ns.c
> @@ -9,12 +9,9 @@
>  #include <log.h>
>  #include <ram.h>
>  #include <serial.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <asm/armv7m.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  int dram_init(void)
>  {
>  	return fdtdec_setup_mem_size_base();
> diff --git a/board/cloos/imx8mm_phg/imx8mm_phg.c b/board/cloos/imx8mm_phg/imx8mm_phg.c
> index 091c9a59a52..1ca1c07e08e 100644
> --- a/board/cloos/imx8mm_phg/imx8mm_phg.c
> +++ b/board/cloos/imx8mm_phg/imx8mm_phg.c
> @@ -7,14 +7,11 @@
>  #include <init.h>
>  #include <miiphy.h>
>  #include <netdev.h>
> -#include <asm/global_data.h>
>  
>  #include <asm/arch/clock.h>
>  #include <asm/arch/sys_proto.h>
>  #include <asm/io.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  static int setup_fec(void)
>  {
>  	struct iomuxc_gpr_base_regs *gpr =
> diff --git a/board/cloos/imx8mm_phg/spl.c b/board/cloos/imx8mm_phg/spl.c
> index b8892ed2fcc..b2340a0ded3 100644
> --- a/board/cloos/imx8mm_phg/spl.c
> +++ b/board/cloos/imx8mm_phg/spl.c
> @@ -10,7 +10,6 @@
>  #include <init.h>
>  #include <log.h>
>  #include <spl.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <asm/mach-imx/iomux-v3.h>
>  #include <asm/arch/clock.h>
> @@ -28,8 +27,6 @@
>  #include <power/pmic.h>
>  #include <power/pca9450.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  int spl_board_boot_device(enum boot_device boot_dev_spl)
>  {
>  	switch (boot_dev_spl) {
> diff --git a/board/compulab/imx8mm-cl-iot-gate/spl.c b/board/compulab/imx8mm-cl-iot-gate/spl.c
> index 6d9af2538b6..daac6dca4ce 100644
> --- a/board/compulab/imx8mm-cl-iot-gate/spl.c
> +++ b/board/compulab/imx8mm-cl-iot-gate/spl.c
> @@ -32,8 +32,6 @@
>  
>  #include "ddr/ddr.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  int spl_board_boot_device(enum boot_device boot_dev_spl)
>  {
>  	switch (boot_dev_spl) {
> diff --git a/board/coreboot/coreboot/coreboot.c b/board/coreboot/coreboot/coreboot.c
> index f2ca1076768..d0e8db6cdfe 100644
> --- a/board/coreboot/coreboot/coreboot.c
> +++ b/board/coreboot/coreboot/coreboot.c
> @@ -7,9 +7,6 @@
>  #include <init.h>
>  #include <smbios.h>
>  #include <asm/cb_sysinfo.h>
> -#include <asm/global_data.h>
> -
> -DECLARE_GLOBAL_DATA_PTR;
>  
>  int board_early_init_r(void)
>  {
> diff --git a/board/cssi/cmpc885/cmpc885.c b/board/cssi/cmpc885/cmpc885.c
> index 49c13056edc..552349d104a 100644
> --- a/board/cssi/cmpc885/cmpc885.c
> +++ b/board/cssi/cmpc885/cmpc885.c
> @@ -26,8 +26,6 @@
>  
>  #include "../common/common.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define ADDR_CPLD_R_RESET		((unsigned short __iomem *)CONFIG_CPLD_BASE)
>  #define ADDR_CPLD_R_ETAT		((unsigned short __iomem *)(CONFIG_CPLD_BASE + 2))
>  #define ADDR_CPLD_R_TYPE		((unsigned char  __iomem *)(CONFIG_CPLD_BASE + 3))
> diff --git a/board/data_modul/imx8mm_edm_sbc/imx8mm_data_modul_edm_sbc.c b/board/data_modul/imx8mm_edm_sbc/imx8mm_data_modul_edm_sbc.c
> index e271d060efa..ab4a484d393 100644
> --- a/board/data_modul/imx8mm_edm_sbc/imx8mm_data_modul_edm_sbc.c
> +++ b/board/data_modul/imx8mm_edm_sbc/imx8mm_data_modul_edm_sbc.c
> @@ -14,8 +14,6 @@
>  
>  #include "../common/common.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  int board_late_init(void)
>  {
>  	struct udevice *dev;
> diff --git a/board/data_modul/imx8mm_edm_sbc/spl.c b/board/data_modul/imx8mm_edm_sbc/spl.c
> index a9ef049652a..c6a5740c7a7 100644
> --- a/board/data_modul/imx8mm_edm_sbc/spl.c
> +++ b/board/data_modul/imx8mm_edm_sbc/spl.c
> @@ -27,8 +27,6 @@
>  
>  #include "../common/common.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  int data_modul_imx_edm_sbc_board_power_init(void)
>  {
>  	struct udevice *dev;
> diff --git a/board/data_modul/imx8mp_edm_sbc/imx8mp_data_modul_edm_sbc.c b/board/data_modul/imx8mp_edm_sbc/imx8mp_data_modul_edm_sbc.c
> index d6f0a917023..5c319df1cde 100644
> --- a/board/data_modul/imx8mp_edm_sbc/imx8mp_data_modul_edm_sbc.c
> +++ b/board/data_modul/imx8mp_edm_sbc/imx8mp_data_modul_edm_sbc.c
> @@ -17,8 +17,6 @@
>  
>  #include "../common/common.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  static void dmo_setup_second_mac_address(void)
>  {
>  	u8 enetaddr[6];
> diff --git a/board/data_modul/imx8mp_edm_sbc/spl.c b/board/data_modul/imx8mp_edm_sbc/spl.c
> index f81b7274556..314f7e87a9d 100644
> --- a/board/data_modul/imx8mp_edm_sbc/spl.c
> +++ b/board/data_modul/imx8mp_edm_sbc/spl.c
> @@ -28,8 +28,6 @@
>  
>  #include "../common/common.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  int data_modul_imx_edm_sbc_board_power_init(void)
>  {
>  	struct udevice *dev;
> diff --git a/board/dhelectronics/dh_imx8mp/common.c b/board/dhelectronics/dh_imx8mp/common.c
> index f6db9f67804..5d89c94970d 100644
> --- a/board/dhelectronics/dh_imx8mp/common.c
> +++ b/board/dhelectronics/dh_imx8mp/common.c
> @@ -8,8 +8,6 @@
>  
>  #include "lpddr4_timing.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  u8 dh_get_memcfg(void)
>  {
>  	struct gpio_desc gpio[4];
> diff --git a/board/dhelectronics/dh_imx8mp/imx8mp_dhcom_pdk2.c b/board/dhelectronics/dh_imx8mp/imx8mp_dhcom_pdk2.c
> index 5c35a5bf447..3fe98d36f5b 100644
> --- a/board/dhelectronics/dh_imx8mp/imx8mp_dhcom_pdk2.c
> +++ b/board/dhelectronics/dh_imx8mp/imx8mp_dhcom_pdk2.c
> @@ -20,8 +20,6 @@
>  #include "../common/dh_common.h"
>  #include "../common/dh_imx.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  int mach_cpu_init(void)
>  {
>  	icache_enable();
> diff --git a/board/dhelectronics/dh_imx8mp/spl.c b/board/dhelectronics/dh_imx8mp/spl.c
> index 714f846521e..727e1ff3774 100644
> --- a/board/dhelectronics/dh_imx8mp/spl.c
> +++ b/board/dhelectronics/dh_imx8mp/spl.c
> @@ -29,8 +29,6 @@
>  
>  #include "lpddr4_timing.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define UART_PAD_CTRL	(PAD_CTL_DSE6 | PAD_CTL_FSEL1)
>  #define WDOG_PAD_CTRL	(PAD_CTL_DSE6 | PAD_CTL_ODE | PAD_CTL_PUE | PAD_CTL_PE)
>  
> diff --git a/board/emcraft/imx8mp_navqp/spl.c b/board/emcraft/imx8mp_navqp/spl.c
> index 7f30f3af742..5ee94d078f8 100644
> --- a/board/emcraft/imx8mp_navqp/spl.c
> +++ b/board/emcraft/imx8mp_navqp/spl.c
> @@ -8,7 +8,6 @@
>  #include <asm/arch/ddr.h>
>  #include <asm/arch/imx8mp_pins.h>
>  #include <asm/arch/sys_proto.h>
> -#include <asm/global_data.h>
>  #include <asm/mach-imx/boot_mode.h>
>  #include <asm/sections.h>
>  #include <dm/device.h>
> @@ -20,8 +19,6 @@
>  #include <power/pmic.h>
>  #include <spl.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  int spl_board_boot_device(enum boot_device boot_dev_spl)
>  {
>  	return BOOT_DEVICE_BOOTROM;
> diff --git a/board/emulation/qemu-riscv/qemu-riscv.c b/board/emulation/qemu-riscv/qemu-riscv.c
> index 97c8211c100..ce5bc34ca71 100644
> --- a/board/emulation/qemu-riscv/qemu-riscv.c
> +++ b/board/emulation/qemu-riscv/qemu-riscv.c
> @@ -15,8 +15,6 @@
>  #include <virtio_types.h>
>  #include <virtio.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #if IS_ENABLED(CONFIG_MTD_NOR_FLASH)
>  int is_flash_available(void)
>  {
> diff --git a/board/engicam/imx8mm/icore_mx8mm.c b/board/engicam/imx8mm/icore_mx8mm.c
> index 236337546ae..bb70e7d4ff8 100644
> --- a/board/engicam/imx8mm/icore_mx8mm.c
> +++ b/board/engicam/imx8mm/icore_mx8mm.c
> @@ -19,8 +19,6 @@
>  #include <asm/mach-imx/gpio.h>
>  #include <asm/mach-imx/iomux-v3.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #if IS_ENABLED(CONFIG_FEC_MXC)
>  
>  #define FEC_RST_PAD IMX_GPIO_NR(3, 7)
> diff --git a/board/engicam/imx8mm/spl.c b/board/engicam/imx8mm/spl.c
> index d51ae241e85..5a6bcb1747a 100644
> --- a/board/engicam/imx8mm/spl.c
> +++ b/board/engicam/imx8mm/spl.c
> @@ -17,8 +17,6 @@
>  #include <asm/arch/ddr.h>
>  #include <asm/sections.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  int spl_board_boot_device(enum boot_device boot_dev_spl)
>  {
>  	switch (boot_dev_spl) {
> diff --git a/board/engicam/imx8mp/icore_mx8mp.c b/board/engicam/imx8mp/icore_mx8mp.c
> index bfdc447c478..864afa92aee 100644
> --- a/board/engicam/imx8mp/icore_mx8mp.c
> +++ b/board/engicam/imx8mp/icore_mx8mp.c
> @@ -14,7 +14,6 @@
>  #include <miiphy.h>
>  #include <netdev.h>
>  #include <linux/delay.h>
> -#include <asm/global_data.h>
>  #include <asm/mach-imx/iomux-v3.h>
>  #include <asm-generic/gpio.h>
>  #include <asm/arch/imx8mp_pins.h>
> @@ -22,8 +21,6 @@
>  #include <asm/arch/sys_proto.h>
>  #include <asm/mach-imx/gpio.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  static void setup_fec(void)
>  {
>  	struct iomuxc_gpr_base_regs *gpr =
> diff --git a/board/engicam/imx8mp/spl.c b/board/engicam/imx8mp/spl.c
> index cd31aa6041d..c1aa28a17bc 100644
> --- a/board/engicam/imx8mp/spl.c
> +++ b/board/engicam/imx8mp/spl.c
> @@ -12,7 +12,6 @@
>  #include <init.h>
>  #include <log.h>
>  #include <spl.h>
> -#include <asm/global_data.h>
>  #include <asm/arch/clock.h>
>  #include <asm/arch/imx8mp_pins.h>
>  #include <asm/arch/sys_proto.h>
> @@ -24,8 +23,6 @@
>  #include <power/pmic.h>
>  #include <power/pca9450.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  int spl_board_boot_device(enum boot_device boot_dev_spl)
>  {
>  	return BOOT_DEVICE_BOOTROM;
> diff --git a/board/gdsys/mpc8308/gazerbeam.c b/board/gdsys/mpc8308/gazerbeam.c
> index 05e4d84460a..123dda21423 100644
> --- a/board/gdsys/mpc8308/gazerbeam.c
> +++ b/board/gdsys/mpc8308/gazerbeam.c
> @@ -17,13 +17,10 @@
>  #include <sysinfo.h>
>  #include <tpm-v1.h>
>  #include <video_osd.h>
> -#include <asm/global_data.h>
>  
>  #include "../common/ihs_mdio.h"
>  #include "../../../drivers/sysinfo/gazerbeam.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  struct ihs_mdio_info ihs_mdio_info[] = {
>  	{ .fpga = NULL, .name = "ihs0", .base = 0x58 },
>  	{ .fpga = NULL, .name = "ihs1", .base = 0x58 },
> diff --git a/board/google/imx8mq_phanbell/imx8mq_phanbell.c b/board/google/imx8mq_phanbell/imx8mq_phanbell.c
> index 9544d6dd19a..2f16f1da26c 100644
> --- a/board/google/imx8mq_phanbell/imx8mq_phanbell.c
> +++ b/board/google/imx8mq_phanbell/imx8mq_phanbell.c
> @@ -7,7 +7,6 @@
>  #include <init.h>
>  #include <malloc.h>
>  #include <errno.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <miiphy.h>
>  #include <netdev.h>
> @@ -21,8 +20,6 @@
>  #include <asm/arch/clock.h>
>  #include <spl.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define UART_PAD_CTRL	(PAD_CTL_DSE6 | PAD_CTL_FSEL1)
>  
>  #define WDOG_PAD_CTRL	(PAD_CTL_DSE6 | PAD_CTL_HYS | PAD_CTL_PUE)
> diff --git a/board/highbank/highbank.c b/board/highbank/highbank.c
> index 0ec88447384..62a7b5b0420 100644
> --- a/board/highbank/highbank.c
> +++ b/board/highbank/highbank.c
> @@ -11,7 +11,6 @@
>  #include <init.h>
>  #include <net.h>
>  #include <scsi.h>
> -#include <asm/global_data.h>
>  
>  #include <linux/sizes.h>
>  #include <asm/io.h>
> @@ -37,8 +36,6 @@
>  #define HB_SCU_A9_PWR_DORMANT		2
>  #define HB_SCU_A9_PWR_OFF		3
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  void cphy_disable_overrides(void);
>  
>  /*
> diff --git a/board/kontron/osm-s-mx8mp/osm-s-mx8mp.c b/board/kontron/osm-s-mx8mp/osm-s-mx8mp.c
> index 3db7176f723..739a78d2c8b 100644
> --- a/board/kontron/osm-s-mx8mp/osm-s-mx8mp.c
> +++ b/board/kontron/osm-s-mx8mp/osm-s-mx8mp.c
> @@ -5,7 +5,6 @@
>  
>  #include <asm/arch/imx-regs.h>
>  #include <asm/arch/sys_proto.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <asm/mach-imx/boot_mode.h>
>  #include <dm/uclass.h>
> @@ -22,8 +21,6 @@
>  
>  #include "../common/hw-uid.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #if IS_ENABLED(CONFIG_KONTRON_HW_UID)
>  struct uid_otp_loc uid_otp_locations[] = {
>  	{
> diff --git a/board/kontron/osm-s-mx93/osm-s-mx93.c b/board/kontron/osm-s-mx93/osm-s-mx93.c
> index d4645285771..b6feef549d1 100644
> --- a/board/kontron/osm-s-mx93/osm-s-mx93.c
> +++ b/board/kontron/osm-s-mx93/osm-s-mx93.c
> @@ -6,7 +6,6 @@
>  #include <asm/arch/clock.h>
>  #include <asm/arch/imx-regs.h>
>  #include <asm/arch/sys_proto.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <asm/mach-imx/boot_mode.h>
>  #include <dm/uclass.h>
> @@ -23,8 +22,6 @@
>  
>  #include "../common/hw-uid.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  int board_early_init_f(void)
>  {
>  	return 0;
> diff --git a/board/kontron/pitx_imx8m/pitx_imx8m.c b/board/kontron/pitx_imx8m/pitx_imx8m.c
> index 2ee97169c6f..f71fa57b808 100644
> --- a/board/kontron/pitx_imx8m/pitx_imx8m.c
> +++ b/board/kontron/pitx_imx8m/pitx_imx8m.c
> @@ -15,8 +15,6 @@
>  #include <linux/delay.h>
>  #include <linux/kernel.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define UART_PAD_CTRL	(PAD_CTL_DSE6 | PAD_CTL_FSEL1)
>  #define WDOG_PAD_CTRL	(PAD_CTL_DSE6 | PAD_CTL_HYS | PAD_CTL_PUE)
>  
> diff --git a/board/mntre/imx8mq_reform2/imx8mq_reform2.c b/board/mntre/imx8mq_reform2/imx8mq_reform2.c
> index 6ee1c5c52a1..bcb31564a73 100644
> --- a/board/mntre/imx8mq_reform2/imx8mq_reform2.c
> +++ b/board/mntre/imx8mq_reform2/imx8mq_reform2.c
> @@ -8,7 +8,6 @@
>  #include <init.h>
>  #include <malloc.h>
>  #include <errno.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <miiphy.h>
>  #include <netdev.h>
> @@ -26,8 +25,6 @@
>  #include <linux/delay.h>
>  #include <power/pmic.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define WDOG_PAD_CTRL	(PAD_CTL_DSE6 | PAD_CTL_HYS | PAD_CTL_PUE)
>  
>  static iomux_v3_cfg_t const wdog_pads[] = {
> diff --git a/board/msc/sm2s_imx8mp/sm2s_imx8mp.c b/board/msc/sm2s_imx8mp/sm2s_imx8mp.c
> index b1ce014bd55..b2f763dcc02 100644
> --- a/board/msc/sm2s_imx8mp/sm2s_imx8mp.c
> +++ b/board/msc/sm2s_imx8mp/sm2s_imx8mp.c
> @@ -18,8 +18,6 @@
>  #include <asm-generic/gpio.h>
>  #include <linux/delay.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  static void setup_fec(void)
>  {
>  	struct iomuxc_gpr_base_regs *gpr =
> diff --git a/board/msc/sm2s_imx8mp/spl.c b/board/msc/sm2s_imx8mp/spl.c
> index b1b5561838d..902179aad29 100644
> --- a/board/msc/sm2s_imx8mp/spl.c
> +++ b/board/msc/sm2s_imx8mp/spl.c
> @@ -17,7 +17,6 @@
>  #include <log.h>
>  #include <mmc.h>
>  #include <spl.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <asm/arch/clock.h>
>  #include <asm/arch/ddr.h>
> @@ -33,8 +32,6 @@
>  #include <power/pmic.h>
>  #include <power/rn5t567_pmic.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  int spl_board_boot_device(enum boot_device boot_dev_spl)
>  {
>  	return BOOT_DEVICE_BOOTROM;
> diff --git a/board/nxp/imx8mm_evk/imx8mm_evk.c b/board/nxp/imx8mm_evk/imx8mm_evk.c
> index ecc20768cb5..a8c1ef287e5 100644
> --- a/board/nxp/imx8mm_evk/imx8mm_evk.c
> +++ b/board/nxp/imx8mm_evk/imx8mm_evk.c
> @@ -9,14 +9,11 @@
>  #include <init.h>
>  #include <miiphy.h>
>  #include <netdev.h>
> -#include <asm/global_data.h>
>  
>  #include <asm/arch/clock.h>
>  #include <asm/arch/sys_proto.h>
>  #include <asm/io.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #if CONFIG_IS_ENABLED(EFI_HAVE_CAPSULE_SUPPORT)
>  #define IMX_BOOT_IMAGE_GUID \
>  	EFI_GUID(0xead2005e, 0x7780, 0x400b, 0x93, 0x48, \
> diff --git a/board/nxp/imx8mm_evk/spl.c b/board/nxp/imx8mm_evk/spl.c
> index cd251d274ff..5c588046ff4 100644
> --- a/board/nxp/imx8mm_evk/spl.c
> +++ b/board/nxp/imx8mm_evk/spl.c
> @@ -10,7 +10,6 @@
>  #include <init.h>
>  #include <log.h>
>  #include <spl.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <asm/mach-imx/iomux-v3.h>
>  #include <asm/arch/clock.h>
> @@ -28,8 +27,6 @@
>  #include <power/pmic.h>
>  #include <power/pca9450.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  int spl_board_boot_device(enum boot_device boot_dev_spl)
>  {
>  	switch (boot_dev_spl) {
> diff --git a/board/nxp/imx8mn_evk/spl.c b/board/nxp/imx8mn_evk/spl.c
> index f96f5c45789..6554d445a59 100644
> --- a/board/nxp/imx8mn_evk/spl.c
> +++ b/board/nxp/imx8mn_evk/spl.c
> @@ -11,7 +11,6 @@
>  #include <init.h>
>  #include <log.h>
>  #include <spl.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <asm/mach-imx/iomux-v3.h>
>  #include <asm/arch/clock.h>
> @@ -32,8 +31,6 @@
>  #include <fsl_esdhc_imx.h>
>  #include <mmc.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  int spl_board_boot_device(enum boot_device boot_dev_spl)
>  {
>  	return BOOT_DEVICE_BOOTROM;
> diff --git a/board/nxp/imx8mp_evk/spl.c b/board/nxp/imx8mp_evk/spl.c
> index 12da1b2abfb..25abf6b589e 100644
> --- a/board/nxp/imx8mp_evk/spl.c
> +++ b/board/nxp/imx8mp_evk/spl.c
> @@ -8,7 +8,6 @@
>  #include <init.h>
>  #include <log.h>
>  #include <spl.h>
> -#include <asm/global_data.h>
>  #include <asm/arch/clock.h>
>  #include <asm/arch/imx8mp_pins.h>
>  #include <asm/arch/sys_proto.h>
> @@ -22,8 +21,6 @@
>  #include <dm/uclass.h>
>  #include <dm/device.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  int spl_board_boot_device(enum boot_device boot_dev_spl)
>  {
>  	return BOOT_DEVICE_BOOTROM;
> diff --git a/board/nxp/imx8qm_mek/imx8qm_mek.c b/board/nxp/imx8qm_mek/imx8qm_mek.c
> index 72527f774ca..56f577714e7 100644
> --- a/board/nxp/imx8qm_mek/imx8qm_mek.c
> +++ b/board/nxp/imx8qm_mek/imx8qm_mek.c
> @@ -7,7 +7,6 @@
>  #include <env.h>
>  #include <errno.h>
>  #include <init.h>
> -#include <asm/global_data.h>
>  #include <linux/libfdt.h>
>  #include <fdt_support.h>
>  #include <asm/io.h>
> @@ -18,8 +17,6 @@
>  #include <asm/arch/iomux.h>
>  #include <asm/arch/sys_proto.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define UART_PAD_CTRL	((SC_PAD_CONFIG_OUT_IN << PADRING_CONFIG_SHIFT) | \
>  			 (SC_PAD_ISO_OFF << PADRING_LPCONFIG_SHIFT) | \
>  			 (SC_PAD_28FDSOI_DSE_DV_HIGH << PADRING_DSE_SHIFT) | \
> diff --git a/board/nxp/imx8qxp_mek/imx8qxp_mek.c b/board/nxp/imx8qxp_mek/imx8qxp_mek.c
> index adb9556a021..4bf6645b893 100644
> --- a/board/nxp/imx8qxp_mek/imx8qxp_mek.c
> +++ b/board/nxp/imx8qxp_mek/imx8qxp_mek.c
> @@ -7,7 +7,6 @@
>  #include <env.h>
>  #include <errno.h>
>  #include <init.h>
> -#include <asm/global_data.h>
>  #include <linux/delay.h>
>  #include <linux/libfdt.h>
>  #include <fsl_esdhc_imx.h>
> @@ -21,8 +20,6 @@
>  #include <asm/arch/iomux.h>
>  #include <asm/arch/sys_proto.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define GPIO_PAD_CTRL	((SC_PAD_CONFIG_NORMAL << PADRING_CONFIG_SHIFT) | \
>  			 (SC_PAD_ISO_OFF << PADRING_LPCONFIG_SHIFT) | \
>  			 (SC_PAD_28FDSOI_DSE_DV_HIGH << PADRING_DSE_SHIFT) | \
> diff --git a/board/nxp/imx8ulp_evk/imx8ulp_evk.c b/board/nxp/imx8ulp_evk/imx8ulp_evk.c
> index 4bf77a488cc..cd17f6960c7 100644
> --- a/board/nxp/imx8ulp_evk/imx8ulp_evk.c
> +++ b/board/nxp/imx8ulp_evk/imx8ulp_evk.c
> @@ -14,8 +14,6 @@
>  #include <netdev.h>
>  #include <asm/gpio.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #if IS_ENABLED(CONFIG_FEC_MXC)
>  #define ENET_CLK_PAD_CTRL	(PAD_CTL_PUS_UP | PAD_CTL_DSE | PAD_CTL_IBE_ENABLE)
>  static iomux_cfg_t const enet_clk_pads[] = {
> diff --git a/board/nxp/imx8ulp_evk/spl.c b/board/nxp/imx8ulp_evk/spl.c
> index fe637077928..656c2723494 100644
> --- a/board/nxp/imx8ulp_evk/spl.c
> +++ b/board/nxp/imx8ulp_evk/spl.c
> @@ -21,8 +21,6 @@
>  #include <asm/mach-imx/ele_api.h>
>  #include <asm/sections.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  void spl_dram_init(void)
>  {
>  	/* Reboot in dual boot setting no need to init ddr again */
> diff --git a/board/nxp/imx93_frdm/imx93_frdm.c b/board/nxp/imx93_frdm/imx93_frdm.c
> index cfbcde2e1a5..d97720795d6 100644
> --- a/board/nxp/imx93_frdm/imx93_frdm.c
> +++ b/board/nxp/imx93_frdm/imx93_frdm.c
> @@ -7,7 +7,6 @@
>  #include <efi_loader.h>
>  #include <i2c.h>
>  #include <init.h>
> -#include <asm/global_data.h>
>  #include <asm/arch/sys_proto.h>
>  #include <asm/arch-imx9/imx93_pins.h>
>  #include <asm/arch/clock.h>
> @@ -15,8 +14,6 @@
>  #include <dm/device.h>
>  #include <dm/uclass.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #if IS_ENABLED(CONFIG_EFI_HAVE_CAPSULE_SUPPORT)
>  #define IMX_BOOT_IMAGE_GUID \
>  	EFI_GUID(0xbc550d86, 0xda26, 0x4b70, 0xac, 0x05, \
> diff --git a/board/phytec/imx8mp-libra-fpsc/spl.c b/board/phytec/imx8mp-libra-fpsc/spl.c
> index d704d588579..08111641aa6 100644
> --- a/board/phytec/imx8mp-libra-fpsc/spl.c
> +++ b/board/phytec/imx8mp-libra-fpsc/spl.c
> @@ -8,7 +8,6 @@
>  #include <asm/arch/ddr.h>
>  #include <asm/arch/imx8mp_pins.h>
>  #include <asm/arch/sys_proto.h>
> -#include <asm/global_data.h>
>  #include <asm/mach-imx/boot_mode.h>
>  #include <asm/mach-imx/gpio.h>
>  #include <asm/mach-imx/mxc_i2c.h>
> @@ -24,8 +23,6 @@
>  #include "../common/imx8m_som_detection.h"
>  #endif
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define EEPROM_ADDR		0x51
>  
>  int spl_board_boot_device(enum boot_device boot_dev_spl)
> diff --git a/board/phytec/phycore_imx8mm/phycore-imx8mm.c b/board/phytec/phycore_imx8mm/phycore-imx8mm.c
> index f6ae0bf0308..9f6a4ec704d 100644
> --- a/board/phytec/phycore_imx8mm/phycore-imx8mm.c
> +++ b/board/phytec/phycore_imx8mm/phycore-imx8mm.c
> @@ -5,14 +5,11 @@
>   */
>  
>  #include <asm/arch/sys_proto.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <asm/mach-imx/boot_mode.h>
>  #include <env.h>
>  #include <miiphy.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  static int setup_fec(void)
>  {
>  	struct iomuxc_gpr_base_regs *gpr =
> diff --git a/board/phytec/phycore_imx8mm/spl.c b/board/phytec/phycore_imx8mm/spl.c
> index faff064779c..e688793bc74 100644
> --- a/board/phytec/phycore_imx8mm/spl.c
> +++ b/board/phytec/phycore_imx8mm/spl.c
> @@ -8,7 +8,6 @@
>  #include <asm/arch/ddr.h>
>  #include <asm/arch/imx8mm_pins.h>
>  #include <asm/arch/sys_proto.h>
> -#include <asm/global_data.h>
>  #include <asm/mach-imx/boot_mode.h>
>  #include <asm/mach-imx/iomux-v3.h>
>  #include <asm/sections.h>
> @@ -19,8 +18,6 @@
>  
>  #include "../common/imx8m_som_detection.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define EEPROM_ADDR		0x51
>  #define EEPROM_ADDR_FALLBACK	0x59
>  
> diff --git a/board/phytec/phycore_imx8mp/phycore-imx8mp.c b/board/phytec/phycore_imx8mp/phycore-imx8mp.c
> index b345dc7c985..5f0a7ee6a94 100644
> --- a/board/phytec/phycore_imx8mp/phycore-imx8mp.c
> +++ b/board/phytec/phycore_imx8mp/phycore-imx8mp.c
> @@ -5,7 +5,6 @@
>   */
>  
>  #include <asm/arch/sys_proto.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <asm/mach-imx/boot_mode.h>
>  #include <env.h>
> @@ -17,8 +16,6 @@
>  
>  #include "../common/imx8m_som_detection.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define EEPROM_ADDR		0x51
>  #define EEPROM_ADDR_FALLBACK	0x59
>  
> diff --git a/board/phytec/phycore_imx8mp/spl.c b/board/phytec/phycore_imx8mp/spl.c
> index cb8e450b995..fc7aefd0073 100644
> --- a/board/phytec/phycore_imx8mp/spl.c
> +++ b/board/phytec/phycore_imx8mp/spl.c
> @@ -8,7 +8,6 @@
>  #include <asm/arch/ddr.h>
>  #include <asm/arch/imx8mp_pins.h>
>  #include <asm/arch/sys_proto.h>
> -#include <asm/global_data.h>
>  #include <asm/mach-imx/boot_mode.h>
>  #include <asm/mach-imx/gpio.h>
>  #include <asm/mach-imx/mxc_i2c.h>
> @@ -23,8 +22,6 @@
>  #include "lpddr4_timing.h"
>  #include "../common/imx8m_som_detection.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define EEPROM_ADDR		0x51
>  #define EEPROM_ADDR_FALLBACK	0x59
>  
> diff --git a/board/phytec/phycore_imx93/phycore-imx93.c b/board/phytec/phycore_imx93/phycore-imx93.c
> index cfc6d91f20f..cdaedd52c14 100644
> --- a/board/phytec/phycore_imx93/phycore-imx93.c
> +++ b/board/phytec/phycore_imx93/phycore-imx93.c
> @@ -7,15 +7,12 @@
>   */
>  
>  #include <asm/arch/sys_proto.h>
> -#include <asm/global_data.h>
>  #include <asm/mach-imx/boot_mode.h>
>  #include <env.h>
>  #include <fdt_support.h>
>  
>  #include "../common/imx93_som_detection.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define EEPROM_ADDR            0x50
>  
>  int board_init(void)
> diff --git a/board/polyhex/imx8mp_debix_model_a/imx8mp_debix_model_a.c b/board/polyhex/imx8mp_debix_model_a/imx8mp_debix_model_a.c
> index c709d017483..7f0925074fa 100644
> --- a/board/polyhex/imx8mp_debix_model_a/imx8mp_debix_model_a.c
> +++ b/board/polyhex/imx8mp_debix_model_a/imx8mp_debix_model_a.c
> @@ -8,7 +8,6 @@
>  #include <asm/arch/clock.h>
>  #include <asm/arch/imx8mp_pins.h>
>  #include <asm/arch/sys_proto.h>
> -#include <asm/global_data.h>
>  #include <asm/mach-imx/gpio.h>
>  #include <asm/mach-imx/iomux-v3.h>
>  #include <env.h>
> @@ -18,8 +17,6 @@
>  #include <miiphy.h>
>  #include <netdev.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  static void setup_fec(void)
>  {
>  	struct iomuxc_gpr_base_regs *gpr =
> diff --git a/board/polyhex/imx8mp_debix_model_a/spl.c b/board/polyhex/imx8mp_debix_model_a/spl.c
> index 6cbd1815cad..c154ad7a1ce 100644
> --- a/board/polyhex/imx8mp_debix_model_a/spl.c
> +++ b/board/polyhex/imx8mp_debix_model_a/spl.c
> @@ -8,7 +8,6 @@
>  #include <asm/arch/ddr.h>
>  #include <asm/arch/imx8mp_pins.h>
>  #include <asm/arch/sys_proto.h>
> -#include <asm/global_data.h>
>  #include <asm/mach-imx/boot_mode.h>
>  #include <asm/sections.h>
>  #include <dm/device.h>
> @@ -20,8 +19,6 @@
>  #include <power/pmic.h>
>  #include <spl.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  int spl_board_boot_device(enum boot_device boot_dev_spl)
>  {
>  	return BOOT_DEVICE_BOOTROM;
> diff --git a/board/purism/librem5/librem5.c b/board/purism/librem5/librem5.c
> index 5178ee6929d..a2bc0c08f0b 100644
> --- a/board/purism/librem5/librem5.c
> +++ b/board/purism/librem5/librem5.c
> @@ -31,8 +31,6 @@
>  #include <usb/xhci.h>
>  #include "librem5.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  int board_early_init_f(void)
>  {
>  	return 0;
> diff --git a/board/purism/librem5/spl.c b/board/purism/librem5/spl.c
> index ed57554a2bc..568224f9732 100644
> --- a/board/purism/librem5/spl.c
> +++ b/board/purism/librem5/spl.c
> @@ -29,8 +29,6 @@
>  #include <linux/usb/gadget.h>
>  #include "librem5.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  void spl_dram_init(void)
>  {
>  	/* ddr init */
> diff --git a/board/qualcomm/dragonboard410c/dragonboard410c.c b/board/qualcomm/dragonboard410c/dragonboard410c.c
> index 4698b9d5e3e..36e4d49046e 100644
> --- a/board/qualcomm/dragonboard410c/dragonboard410c.c
> +++ b/board/qualcomm/dragonboard410c/dragonboard410c.c
> @@ -15,13 +15,10 @@
>  #include <net.h>
>  #include <usb.h>
>  #include <asm/cache.h>
> -#include <asm/global_data.h>
>  #include <asm/gpio.h>
>  #include <fdt_support.h>
>  #include <linux/delay.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  static u32 msm_board_serial(void)
>  {
>  	struct mmc *mmc_dev;
> diff --git a/board/qualcomm/dragonboard820c/dragonboard820c.c b/board/qualcomm/dragonboard820c/dragonboard820c.c
> index 12a9273ec4b..236022a99f1 100644
> --- a/board/qualcomm/dragonboard820c/dragonboard820c.c
> +++ b/board/qualcomm/dragonboard820c/dragonboard820c.c
> @@ -10,7 +10,6 @@
>  #include <init.h>
>  #include <env.h>
>  #include <asm/cache.h>
> -#include <asm/global_data.h>
>  #include <linux/arm-smccc.h>
>  #include <linux/psci.h>
>  #include <dm.h>
> @@ -24,8 +23,6 @@
>  /* Strength (sdc1) */
>  #define SDC1_HDRV_PULL_CTL_REG          (TLMM_BASE_ADDR + 0x0012D000)
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  static void sdhci_power_init(void)
>  {
>  	const u32 TLMM_PULL_MASK = 0x3;
> diff --git a/board/renesas/common/gen3-common.c b/board/renesas/common/gen3-common.c
> index f89ae81e95e..5c543807b64 100644
> --- a/board/renesas/common/gen3-common.c
> +++ b/board/renesas/common/gen3-common.c
> @@ -12,15 +12,12 @@
>  #include <fdt_support.h>
>  #include <hang.h>
>  #include <init.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <dm/uclass-internal.h>
>  #include <asm/arch/renesas.h>
>  #include <asm-generic/u-boot.h>
>  #include <linux/libfdt.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  /* If the firmware passed a device tree use it for e.g. U-Boot DRAM setup. */
>  extern u64 rcar_atf_boot_args[];
>  
> diff --git a/board/renesas/common/gen4-common.c b/board/renesas/common/gen4-common.c
> index 81c6f6f4c6d..ac87f2f08e3 100644
> --- a/board/renesas/common/gen4-common.c
> +++ b/board/renesas/common/gen4-common.c
> @@ -8,7 +8,6 @@
>  #include <asm/arch/renesas.h>
>  #include <asm/arch/sys_proto.h>
>  #include <asm/armv8/mmu.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <asm/mach-types.h>
>  #include <asm/processor.h>
> @@ -17,8 +16,6 @@
>  #include <image.h>
>  #include <linux/errno.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  static void init_generic_timer(void)
>  {
>  	const u32 freq = CONFIG_SYS_CLK_FREQ;
> diff --git a/board/renesas/common/gen5-common.c b/board/renesas/common/gen5-common.c
> index 3b724e59049..c60a76c5038 100644
> --- a/board/renesas/common/gen5-common.c
> +++ b/board/renesas/common/gen5-common.c
> @@ -5,7 +5,6 @@
>  
>  #include <asm/arch/renesas.h>
>  #include <asm/arch/sys_proto.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <asm/mach-types.h>
>  #include <asm/processor.h>
> @@ -13,8 +12,6 @@
>  #include <asm-generic/u-boot.h>
>  #include <linux/errno.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  static void init_generic_timer(void)
>  {
>  	const u32 freq = CONFIG_SYS_CLK_FREQ;
> diff --git a/board/ronetix/imx8mq-cm/imx8mq_cm.c b/board/ronetix/imx8mq-cm/imx8mq_cm.c
> index 602216854ba..e41cfefe375 100644
> --- a/board/ronetix/imx8mq-cm/imx8mq_cm.c
> +++ b/board/ronetix/imx8mq-cm/imx8mq_cm.c
> @@ -10,8 +10,6 @@
>  #include <asm/arch/sys_proto.h>
>  #include <asm/arch/clock.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define UART_PAD_CTRL	(PAD_CTL_DSE6 | PAD_CTL_FSEL1)
>  
>  #define WDOG_PAD_CTRL	(PAD_CTL_DSE6 | PAD_CTL_HYS | PAD_CTL_PUE)
> diff --git a/board/samsung/common/exynos5-dt.c b/board/samsung/common/exynos5-dt.c
> index 68edd1ec282..2ba2d6330fd 100644
> --- a/board/samsung/common/exynos5-dt.c
> +++ b/board/samsung/common/exynos5-dt.c
> @@ -9,7 +9,6 @@
>  #include <env.h>
>  #include <fdtdec.h>
>  #include <log.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <errno.h>
>  #include <i2c.h>
> @@ -36,8 +35,6 @@
>  #include <samsung/misc.h>
>  #include <tmu.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  static int exynos_set_regulator(const char *name, uint uv)
>  {
>  	struct udevice *dev;
> diff --git a/board/samsung/common/misc.c b/board/samsung/common/misc.c
> index c134a9d70e2..85e564f27ee 100644
> --- a/board/samsung/common/misc.c
> +++ b/board/samsung/common/misc.c
> @@ -8,7 +8,6 @@
>  #include <command.h>
>  #include <env.h>
>  #include <libtizen.h>
> -#include <asm/global_data.h>
>  #include <linux/delay.h>
>  #include <linux/printk.h>
>  #include <samsung/misc.h>
> @@ -37,8 +36,6 @@
>  #include <power/pmic.h>
>  #include <mmc.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #ifdef CONFIG_SET_DFU_ALT_INFO
>  void set_dfu_alt_info(char *interface, char *devstr)
>  {
> diff --git a/board/st/stm32f429-discovery/stm32f429-discovery.c b/board/st/stm32f429-discovery/stm32f429-discovery.c
> index 4b0defda1ec..333b78c27f3 100644
> --- a/board/st/stm32f429-discovery/stm32f429-discovery.c
> +++ b/board/st/stm32f429-discovery/stm32f429-discovery.c
> @@ -14,13 +14,10 @@
>  #include <env.h>
>  #include <init.h>
>  #include <log.h>
> -#include <asm/global_data.h>
>  
>  #include <asm/io.h>
>  #include <asm/arch/stm32.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  int dram_init(void)
>  {
>  	int rv;
> diff --git a/board/st/stm32f429-evaluation/stm32f429-evaluation.c b/board/st/stm32f429-evaluation/stm32f429-evaluation.c
> index 88c825334a8..feba46d38e4 100644
> --- a/board/st/stm32f429-evaluation/stm32f429-evaluation.c
> +++ b/board/st/stm32f429-evaluation/stm32f429-evaluation.c
> @@ -8,13 +8,10 @@
>  #include <env.h>
>  #include <init.h>
>  #include <log.h>
> -#include <asm/global_data.h>
>  
>  #include <asm/io.h>
>  #include <asm/arch/stm32.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  int dram_init(void)
>  {
>  	int rv;
> diff --git a/board/st/stm32f469-discovery/stm32f469-discovery.c b/board/st/stm32f469-discovery/stm32f469-discovery.c
> index 7aab7f71d0c..d153efdc2b4 100644
> --- a/board/st/stm32f469-discovery/stm32f469-discovery.c
> +++ b/board/st/stm32f469-discovery/stm32f469-discovery.c
> @@ -8,13 +8,10 @@
>  #include <env.h>
>  #include <init.h>
>  #include <log.h>
> -#include <asm/global_data.h>
>  
>  #include <asm/io.h>
>  #include <asm/arch/stm32.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  int dram_init(void)
>  {
>  	int rv;
> diff --git a/board/st/stm32f746-disco/stm32f746-disco.c b/board/st/stm32f746-disco/stm32f746-disco.c
> index 07bc8a5f0a2..4b1e443100d 100644
> --- a/board/st/stm32f746-disco/stm32f746-disco.c
> +++ b/board/st/stm32f746-disco/stm32f746-disco.c
> @@ -15,7 +15,6 @@
>  #include <spl.h>
>  #include <splash.h>
>  #include <video.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <asm/armv7m.h>
>  #include <asm/arch/stm32.h>
> @@ -23,8 +22,6 @@
>  #include <asm/gpio.h>
>  #include <linux/delay.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  int dram_init(void)
>  {
>  #ifndef CONFIG_XPL_BUILD
> diff --git a/board/st/stm32h743-disco/stm32h743-disco.c b/board/st/stm32h743-disco/stm32h743-disco.c
> index d00f55379c5..6c5c6710926 100644
> --- a/board/st/stm32h743-disco/stm32h743-disco.c
> +++ b/board/st/stm32h743-disco/stm32h743-disco.c
> @@ -7,9 +7,6 @@
>  #include <dm.h>
>  #include <init.h>
>  #include <log.h>
> -#include <asm/global_data.h>
> -
> -DECLARE_GLOBAL_DATA_PTR;
>  
>  int dram_init(void)
>  {
> diff --git a/board/st/stm32h743-eval/stm32h743-eval.c b/board/st/stm32h743-eval/stm32h743-eval.c
> index d00f55379c5..6c5c6710926 100644
> --- a/board/st/stm32h743-eval/stm32h743-eval.c
> +++ b/board/st/stm32h743-eval/stm32h743-eval.c
> @@ -7,9 +7,6 @@
>  #include <dm.h>
>  #include <init.h>
>  #include <log.h>
> -#include <asm/global_data.h>
> -
> -DECLARE_GLOBAL_DATA_PTR;
>  
>  int dram_init(void)
>  {
> diff --git a/board/st/stm32h747-disco/stm32h747-disco.c b/board/st/stm32h747-disco/stm32h747-disco.c
> index 645685a64f1..24a229bf0a2 100644
> --- a/board/st/stm32h747-disco/stm32h747-disco.c
> +++ b/board/st/stm32h747-disco/stm32h747-disco.c
> @@ -8,9 +8,6 @@
>  #include <dm.h>
>  #include <init.h>
>  #include <log.h>
> -#include <asm/global_data.h>
> -
> -DECLARE_GLOBAL_DATA_PTR;
>  
>  int dram_init(void)
>  {
> diff --git a/board/st/stm32h750-art-pi/stm32h750-art-pi.c b/board/st/stm32h750-art-pi/stm32h750-art-pi.c
> index 31c85c6816e..244bb5eefb3 100644
> --- a/board/st/stm32h750-art-pi/stm32h750-art-pi.c
> +++ b/board/st/stm32h750-art-pi/stm32h750-art-pi.c
> @@ -7,9 +7,6 @@
>  #include <dm.h>
>  #include <init.h>
>  #include <log.h>
> -#include <asm/global_data.h>
> -
> -DECLARE_GLOBAL_DATA_PTR;
>  
>  int dram_init(void)
>  {
> diff --git a/board/technexion/pico-imx8mq/pico-imx8mq.c b/board/technexion/pico-imx8mq/pico-imx8mq.c
> index 1659db112fa..5515fc09f99 100644
> --- a/board/technexion/pico-imx8mq/pico-imx8mq.c
> +++ b/board/technexion/pico-imx8mq/pico-imx8mq.c
> @@ -7,7 +7,6 @@
>  #include <init.h>
>  #include <malloc.h>
>  #include <errno.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <miiphy.h>
>  #include <netdev.h>
> @@ -24,8 +23,6 @@
>  #include <spl.h>
>  #include <power/pmic.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define UART_PAD_CTRL	(PAD_CTL_DSE6 | PAD_CTL_FSEL1)
>  
>  #define WDOG_PAD_CTRL	(PAD_CTL_DSE6 | PAD_CTL_HYS | PAD_CTL_PUE)
> diff --git a/board/ti/am62x/evm.c b/board/ti/am62x/evm.c
> index 2e8336900d1..49e58ad6d6c 100644
> --- a/board/ti/am62x/evm.c
> +++ b/board/ti/am62x/evm.c
> @@ -32,8 +32,6 @@
>  #define board_is_am62x_lp_skevm()  board_ti_k3_is("AM62-LP-SKEVM")
>  #define board_is_am62x_sip_skevm()  board_ti_k3_is("AM62SIP-SKEVM")
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #if CONFIG_IS_ENABLED(SPLASH_SCREEN)
>  static struct splash_location default_splash_locations[] = {
>  	{
> diff --git a/board/ti/am64x/evm.c b/board/ti/am64x/evm.c
> index 25076a8a588..764e3011bac 100644
> --- a/board/ti/am64x/evm.c
> +++ b/board/ti/am64x/evm.c
> @@ -27,8 +27,6 @@
>  #define board_is_am64x_skevm() (board_ti_k3_is("AM64-SKEVM") || \
>  				board_ti_k3_is("AM64B-SKEVM"))
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  struct efi_fw_image fw_images[] = {
>  	{
>  		.image_type_id = AM64X_SK_TIBOOT3_IMAGE_GUID,
> diff --git a/board/ti/j784s4/evm.c b/board/ti/j784s4/evm.c
> index cabb3017ee1..8a4d40a5a95 100644
> --- a/board/ti/j784s4/evm.c
> +++ b/board/ti/j784s4/evm.c
> @@ -14,8 +14,6 @@
>  #include <asm/arch/k3-ddr.h>
>  #include "../common/fdt_ops.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  struct efi_fw_image fw_images[] = {
>  	{
>  		.image_type_id = AM69_SK_TIBOOT3_IMAGE_GUID,
> diff --git a/board/toradex/apalis-imx8/apalis-imx8.c b/board/toradex/apalis-imx8/apalis-imx8.c
> index a8c38208693..b915673d9e3 100644
> --- a/board/toradex/apalis-imx8/apalis-imx8.c
> +++ b/board/toradex/apalis-imx8/apalis-imx8.c
> @@ -5,7 +5,6 @@
>  
>  #include <cpu_func.h>
>  #include <init.h>
> -#include <asm/global_data.h>
>  
>  #include <asm/arch/clock.h>
>  #include <asm/arch/imx8-pins.h>
> @@ -24,8 +23,6 @@
>  
>  #include "../common/tdx-cfg-block.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define UART_PAD_CTRL	((SC_PAD_CONFIG_OUT_IN << PADRING_CONFIG_SHIFT) | \
>  			 (SC_PAD_ISO_OFF << PADRING_LPCONFIG_SHIFT) | \
>  			 (SC_PAD_28FDSOI_DSE_DV_HIGH << PADRING_DSE_SHIFT) | \
> diff --git a/board/toradex/apalis_t30/apalis_t30.c b/board/toradex/apalis_t30/apalis_t30.c
> index 2c785da41ea..8dad41f4122 100644
> --- a/board/toradex/apalis_t30/apalis_t30.c
> +++ b/board/toradex/apalis_t30/apalis_t30.c
> @@ -11,7 +11,6 @@
>  #include <asm/arch/pinmux.h>
>  #include <asm/arch-tegra/ap.h>
>  #include <asm/arch-tegra/tegra.h>
> -#include <asm/global_data.h>
>  #include <asm/gpio.h>
>  #include <asm/io.h>
>  #include <dm.h>
> @@ -23,8 +22,6 @@
>  
>  #include "pinmux-config-apalis_t30.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define PMU_I2C_ADDRESS		0x2D
>  #define MAX_I2C_RETRY		3
>  
> diff --git a/board/toradex/colibri-imx8x/colibri-imx8x.c b/board/toradex/colibri-imx8x/colibri-imx8x.c
> index 2a71e7b92de..0a86420700d 100644
> --- a/board/toradex/colibri-imx8x/colibri-imx8x.c
> +++ b/board/toradex/colibri-imx8x/colibri-imx8x.c
> @@ -5,7 +5,6 @@
>  
>  #include <cpu_func.h>
>  #include <init.h>
> -#include <asm/global_data.h>
>  
>  #include <asm/arch/clock.h>
>  #include <asm/arch/imx8-pins.h>
> @@ -21,8 +20,6 @@
>  
>  #include "../common/tdx-cfg-block.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define UART_PAD_CTRL	((SC_PAD_CONFIG_OUT_IN << PADRING_CONFIG_SHIFT) | \
>  			 (SC_PAD_ISO_OFF << PADRING_LPCONFIG_SHIFT) | \
>  			 (SC_PAD_28FDSOI_DSE_DV_HIGH << PADRING_DSE_SHIFT) | \
> diff --git a/board/toradex/colibri_t20/colibri_t20.c b/board/toradex/colibri_t20/colibri_t20.c
> index 05c3377a60b..ccfe2c4933c 100644
> --- a/board/toradex/colibri_t20/colibri_t20.c
> +++ b/board/toradex/colibri_t20/colibri_t20.c
> @@ -13,7 +13,6 @@
>  #include <asm/arch-tegra/ap.h>
>  #include <asm/arch-tegra/board.h>
>  #include <asm/arch-tegra/tegra.h>
> -#include <asm/global_data.h>
>  #include <asm/gpio.h>
>  #include <asm/io.h>
>  #include <i2c.h>
> @@ -21,8 +20,6 @@
>  #include <linux/delay.h>
>  #include "../common/tdx-common.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define PMU_I2C_ADDRESS		0x34
>  #define MAX_I2C_RETRY		3
>  #define PMU_SUPPLYENE		0x14
> diff --git a/board/toradex/common/tdx-cfg-block.c b/board/toradex/common/tdx-cfg-block.c
> index 0fc3759695f..e53530175ae 100644
> --- a/board/toradex/common/tdx-cfg-block.c
> +++ b/board/toradex/common/tdx-cfg-block.c
> @@ -4,7 +4,6 @@
>   */
>  
>  #include <config.h>
> -#include <asm/global_data.h>
>  #include "tdx-cfg-block.h"
>  #include "tdx-eeprom.h"
>  
> @@ -22,8 +21,6 @@
>  #include <nand.h>
>  #include <asm/mach-types.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define TAG_VALID	0xcf01
>  #define TAG_MAC		0x0000
>  #define TAG_CAR_SERIAL	0x0021
> diff --git a/board/toradex/smarc-imx8mp/smarc-imx8mp.c b/board/toradex/smarc-imx8mp/smarc-imx8mp.c
> index 915b413b15e..38fb3d61f5b 100644
> --- a/board/toradex/smarc-imx8mp/smarc-imx8mp.c
> +++ b/board/toradex/smarc-imx8mp/smarc-imx8mp.c
> @@ -2,14 +2,11 @@
>  /* Copyright (C) 2024 Toradex */
>  
>  #include <init.h>
> -#include <asm/global_data.h>
>  #include <asm-generic/gpio.h>
>  #include <linux/errno.h>
>  
>  #include "../common/tdx-cfg-block.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  int board_phys_sdram_size(phys_size_t *size)
>  {
>  	if (!size)
> diff --git a/board/toradex/smarc-imx8mp/spl.c b/board/toradex/smarc-imx8mp/spl.c
> index 32233c0e1ab..511f62e871b 100644
> --- a/board/toradex/smarc-imx8mp/spl.c
> +++ b/board/toradex/smarc-imx8mp/spl.c
> @@ -8,7 +8,6 @@
>  #include <asm/arch/clock.h>
>  #include <asm/arch/ddr.h>
>  #include <asm/arch/sys_proto.h>
> -#include <asm/global_data.h>
>  #include <asm/mach-imx/boot_mode.h>
>  #include <dm/device.h>
>  #include <power/pmic.h>
> @@ -16,8 +15,6 @@
>  
>  #include "lpddr4_timing.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  int spl_board_boot_device(enum boot_device boot_dev_spl)
>  {
>  	return BOOT_DEVICE_BOOTROM;
> diff --git a/board/toradex/verdin-imx8mm/spl.c b/board/toradex/verdin-imx8mm/spl.c
> index 3c2d0ba1dd4..10b9991e3bf 100644
> --- a/board/toradex/verdin-imx8mm/spl.c
> +++ b/board/toradex/verdin-imx8mm/spl.c
> @@ -11,7 +11,6 @@
>  #include <asm/arch/ddr.h>
>  #include <asm/arch/imx8mm_pins.h>
>  #include <asm/arch/sys_proto.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <asm/mach-imx/boot_mode.h>
>  #include <asm/mach-imx/iomux-v3.h>
> @@ -27,8 +26,6 @@
>  #include <power/pmic.h>
>  #include <spl.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define I2C_PMIC_BUS_ID        1
>  
>  int spl_board_boot_device(enum boot_device boot_dev_spl)
> diff --git a/board/toradex/verdin-imx8mm/verdin-imx8mm.c b/board/toradex/verdin-imx8mm/verdin-imx8mm.c
> index b4402415845..b56f5bf30a8 100644
> --- a/board/toradex/verdin-imx8mm/verdin-imx8mm.c
> +++ b/board/toradex/verdin-imx8mm/verdin-imx8mm.c
> @@ -7,7 +7,6 @@
>  #include <init.h>
>  #include <asm/arch/clock.h>
>  #include <asm/arch/sys_proto.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <hang.h>
>  #include <i2c.h>
> @@ -17,8 +16,6 @@
>  
>  #include "../common/tdx-cfg-block.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define I2C_PMIC	0
>  
>  enum pcb_rev_t {
> diff --git a/board/toradex/verdin-imx8mp/spl.c b/board/toradex/verdin-imx8mp/spl.c
> index 8628112a782..b39058b1b5d 100644
> --- a/board/toradex/verdin-imx8mp/spl.c
> +++ b/board/toradex/verdin-imx8mp/spl.c
> @@ -7,7 +7,6 @@
>  #include <init.h>
>  #include <log.h>
>  #include <spl.h>
> -#include <asm/global_data.h>
>  #include <asm/arch/clock.h>
>  #include <asm/arch/imx8mp_pins.h>
>  #include <asm/arch/sys_proto.h>
> @@ -22,8 +21,6 @@
>  #include <power/pca9450.h>
>  #include "lpddr4_timing.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  int spl_board_boot_device(enum boot_device boot_dev_spl)
>  {
>  	return BOOT_DEVICE_BOOTROM;
> diff --git a/board/toradex/verdin-imx8mp/verdin-imx8mp.c b/board/toradex/verdin-imx8mp/verdin-imx8mp.c
> index 34ce25512e8..59b4607f065 100644
> --- a/board/toradex/verdin-imx8mp/verdin-imx8mp.c
> +++ b/board/toradex/verdin-imx8mp/verdin-imx8mp.c
> @@ -8,7 +8,6 @@
>  #include <asm/arch/imx8mp_pins.h>
>  #include <asm/arch/sys_proto.h>
>  #include <asm-generic/gpio.h>
> -#include <asm/global_data.h>
>  #include <asm/mach-imx/gpio.h>
>  #include <asm/mach-imx/iomux-v3.h>
>  #include <errno.h>
> @@ -21,8 +20,6 @@
>  
>  #include "../common/tdx-cfg-block.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define UART_PAD_CTRL	(PAD_CTL_DSE6 | PAD_CTL_FSEL1)
>  
>  /* Verdin UART_3, Console/Debug UART */
> diff --git a/board/xilinx/zynq/bootimg.c b/board/xilinx/zynq/bootimg.c
> index 9eb0735f55d..52400672799 100644
> --- a/board/xilinx/zynq/bootimg.c
> +++ b/board/xilinx/zynq/bootimg.c
> @@ -5,15 +5,12 @@
>  
>  #include <log.h>
>  #include <part.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <asm/arch/hardware.h>
>  #include <asm/arch/sys_proto.h>
>  #include <u-boot/md5.h>
>  #include <zynq_bootimg.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define ZYNQ_IMAGE_PHDR_OFFSET		0x09C
>  #define ZYNQ_IMAGE_FSBL_LEN_OFFSET	0x040
>  #define ZYNQ_PART_HDR_CHKSUM_WORD_COUNT	0x0F
> diff --git a/boot/bootmeth-uclass.c b/boot/bootmeth-uclass.c
> index a9709465f6e..c841dd0d6d4 100644
> --- a/boot/bootmeth-uclass.c
> +++ b/boot/bootmeth-uclass.c
> @@ -19,8 +19,6 @@
>  #include <mapmem.h>
>  #include <dm/uclass-internal.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  int bootmeth_get_state_desc(struct udevice *dev, char *buf, int maxsize)
>  {
>  	const struct bootmeth_ops *ops = bootmeth_get_ops(dev);
> diff --git a/boot/fdt_simplefb.c b/boot/fdt_simplefb.c
> index 5822131767d..69c7c2e24c0 100644
> --- a/boot/fdt_simplefb.c
> +++ b/boot/fdt_simplefb.c
> @@ -8,14 +8,11 @@
>  
>  #include <dm.h>
>  #include <fdt_support.h>
> -#include <asm/global_data.h>
>  #include <linux/libfdt.h>
>  #include <video.h>
>  #include <spl.h>
>  #include <bloblist.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  static int fdt_simplefb_configure_node(void *blob, int off)
>  {
>  	int xsize, ysize;
> diff --git a/boot/image-sig.c b/boot/image-sig.c
> index 6bc74866eae..4eab017bc2d 100644
> --- a/boot/image-sig.c
> +++ b/boot/image-sig.c
> @@ -5,8 +5,6 @@
>  
>  #include <log.h>
>  #include <malloc.h>
> -#include <asm/global_data.h>
> -DECLARE_GLOBAL_DATA_PTR;
>  #include <image.h>
>  #include <relocate.h>
>  #include <u-boot/ecdsa.h>
> diff --git a/boot/image.c b/boot/image.c
> index dd96f712b6f..3f745254763 100644
> --- a/boot/image.c
> +++ b/boot/image.c
> @@ -24,12 +24,9 @@
>  #include <fdt_support.h>
>  #endif
>  
> -#include <asm/global_data.h>
>  #include <linux/errno.h>
>  #include <asm/io.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  /* Set this if we have less than 4 MB of malloc() space */
>  #if CONFIG_SYS_MALLOC_LEN < (4096 * 1024)
>  #define CONSERVE_MEMORY		true
> diff --git a/cmd/bloblist.c b/cmd/bloblist.c
> index 333ae558142..318a1af0220 100644
> --- a/cmd/bloblist.c
> +++ b/cmd/bloblist.c
> @@ -8,9 +8,6 @@
>  
>  #include <bloblist.h>
>  #include <command.h>
> -#include <asm/global_data.h>
> -
> -DECLARE_GLOBAL_DATA_PTR;
>  
>  static int do_bloblist_info(struct cmd_tbl *cmdtp, int flag, int argc,
>  			    char *const argv[])
> diff --git a/cmd/bootefi.c b/cmd/bootefi.c
> index b8f5bb35950..85f41c3b0a0 100644
> --- a/cmd/bootefi.c
> +++ b/cmd/bootefi.c
> @@ -17,11 +17,8 @@
>  #include <mapmem.h>
>  #include <vsprintf.h>
>  #include <asm-generic/sections.h>
> -#include <asm/global_data.h>
>  #include <linux/string.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  static struct efi_device_path *test_image_path;
>  static struct efi_device_path *test_device_path;
>  
> diff --git a/cmd/bootm.c b/cmd/bootm.c
> index 2c5aea26d98..ca7cec91fad 100644
> --- a/cmd/bootm.c
> +++ b/cmd/bootm.c
> @@ -15,14 +15,11 @@
>  #include <malloc.h>
>  #include <nand.h>
>  #include <asm/byteorder.h>
> -#include <asm/global_data.h>
>  #include <linux/ctype.h>
>  #include <linux/err.h>
>  #include <u-boot/zlib.h>
>  #include <mapmem.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #if defined(CONFIG_CMD_IMI)
>  static int image_info(unsigned long addr);
>  #endif
> diff --git a/cmd/date.c b/cmd/date.c
> index 8614f022761..d047872289c 100644
> --- a/cmd/date.c
> +++ b/cmd/date.c
> @@ -11,9 +11,6 @@
>  #include <dm.h>
>  #include <rtc.h>
>  #include <i2c.h>
> -#include <asm/global_data.h>
> -
> -DECLARE_GLOBAL_DATA_PTR;
>  
>  static const char * const weekdays[] = {
>  	"Sun", "Mon", "Tues", "Wednes", "Thurs", "Fri", "Satur",
> diff --git a/cmd/mem.c b/cmd/mem.c
> index 8690fc1e4e6..68eb6989b94 100644
> --- a/cmd/mem.c
> +++ b/cmd/mem.c
> @@ -28,15 +28,12 @@
>  #include <time.h>
>  #include <vsprintf.h>
>  #include <watchdog.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <linux/bitops.h>
>  #include <linux/compiler.h>
>  #include <linux/ctype.h>
>  #include <linux/delay.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  /* Create a compile-time value */
>  #if MEM_SUPPORT_64BIT_DATA
>  #define HELP_Q ", .q"
> diff --git a/cmd/sound.c b/cmd/sound.c
> index 8f67cbd96e1..7546059022f 100644
> --- a/cmd/sound.c
> +++ b/cmd/sound.c
> @@ -8,9 +8,6 @@
>  #include <dm.h>
>  #include <fdtdec.h>
>  #include <sound.h>
> -#include <asm/global_data.h>
> -
> -DECLARE_GLOBAL_DATA_PTR;
>  
>  /* Initilaise sound subsystem */
>  static int do_init(struct cmd_tbl *cmdtp, int flag, int argc,
> diff --git a/cmd/spl.c b/cmd/spl.c
> index f591dc07fb6..ddbbd4a8172 100644
> --- a/cmd/spl.c
> +++ b/cmd/spl.c
> @@ -9,11 +9,8 @@
>  #include <env.h>
>  #include <image.h>
>  #include <log.h>
> -#include <asm/global_data.h>
>  #include <linux/libfdt.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  static const char **subcmd_list[] = {
>  
>  	[SPL_EXPORT_FDT] = (const char * []) {
> diff --git a/common/cli_hush.c b/common/cli_hush.c
> index fb087960c92..fe8fe93bd54 100644
> --- a/common/cli_hush.c
> +++ b/common/cli_hush.c
> @@ -84,7 +84,6 @@
>  #include <cli_hush.h>
>  #include <command.h>        /* find_cmd */
>  #include <vsprintf.h>
> -#include <asm/global_data.h>
>  #endif
>  #ifndef __U_BOOT__
>  #include <ctype.h>     /* isalpha, isdigit */
> @@ -125,8 +124,6 @@
>  #endif
>  
>  #ifdef __U_BOOT__
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define EXIT_SUCCESS 0
>  #define EOF -1
>  #define syntax() syntax_err()
> diff --git a/common/stdio.c b/common/stdio.c
> index 3eeb289dd8b..fc965944209 100644
> --- a/common/stdio.c
> +++ b/common/stdio.c
> @@ -18,11 +18,8 @@
>  #include <serial.h>
>  #include <splash.h>
>  #include <i2c.h>
> -#include <asm/global_data.h>
>  #include <dm/device-internal.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  static struct stdio_dev devs;
>  struct stdio_dev *stdio_devices[] = { NULL, NULL, NULL };
>  char *stdio_names[MAX_FILES] = { "stdin", "stdout", "stderr" };
> diff --git a/drivers/block/sandbox.c b/drivers/block/sandbox.c
> index 9cb27561a97..4b3de0529ce 100644
> --- a/drivers/block/sandbox.c
> +++ b/drivers/block/sandbox.c
> @@ -10,13 +10,10 @@
>  #include <os.h>
>  #include <malloc.h>
>  #include <sandbox_host.h>
> -#include <asm/global_data.h>
>  #include <dm/device_compat.h>
>  #include <dm/device-internal.h>
>  #include <linux/errno.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  static unsigned long host_block_read(struct udevice *dev,
>  				     lbaint_t start, lbaint_t blkcnt,
>  				     void *buffer)
> diff --git a/drivers/bootcount/pmic_pfuze100.c b/drivers/bootcount/pmic_pfuze100.c
> index 8c529f5592b..dd11344322b 100644
> --- a/drivers/bootcount/pmic_pfuze100.c
> +++ b/drivers/bootcount/pmic_pfuze100.c
> @@ -13,8 +13,6 @@
>  #include <power/pmic.h>
>  #include <power/pfuze100_pmic.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define PFUZE_BC_MAGIC 0xdead
>  
>  struct bootcount_pmic_priv {
> diff --git a/drivers/cache/sandbox_cache.c b/drivers/cache/sandbox_cache.c
> index 375892fafb0..b27960f1bfa 100644
> --- a/drivers/cache/sandbox_cache.c
> +++ b/drivers/cache/sandbox_cache.c
> @@ -6,9 +6,6 @@
>  #include <cache.h>
>  #include <dm.h>
>  #include <errno.h>
> -#include <asm/global_data.h>
> -
> -DECLARE_GLOBAL_DATA_PTR;
>  
>  static int sandbox_get_info(struct udevice *dev, struct cache_info *info)
>  {
> diff --git a/drivers/clk/altera/clk-agilex.c b/drivers/clk/altera/clk-agilex.c
> index fdbf834bb2f..9d49561512b 100644
> --- a/drivers/clk/altera/clk-agilex.c
> +++ b/drivers/clk/altera/clk-agilex.c
> @@ -6,7 +6,6 @@
>  
>  #include <log.h>
>  #include <wait_bit.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <asm/system.h>
>  #include <clk-uclass.h>
> @@ -19,8 +18,6 @@
>  
>  #include <asm/arch/clock_manager.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  struct socfpga_clk_plat {
>  	void __iomem *regs;
>  	int pllgrp;
> diff --git a/drivers/clk/altera/clk-agilex5.c b/drivers/clk/altera/clk-agilex5.c
> index fb1e72ffc5c..92b91a9dfc8 100644
> --- a/drivers/clk/altera/clk-agilex5.c
> +++ b/drivers/clk/altera/clk-agilex5.c
> @@ -12,7 +12,6 @@
>  #include <stdio.h>
>  #include <time.h>
>  #include <vsprintf.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <asm/system.h>
>  #include <dm/lists.h>
> @@ -26,8 +25,6 @@
>  #include <wait_bit.h>
>  #include <clk-uclass.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define CLKMGR_CTRL_SWCTRLBTCLKEN_MASK		BIT(8)
>  #define CLKMGR_CTRL_SWCTRLBTCLKSEL_MASK		BIT(9)
>  
> diff --git a/drivers/clk/altera/clk-mem-n5x.c b/drivers/clk/altera/clk-mem-n5x.c
> index b75f52d203b..ac59571a853 100644
> --- a/drivers/clk/altera/clk-mem-n5x.c
> +++ b/drivers/clk/altera/clk-mem-n5x.c
> @@ -4,7 +4,6 @@
>   */
>  
>  #include <asm/arch/clock_manager.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include "clk-mem-n5x.h"
>  #include <clk-uclass.h>
> @@ -13,8 +12,6 @@
>  #include <dm/util.h>
>  #include <dt-bindings/clock/n5x-clock.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  struct socfpga_mem_clk_plat {
>  	void __iomem *regs;
>  };
> diff --git a/drivers/clk/altera/clk-n5x.c b/drivers/clk/altera/clk-n5x.c
> index 9e4e7a1d908..185c9028a78 100644
> --- a/drivers/clk/altera/clk-n5x.c
> +++ b/drivers/clk/altera/clk-n5x.c
> @@ -4,7 +4,6 @@
>   */
>  
>  #include <asm/arch/clock_manager.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <clk-uclass.h>
>  #include <dm.h>
> @@ -12,8 +11,6 @@
>  #include <dm/util.h>
>  #include <dt-bindings/clock/n5x-clock.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  struct socfpga_clk_plat {
>  	void __iomem *regs;
>  };
> diff --git a/drivers/clk/rockchip/clk_px30.c b/drivers/clk/rockchip/clk_px30.c
> index b5054e84c32..d143a6b85ee 100644
> --- a/drivers/clk/rockchip/clk_px30.c
> +++ b/drivers/clk/rockchip/clk_px30.c
> @@ -13,15 +13,12 @@
>  #include <asm/arch-rockchip/clock.h>
>  #include <asm/arch-rockchip/cru_px30.h>
>  #include <asm/arch-rockchip/hardware.h>
> -#include <asm/global_data.h>
>  #include <dm/device-internal.h>
>  #include <dm/lists.h>
>  #include <dt-bindings/clock/px30-cru.h>
>  #include <linux/bitops.h>
>  #include <linux/delay.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  enum {
>  	VCO_MAX_HZ	= 3200U * 1000000,
>  	VCO_MIN_HZ	= 800 * 1000000,
> diff --git a/drivers/clk/rockchip/clk_rk3308.c b/drivers/clk/rockchip/clk_rk3308.c
> index e73bb6790af..97043b8693c 100644
> --- a/drivers/clk/rockchip/clk_rk3308.c
> +++ b/drivers/clk/rockchip/clk_rk3308.c
> @@ -10,7 +10,6 @@
>  #include <log.h>
>  #include <malloc.h>
>  #include <syscon.h>
> -#include <asm/global_data.h>
>  #include <asm/arch-rockchip/clock.h>
>  #include <asm/arch-rockchip/cru_rk3308.h>
>  #include <asm/arch-rockchip/hardware.h>
> @@ -19,8 +18,6 @@
>  #include <dt-bindings/clock/rk3308-cru.h>
>  #include <linux/bitops.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  enum {
>  	VCO_MAX_HZ	= 3200U * 1000000,
>  	VCO_MIN_HZ	= 800 * 1000000,
> diff --git a/drivers/clk/rockchip/clk_rk3528.c b/drivers/clk/rockchip/clk_rk3528.c
> index d58557ff56d..bcdc0f930d2 100644
> --- a/drivers/clk/rockchip/clk_rk3528.c
> +++ b/drivers/clk/rockchip/clk_rk3528.c
> @@ -17,8 +17,6 @@
>  #include <dt-bindings/clock/rockchip,rk3528-cru.h>
>  #include <linux/delay.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define DIV_TO_RATE(input_rate, div)	((input_rate) / ((div) + 1))
>  
>  /*
> diff --git a/drivers/clk/rockchip/clk_rk3568.c b/drivers/clk/rockchip/clk_rk3568.c
> index 533031caead..bb49af358e6 100644
> --- a/drivers/clk/rockchip/clk_rk3568.c
> +++ b/drivers/clk/rockchip/clk_rk3568.c
> @@ -16,8 +16,6 @@
>  #include <dm/lists.h>
>  #include <dt-bindings/clock/rk3568-cru.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #if CONFIG_IS_ENABLED(OF_PLATDATA)
>  struct rk3568_clk_plat {
>  	struct dtd_rockchip_rk3568_cru dtd;
> diff --git a/drivers/clk/rockchip/clk_rk3576.c b/drivers/clk/rockchip/clk_rk3576.c
> index 125b08ee832..1026af27ca1 100644
> --- a/drivers/clk/rockchip/clk_rk3576.c
> +++ b/drivers/clk/rockchip/clk_rk3576.c
> @@ -17,8 +17,6 @@
>  #include <dt-bindings/clock/rockchip,rk3576-cru.h>
>  #include <linux/delay.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define DIV_TO_RATE(input_rate, div)	((input_rate) / ((div) + 1))
>  
>  static struct rockchip_pll_rate_table rk3576_24m_pll_rates[] = {
> diff --git a/drivers/clk/rockchip/clk_rk3588.c b/drivers/clk/rockchip/clk_rk3588.c
> index 8c3a113526f..be401a9faee 100644
> --- a/drivers/clk/rockchip/clk_rk3588.c
> +++ b/drivers/clk/rockchip/clk_rk3588.c
> @@ -17,8 +17,6 @@
>  #include <dm/lists.h>
>  #include <dt-bindings/clock/rockchip,rk3588-cru.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define DIV_TO_RATE(input_rate, div)	((input_rate) / ((div) + 1))
>  
>  static struct rockchip_pll_rate_table rk3588_pll_rates[] = {
> diff --git a/drivers/clk/rockchip/clk_rv1108.c b/drivers/clk/rockchip/clk_rv1108.c
> index 75202a66aa6..e1b9ccf1236 100644
> --- a/drivers/clk/rockchip/clk_rv1108.c
> +++ b/drivers/clk/rockchip/clk_rv1108.c
> @@ -11,7 +11,6 @@
>  #include <log.h>
>  #include <malloc.h>
>  #include <syscon.h>
> -#include <asm/global_data.h>
>  #include <asm/arch-rockchip/clock.h>
>  #include <asm/arch-rockchip/cru_rv1108.h>
>  #include <asm/arch-rockchip/hardware.h>
> @@ -21,8 +20,6 @@
>  #include <linux/delay.h>
>  #include <linux/stringify.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  enum {
>  	VCO_MAX_HZ	= 2400U * 1000000,
>  	VCO_MIN_HZ	= 600 * 1000000,
> diff --git a/drivers/clk/rockchip/clk_rv1126.c b/drivers/clk/rockchip/clk_rv1126.c
> index aeeea956914..39920d34b75 100644
> --- a/drivers/clk/rockchip/clk_rv1126.c
> +++ b/drivers/clk/rockchip/clk_rv1126.c
> @@ -18,8 +18,6 @@
>  #include <dm/lists.h>
>  #include <dt-bindings/clock/rockchip,rv1126-cru.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define RV1126_CPUCLK_RATE(_rate, _aclk_div, _pclk_div)		\
>  {								\
>  	.rate	= _rate##U,					\
> diff --git a/drivers/cpu/bcm283x_cpu.c b/drivers/cpu/bcm283x_cpu.c
> index 59a7b142c95..ad638cd8fff 100644
> --- a/drivers/cpu/bcm283x_cpu.c
> +++ b/drivers/cpu/bcm283x_cpu.c
> @@ -11,7 +11,6 @@
>  #include <asm/armv8/cpu.h>
>  #include <asm/cache.h>
>  #include <asm/io.h>
> -#include <asm/global_data.h>
>  #include <asm/system.h>
>  #include <asm-generic/sections.h>
>  #include <linux/bitops.h>
> @@ -19,8 +18,6 @@
>  #include <linux/delay.h>
>  #include "armv8_cpu.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  struct bcm_plat {
>  	u64 release_addr;
>  };
> diff --git a/drivers/cpu/cpu-uclass.c b/drivers/cpu/cpu-uclass.c
> index 2c8e46c05e3..b73768de918 100644
> --- a/drivers/cpu/cpu-uclass.c
> +++ b/drivers/cpu/cpu-uclass.c
> @@ -15,8 +15,6 @@
>  #include <linux/err.h>
>  #include <relocate.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  int cpu_probe_all(void)
>  {
>  	int ret = uclass_probe_all(UCLASS_CPU);
> diff --git a/drivers/cpu/imx8_cpu.c b/drivers/cpu/imx8_cpu.c
> index 5f17122c36c..3cd00199548 100644
> --- a/drivers/cpu/imx8_cpu.c
> +++ b/drivers/cpu/imx8_cpu.c
> @@ -6,7 +6,6 @@
>  #include <cpu.h>
>  #include <dm.h>
>  #include <thermal.h>
> -#include <asm/global_data.h>
>  #include <asm/ptrace.h>
>  #include <asm/system.h>
>  #include <firmware/imx/sci/sci.h>
> @@ -18,8 +17,6 @@
>  #include <linux/clk-provider.h>
>  #include <linux/psci.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define IMX_REV_LEN	4
>  struct cpu_imx_plat {
>  	const char *name;
> diff --git a/drivers/cpu/mtk_cpu.c b/drivers/cpu/mtk_cpu.c
> index 2a08be9b6d1..4f4e5480eac 100644
> --- a/drivers/cpu/mtk_cpu.c
> +++ b/drivers/cpu/mtk_cpu.c
> @@ -10,12 +10,9 @@
>  #include <dm.h>
>  #include <regmap.h>
>  #include <syscon.h>
> -#include <asm/global_data.h>
>  #include <linux/err.h>
>  #include <linux/io.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  struct mtk_cpu_plat {
>  	struct regmap *hwver;
>  };
> diff --git a/drivers/firmware/arm-ffa/arm-ffa-uclass.c b/drivers/firmware/arm-ffa/arm-ffa-uclass.c
> index 96c64964bb7..76a8775e911 100644
> --- a/drivers/firmware/arm-ffa/arm-ffa-uclass.c
> +++ b/drivers/firmware/arm-ffa/arm-ffa-uclass.c
> @@ -12,15 +12,12 @@
>  #include <malloc.h>
>  #include <string.h>
>  #include <u-boot/uuid.h>
> -#include <asm/global_data.h>
>  #include <dm/device-internal.h>
>  #include <dm/devres.h>
>  #include <dm/root.h>
>  #include <linux/errno.h>
>  #include <linux/sizes.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  /* Error mapping declarations */
>  
>  int ffa_to_std_errmap[MAX_NUMBER_FFA_ERR] = {
> diff --git a/drivers/firmware/arm-ffa/arm-ffa.c b/drivers/firmware/arm-ffa/arm-ffa.c
> index 94e6105cb38..9e6b5dcc542 100644
> --- a/drivers/firmware/arm-ffa/arm-ffa.c
> +++ b/drivers/firmware/arm-ffa/arm-ffa.c
> @@ -10,12 +10,9 @@
>  #include <arm_ffa_priv.h>
>  #include <dm.h>
>  #include <log.h>
> -#include <asm/global_data.h>
>  #include <dm/device-internal.h>
>  #include <linux/errno.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  /**
>   * invoke_ffa_fn() - SMC wrapper
>   * @args: FF-A ABI arguments to be copied to Xn registers
> diff --git a/drivers/firmware/arm-ffa/ffa-emul-uclass.c b/drivers/firmware/arm-ffa/ffa-emul-uclass.c
> index 1521d9b66ac..6198d687354 100644
> --- a/drivers/firmware/arm-ffa/ffa-emul-uclass.c
> +++ b/drivers/firmware/arm-ffa/ffa-emul-uclass.c
> @@ -8,7 +8,6 @@
>  #include <dm.h>
>  #include <mapmem.h>
>  #include <string.h>
> -#include <asm/global_data.h>
>  #include <asm/sandbox_arm_ffa.h>
>  #include <asm/sandbox_arm_ffa_priv.h>
>  #include <dm/device-internal.h>
> @@ -17,8 +16,6 @@
>  #include <linux/errno.h>
>  #include <linux/sizes.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  /* The partitions (SPs) table */
>  static struct ffa_partition_desc sandbox_partitions[SANDBOX_PARTITIONS_CNT] = {
>  	{
> diff --git a/drivers/firmware/arm-ffa/sandbox_ffa.c b/drivers/firmware/arm-ffa/sandbox_ffa.c
> index 44b32a829dd..f1e8de4bf0d 100644
> --- a/drivers/firmware/arm-ffa/sandbox_ffa.c
> +++ b/drivers/firmware/arm-ffa/sandbox_ffa.c
> @@ -8,13 +8,10 @@
>  #include <arm_ffa.h>
>  #include <dm.h>
>  #include <log.h>
> -#include <asm/global_data.h>
>  #include <asm/sandbox_arm_ffa_priv.h>
>  #include <dm/device-internal.h>
>  #include <linux/errno.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  /**
>   * sandbox_ffa_discover() - perform sandbox FF-A discovery
>   * @dev: The sandbox FF-A bus device
> diff --git a/drivers/gpio/gpio-uclass.c b/drivers/gpio/gpio-uclass.c
> index 38151ef1bee..7651d5360d6 100644
> --- a/drivers/gpio/gpio-uclass.c
> +++ b/drivers/gpio/gpio-uclass.c
> @@ -18,15 +18,12 @@
>  #include <fdtdec.h>
>  #include <malloc.h>
>  #include <acpi/acpi_device.h>
> -#include <asm/global_data.h>
>  #include <asm/gpio.h>
>  #include <dm/device_compat.h>
>  #include <linux/bug.h>
>  #include <linux/ctype.h>
>  #include <linux/delay.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define GPIO_ALLOC_BITS	32
>  
>  /**
> diff --git a/drivers/gpio/nx_gpio.c b/drivers/gpio/nx_gpio.c
> index 741b2ff7f17..5abbb34daea 100644
> --- a/drivers/gpio/nx_gpio.c
> +++ b/drivers/gpio/nx_gpio.c
> @@ -7,12 +7,9 @@
>  #include <dm.h>
>  #include <errno.h>
>  #include <malloc.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <asm/gpio.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  struct nx_gpio_regs {
>  	u32	data;		/* Data register */
>  	u32	outputenb;	/* Output Enable register */
> diff --git a/drivers/i2c/mxc_i2c.c b/drivers/i2c/mxc_i2c.c
> index 2dfc1c4eab5..268bb39f009 100644
> --- a/drivers/i2c/mxc_i2c.c
> +++ b/drivers/i2c/mxc_i2c.c
> @@ -18,7 +18,6 @@
>  #include <log.h>
>  #include <asm/arch/clock.h>
>  #include <asm/arch/imx-regs.h>
> -#include <asm/global_data.h>
>  #include <dm/device_compat.h>
>  #include <linux/delay.h>
>  #include <linux/errno.h>
> @@ -30,8 +29,6 @@
>  #include <dm.h>
>  #include <dm/pinctrl.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define I2C_QUIRK_FLAG		(1 << 0)
>  
>  #define IMX_I2C_REGSHIFT	2
> diff --git a/drivers/i2c/nx_i2c.c b/drivers/i2c/nx_i2c.c
> index 8562dd82bd6..706b7adefe8 100644
> --- a/drivers/i2c/nx_i2c.c
> +++ b/drivers/i2c/nx_i2c.c
> @@ -7,7 +7,6 @@
>  #include <asm/arch/reset.h>
>  #include <asm/arch/clk.h>
>  #include <asm/arch/nx_gpio.h>
> -#include <asm/global_data.h>
>  #include <linux/delay.h>
>  
>  #define I2C_WRITE       0
> @@ -45,8 +44,6 @@
>  
>  #define DEFAULT_SPEED   100000  /* default I2C speed [Hz] */
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  struct nx_i2c_regs {
>  	uint     iiccon;
>  	uint     iicstat;
> diff --git a/drivers/i2c/ocores_i2c.c b/drivers/i2c/ocores_i2c.c
> index cf714d22ee4..32704ee8854 100644
> --- a/drivers/i2c/ocores_i2c.c
> +++ b/drivers/i2c/ocores_i2c.c
> @@ -12,7 +12,6 @@
>   * Andreas Larsson <andreas@gaisler.com>
>   */
>  
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <clk.h>
>  #include <dm.h>
> @@ -75,8 +74,6 @@ struct ocores_i2c_bus {
>  	u8 (*getreg)(struct ocores_i2c_bus *i2c, int reg);
>  };
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  /* Boolean attribute values */
>  enum {
>  	FALSE = 0,
> diff --git a/drivers/i2c/soft_i2c.c b/drivers/i2c/soft_i2c.c
> index 79f7a320502..4102375e5b7 100644
> --- a/drivers/i2c/soft_i2c.c
> +++ b/drivers/i2c/soft_i2c.c
> @@ -25,7 +25,6 @@
>  #endif
>  #endif
>  #include <i2c.h>
> -#include <asm/global_data.h>
>  #include <linux/delay.h>
>  
>  #if defined(CONFIG_SOFT_I2C_GPIO_SCL)
> @@ -82,8 +81,6 @@
>  
>  /* #define	DEBUG_I2C	*/
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #ifndef	I2C_SOFT_DECLARATIONS
>  #  define I2C_SOFT_DECLARATIONS
>  #endif
> diff --git a/drivers/i2c/synquacer_i2c.c b/drivers/i2c/synquacer_i2c.c
> index 6672d9435e3..6e5722327c5 100644
> --- a/drivers/i2c/synquacer_i2c.c
> +++ b/drivers/i2c/synquacer_i2c.c
> @@ -112,8 +112,6 @@
>  #define SPEED_FM		400	// Fast Mode
>  #define SPEED_SM		100	// Standard Mode
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  struct synquacer_i2c {
>  	void __iomem *base;
>  	unsigned long pclkrate;
> diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
> index b1e0465e7a8..c7eaa3de96f 100644
> --- a/drivers/mailbox/imx-mailbox.c
> +++ b/drivers/mailbox/imx-mailbox.c
> @@ -15,8 +15,6 @@
>  /* This driver only exposes the status bits to keep with the
>   * polling methodology of u-boot.
>   */
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define IMX_MU_CHANS		24
>  
>  #define IMX_MU_V2_PAR_OFF	0x4
> diff --git a/drivers/misc/atsha204a-i2c.c b/drivers/misc/atsha204a-i2c.c
> index 3b9046da880..aa3094fcc01 100644
> --- a/drivers/misc/atsha204a-i2c.c
> +++ b/drivers/misc/atsha204a-i2c.c
> @@ -15,7 +15,6 @@
>  #include <errno.h>
>  #include <atsha204a-i2c.h>
>  #include <log.h>
> -#include <asm/global_data.h>
>  #include <linux/delay.h>
>  #include <linux/bitrev.h>
>  #include <u-boot/crc.h>
> @@ -25,8 +24,6 @@
>  #define ATSHA204A_TRANSACTION_RETRY	5
>  #define ATSHA204A_EXECTIME		5000
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  static inline u16 atsha204a_crc16(const u8 *buffer, size_t len)
>  {
>  	return bitrev16(crc16(0, buffer, len));
> diff --git a/drivers/misc/fs_loader.c b/drivers/misc/fs_loader.c
> index 2928cf75f89..6af4c7f15e7 100644
> --- a/drivers/misc/fs_loader.c
> +++ b/drivers/misc/fs_loader.c
> @@ -13,7 +13,6 @@
>  #include <fs.h>
>  #include <fs_loader.h>
>  #include <log.h>
> -#include <asm/global_data.h>
>  #include <dm/device-internal.h>
>  #include <dm/root.h>
>  #include <linux/string.h>
> @@ -25,8 +24,6 @@
>  #include <ubi_uboot.h>
>  #endif
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  /**
>   * struct firmware - A place for storing firmware and its attribute data.
>   *
> diff --git a/drivers/misc/imx8/fuse.c b/drivers/misc/imx8/fuse.c
> index 90d251a4405..872713e30b6 100644
> --- a/drivers/misc/imx8/fuse.c
> +++ b/drivers/misc/imx8/fuse.c
> @@ -8,11 +8,8 @@
>  #include <fuse.h>
>  #include <firmware/imx/sci/sci.h>
>  #include <asm/arch/sys_proto.h>
> -#include <asm/global_data.h>
>  #include <linux/arm-smccc.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define FSL_ECC_WORD_START_1	 0x10
>  #define FSL_ECC_WORD_END_1	 0x10F
>  
> diff --git a/drivers/mmc/ca_dw_mmc.c b/drivers/mmc/ca_dw_mmc.c
> index 1af5ec0532e..d5a4453a62e 100644
> --- a/drivers/mmc/ca_dw_mmc.c
> +++ b/drivers/mmc/ca_dw_mmc.c
> @@ -6,7 +6,6 @@
>  
>  #include <dwmmc.h>
>  #include <fdtdec.h>
> -#include <asm/global_data.h>
>  #include <linux/libfdt.h>
>  #include <malloc.h>
>  #include <errno.h>
> @@ -26,8 +25,6 @@
>  
>  #define MIN_FREQ (400000)
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  struct ca_mmc_plat {
>  	struct mmc_config cfg;
>  	struct mmc mmc;
> diff --git a/drivers/mmc/f_sdh30.c b/drivers/mmc/f_sdh30.c
> index f47cf848521..f0356e1e960 100644
> --- a/drivers/mmc/f_sdh30.c
> +++ b/drivers/mmc/f_sdh30.c
> @@ -29,8 +29,6 @@ struct f_sdh30_plat {
>  	const struct f_sdh30_data *data;
>  };
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  static void f_sdh30_e51_init(struct udevice *dev)
>  {
>  	struct f_sdh30_plat *plat = dev_get_plat(dev);
> diff --git a/drivers/mmc/jz_mmc.c b/drivers/mmc/jz_mmc.c
> index fc10bb256a4..651d9868305 100644
> --- a/drivers/mmc/jz_mmc.c
> +++ b/drivers/mmc/jz_mmc.c
> @@ -8,7 +8,6 @@
>  
>  #include <malloc.h>
>  #include <mmc.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <asm/unaligned.h>
>  #include <errno.h>
> @@ -419,8 +418,6 @@ int jz_mmc_init(void __iomem *base)
>  #else /* CONFIG_DM_MMC */
>  
>  #include <dm.h>
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  static int jz_mmc_dm_send_cmd(struct udevice *dev, struct mmc_cmd *cmd,
>  			      struct mmc_data *data)
>  {
> diff --git a/drivers/mmc/msm_sdhci.c b/drivers/mmc/msm_sdhci.c
> index 38dc36a2194..66f3cf2de4f 100644
> --- a/drivers/mmc/msm_sdhci.c
> +++ b/drivers/mmc/msm_sdhci.c
> @@ -13,7 +13,6 @@
>  #include <reset.h>
>  #include <sdhci.h>
>  #include <wait_bit.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <linux/bitops.h>
>  #include <power/regulator.h>
> @@ -61,8 +60,6 @@ struct msm_sdhc_variant_info {
>  	u32 core_vendor_spec_capabilities0;
>  };
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  static int msm_sdc_clk_init(struct udevice *dev)
>  {
>  	struct msm_sdhc *prv = dev_get_priv(dev);
> diff --git a/drivers/mmc/mv_sdhci.c b/drivers/mmc/mv_sdhci.c
> index 2da5334c21f..a8b63a20387 100644
> --- a/drivers/mmc/mv_sdhci.c
> +++ b/drivers/mmc/mv_sdhci.c
> @@ -6,7 +6,6 @@
>  #include <dm.h>
>  #include <malloc.h>
>  #include <sdhci.h>
> -#include <asm/global_data.h>
>  #include <linux/mbus.h>
>  
>  #define MVSDH_NAME "mv_sdh"
> @@ -14,8 +13,6 @@
>  #define SDHCI_WINDOW_CTRL(win)		(0x4080 + ((win) << 4))
>  #define SDHCI_WINDOW_BASE(win)		(0x4084 + ((win) << 4))
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  struct mv_sdhci_plat {
>  	struct mmc_config cfg;
>  	struct mmc mmc;
> diff --git a/drivers/mtd/nand/raw/pxa3xx_nand.c b/drivers/mtd/nand/raw/pxa3xx_nand.c
> index 7bf54fa4654..7324dc72e0a 100644
> --- a/drivers/mtd/nand/raw/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/raw/pxa3xx_nand.c
> @@ -9,7 +9,6 @@
>  #include <malloc.h>
>  #include <fdtdec.h>
>  #include <nand.h>
> -#include <asm/global_data.h>
>  #include <dm/device_compat.h>
>  #include <dm/devres.h>
>  #include <linux/bitops.h>
> @@ -30,8 +29,6 @@
>  
>  #include "pxa3xx_nand.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define TIMEOUT_DRAIN_FIFO	5	/* in ms */
>  #define	CHIP_DELAY_TIMEOUT	200
>  #define NAND_STOP_DELAY		40
> diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
> index ef43dcad079..0bee7eace90 100644
> --- a/drivers/mtd/nand/raw/tegra_nand.c
> +++ b/drivers/mtd/nand/raw/tegra_nand.c
> @@ -7,7 +7,6 @@
>   */
>  
>  #include <log.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <memalign.h>
>  #include <nand.h>
> @@ -26,8 +25,6 @@
>  #include <linux/printk.h>
>  #include "tegra_nand.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define NAND_CMD_TIMEOUT_MS		10
>  
>  #define SKIPPED_SPARE_BYTES		4
> diff --git a/drivers/mtd/nvmxip/nvmxip_qspi.c b/drivers/mtd/nvmxip/nvmxip_qspi.c
> index 1a109bee557..383971bea66 100644
> --- a/drivers/mtd/nvmxip/nvmxip_qspi.c
> +++ b/drivers/mtd/nvmxip/nvmxip_qspi.c
> @@ -11,9 +11,6 @@
>  #include <nvmxip.h>
>  #include <linux/errno.h>
>  
> -#include <asm/global_data.h>
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define NVMXIP_QSPI_DRV_NAME "nvmxip_qspi"
>  
>  /**
> diff --git a/drivers/mtd/spi/sf-uclass.c b/drivers/mtd/spi/sf-uclass.c
> index 102a9236826..a9db5296b2d 100644
> --- a/drivers/mtd/spi/sf-uclass.c
> +++ b/drivers/mtd/spi/sf-uclass.c
> @@ -11,13 +11,10 @@
>  #include <malloc.h>
>  #include <spi.h>
>  #include <spi_flash.h>
> -#include <asm/global_data.h>
>  #include <dm/device-internal.h>
>  #include <test/test.h>
>  #include "sf_internal.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  int spi_flash_read_dm(struct udevice *dev, u32 offset, size_t len, void *buf)
>  {
>  	return log_ret(sf_get_ops(dev)->read(dev, offset, len, buf));
> diff --git a/drivers/net/dwmac_s700.c b/drivers/net/dwmac_s700.c
> index 969d247b4f3..76daab961c0 100644
> --- a/drivers/net/dwmac_s700.c
> +++ b/drivers/net/dwmac_s700.c
> @@ -5,7 +5,6 @@
>   * Actions DWMAC specific glue layer
>   */
>  
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <dm.h>
>  #include <clk.h>
> @@ -24,8 +23,6 @@
>  #define RMII_REF_CLK_MFP_CTL0		(0x0 << 6)
>  #define CLKO_25M_EN_MFP_CTL3		BIT(30)
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  static void dwmac_board_setup(void)
>  {
>  	clrbits_le32(MFP_CTL0, (RMII_TXD01_MFP_CTL0 | RMII_RXD01_MFP_CTL0 |
> diff --git a/drivers/net/fec_mxc.c b/drivers/net/fec_mxc.c
> index fee9973c4dc..ba105dd2825 100644
> --- a/drivers/net/fec_mxc.c
> +++ b/drivers/net/fec_mxc.c
> @@ -18,7 +18,6 @@
>  #include <net.h>
>  #include <netdev.h>
>  #include <asm/cache.h>
> -#include <asm/global_data.h>
>  #include <linux/delay.h>
>  #include <power/regulator.h>
>  
> @@ -36,8 +35,6 @@
>  #include "fec_mxc.h"
>  #include <eth_phy.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  /*
>   * Timeout the transfer after 5 mS. This is usually a bit more, since
>   * the code in the tightloops this timeout is used in adds some overhead.
> diff --git a/drivers/net/gmac_rockchip.c b/drivers/net/gmac_rockchip.c
> index c8cfe7448d4..2b6080dd9ee 100644
> --- a/drivers/net/gmac_rockchip.c
> +++ b/drivers/net/gmac_rockchip.c
> @@ -11,7 +11,6 @@
>  #include <net.h>
>  #include <phy.h>
>  #include <syscon.h>
> -#include <asm/global_data.h>
>  #include <asm/arch-rockchip/periph.h>
>  #include <asm/arch-rockchip/clock.h>
>  #include <asm/arch-rockchip/hardware.h>
> @@ -28,7 +27,6 @@
>  #include <linux/bitops.h>
>  #include "designware.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
>  #define DELAY_ENABLE(soc, tx, rx) \
>  	(((tx) ? soc##_TXCLK_DLY_ENA_GMAC_ENABLE : soc##_TXCLK_DLY_ENA_GMAC_DISABLE) | \
>  	((rx) ? soc##_RXCLK_DLY_ENA_GMAC_ENABLE : soc##_RXCLK_DLY_ENA_GMAC_DISABLE))
> diff --git a/drivers/net/mvneta.c b/drivers/net/mvneta.c
> index 1640868c24a..baa18202d6e 100644
> --- a/drivers/net/mvneta.c
> +++ b/drivers/net/mvneta.c
> @@ -20,7 +20,6 @@
>  #include <config.h>
>  #include <malloc.h>
>  #include <asm/cache.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <dm/device_compat.h>
>  #include <dm/devres.h>
> @@ -37,8 +36,6 @@
>  #include <linux/mbus.h>
>  #include <asm-generic/gpio.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define MVNETA_NR_CPUS		1
>  #define ETH_HLEN		14	/* Total octets in header */
>  
> diff --git a/drivers/net/octeontx/smi.c b/drivers/net/octeontx/smi.c
> index 217bcac2ce2..5a822b64427 100644
> --- a/drivers/net/octeontx/smi.c
> +++ b/drivers/net/octeontx/smi.c
> @@ -10,15 +10,12 @@
>  #include <pci.h>
>  #include <pci_ids.h>
>  #include <phy.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <linux/ctype.h>
>  #include <linux/delay.h>
>  
>  #define PCI_DEVICE_ID_OCTEONTX_SMI 0xA02B
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  enum octeontx_smi_mode {
>  	CLAUSE22 = 0,
>  	CLAUSE45 = 1,
> diff --git a/drivers/net/phy/fixed.c b/drivers/net/phy/fixed.c
> index 11d36164976..4ab709a14d5 100644
> --- a/drivers/net/phy/fixed.c
> +++ b/drivers/net/phy/fixed.c
> @@ -10,9 +10,6 @@
>  #include <phy.h>
>  #include <dm.h>
>  #include <fdt_support.h>
> -#include <asm/global_data.h>
> -
> -DECLARE_GLOBAL_DATA_PTR;
>  
>  static int fixedphy_probe(struct phy_device *phydev)
>  {
> diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
> index b58283fe3d5..d7e0c4fe02d 100644
> --- a/drivers/net/phy/phy.c
> +++ b/drivers/net/phy/phy.c
> @@ -17,7 +17,6 @@
>  #include <miiphy.h>
>  #include <phy.h>
>  #include <errno.h>
> -#include <asm/global_data.h>
>  #include <asm-generic/gpio.h>
>  #include <dm/device_compat.h>
>  #include <dm/of_extra.h>
> @@ -26,8 +25,6 @@
>  #include <linux/err.h>
>  #include <linux/compiler.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  /* Generic PHY support and helper functions */
>  
>  /**
> diff --git a/drivers/net/phy/xilinx_gmii2rgmii.c b/drivers/net/phy/xilinx_gmii2rgmii.c
> index e44b7b75bd5..f5a7dd349c9 100644
> --- a/drivers/net/phy/xilinx_gmii2rgmii.c
> +++ b/drivers/net/phy/xilinx_gmii2rgmii.c
> @@ -8,9 +8,6 @@
>  #include <dm.h>
>  #include <log.h>
>  #include <phy.h>
> -#include <asm/global_data.h>
> -
> -DECLARE_GLOBAL_DATA_PTR;
>  
>  #define ZYNQ_GMII2RGMII_REG		0x10
>  #define ZYNQ_GMII2RGMII_SPEED_MASK	(BMCR_SPEED1000 | BMCR_SPEED100)
> diff --git a/drivers/net/sandbox-raw.c b/drivers/net/sandbox-raw.c
> index 1d716716778..c3d40f0b59e 100644
> --- a/drivers/net/sandbox-raw.c
> +++ b/drivers/net/sandbox-raw.c
> @@ -12,9 +12,6 @@
>  #include <env.h>
>  #include <malloc.h>
>  #include <net.h>
> -#include <asm/global_data.h>
> -
> -DECLARE_GLOBAL_DATA_PTR;
>  
>  static int reply_arp;
>  static struct in_addr arp_ip;
> diff --git a/drivers/net/sandbox.c b/drivers/net/sandbox.c
> index 2011fd31f41..0ea50c484c0 100644
> --- a/drivers/net/sandbox.c
> +++ b/drivers/net/sandbox.c
> @@ -10,7 +10,6 @@
>  #include <log.h>
>  #include <malloc.h>
>  #include <asm/eth.h>
> -#include <asm/global_data.h>
>  #include <asm/test.h>
>  #include <asm/types.h>
>  
> @@ -84,8 +83,6 @@ struct icmphdr {
>  #define ICMP_ECHO_REPLY		0
>  #define IPPROTO_ICMP		1
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  static const u8 null_ethaddr[6];
>  static bool skip_timeout;
>  
> diff --git a/drivers/net/ti/keystone_net.c b/drivers/net/ti/keystone_net.c
> index d4abc9a0411..40c98e72e4d 100644
> --- a/drivers/net/ti/keystone_net.c
> +++ b/drivers/net/ti/keystone_net.c
> @@ -7,7 +7,6 @@
>   */
>  #include <command.h>
>  #include <console.h>
> -#include <asm/global_data.h>
>  #include <linux/delay.h>
>  #include <linux/printk.h>
>  
> @@ -26,8 +25,6 @@
>  
>  #include "cpsw_mdio.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #ifdef KEYSTONE2_EMAC_GIG_ENABLE
>  #define emac_gigabit_enable(x)	keystone2_eth_gigabit_enable(x)
>  #else
> diff --git a/drivers/net/xilinx_axi_emac.c b/drivers/net/xilinx_axi_emac.c
> index fb48feb4469..e9cc5db52d2 100644
> --- a/drivers/net/xilinx_axi_emac.c
> +++ b/drivers/net/xilinx_axi_emac.c
> @@ -15,7 +15,6 @@
>  #include <log.h>
>  #include <net.h>
>  #include <malloc.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <phy.h>
>  #include <miiphy.h>
> @@ -23,8 +22,6 @@
>  #include <linux/delay.h>
>  #include <eth_phy.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  /* Link setup */
>  #define XAE_EMMC_LINKSPEED_MASK	0xC0000000 /* Link speed */
>  #define XAE_EMMC_LINKSPD_10	0x00000000 /* Link Speed mask for 10 Mbit */
> diff --git a/drivers/pci/pci_octeontx.c b/drivers/pci/pci_octeontx.c
> index 875cf7f7115..6752112a878 100644
> --- a/drivers/pci/pci_octeontx.c
> +++ b/drivers/pci/pci_octeontx.c
> @@ -11,14 +11,11 @@
>  #include <log.h>
>  #include <malloc.h>
>  #include <pci.h>
> -#include <asm/global_data.h>
>  
>  #include <asm/io.h>
>  
>  #include <linux/ioport.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  /*
>   * This driver supports multiple types of operations / host bridges / busses:
>   *
> diff --git a/drivers/pci/pcie_dw_meson.c b/drivers/pci/pcie_dw_meson.c
> index 483b07ce078..1eff6d1b0ed 100644
> --- a/drivers/pci/pcie_dw_meson.c
> +++ b/drivers/pci/pcie_dw_meson.c
> @@ -16,7 +16,6 @@
>  #include <power-domain.h>
>  #include <reset.h>
>  #include <syscon.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <asm-generic/gpio.h>
>  #include <dm/device_compat.h>
> @@ -27,8 +26,6 @@
>  
>  #include "pcie_dw_common.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  /**
>   * struct meson_pcie - Amlogic Meson DW PCIe controller state
>   *
> diff --git a/drivers/pci/pcie_dw_qcom.c b/drivers/pci/pcie_dw_qcom.c
> index 978754e8472..10c45aaba20 100644
> --- a/drivers/pci/pcie_dw_qcom.c
> +++ b/drivers/pci/pcie_dw_qcom.c
> @@ -10,7 +10,6 @@
>  #include <syscon.h>
>  #include <malloc.h>
>  #include <power/regulator.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <asm-generic/gpio.h>
>  #include <dm/device_compat.h>
> @@ -21,8 +20,6 @@
>  
>  #include "pcie_dw_common.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  struct qcom_pcie;
>  
>  struct qcom_pcie_ops {
> diff --git a/drivers/pci/pcie_dw_rockchip.c b/drivers/pci/pcie_dw_rockchip.c
> index 208aa30463a..61117fa95e6 100644
> --- a/drivers/pci/pcie_dw_rockchip.c
> +++ b/drivers/pci/pcie_dw_rockchip.c
> @@ -13,7 +13,6 @@
>  #include <reset.h>
>  #include <syscon.h>
>  #include <asm/arch-rockchip/clock.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <asm-generic/gpio.h>
>  #include <dm/device_compat.h>
> @@ -24,8 +23,6 @@
>  
>  #include "pcie_dw_common.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  /**
>   * struct rk_pcie - RK DW PCIe controller state
>   *
> diff --git a/drivers/pci/pcie_dw_ti.c b/drivers/pci/pcie_dw_ti.c
> index dc6e65273b7..37c295fdd38 100644
> --- a/drivers/pci/pcie_dw_ti.c
> +++ b/drivers/pci/pcie_dw_ti.c
> @@ -10,7 +10,6 @@
>  #include <power-domain.h>
>  #include <regmap.h>
>  #include <syscon.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <asm-generic/gpio.h>
>  #include <dm/device_compat.h>
> @@ -20,8 +19,6 @@
>  
>  #include "pcie_dw_common.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define PCIE_VENDORID_MASK	GENMASK(15, 0)
>  #define PCIE_DEVICEID_SHIFT	16
>  
> diff --git a/drivers/pci/pcie_layerscape.c b/drivers/pci/pcie_layerscape.c
> index 1be33095b9c..db7c4f47916 100644
> --- a/drivers/pci/pcie_layerscape.c
> +++ b/drivers/pci/pcie_layerscape.c
> @@ -6,7 +6,6 @@
>   */
>  
>  #include <log.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <errno.h>
>  #include <malloc.h>
> @@ -16,8 +15,6 @@
>  #endif
>  #include "pcie_layerscape.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  LIST_HEAD(ls_pcie_list);
>  
>  unsigned int dbi_readl(struct ls_pcie *pcie, unsigned int offset)
> diff --git a/drivers/pci/pcie_starfive_jh7110.c b/drivers/pci/pcie_starfive_jh7110.c
> index 0908ae16b67..761e64be58a 100644
> --- a/drivers/pci/pcie_starfive_jh7110.c
> +++ b/drivers/pci/pcie_starfive_jh7110.c
> @@ -15,7 +15,6 @@
>  #include <regmap.h>
>  #include <reset.h>
>  #include <syscon.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <asm-generic/gpio.h>
>  #include <dm/device_compat.h>
> @@ -39,8 +38,6 @@
>  #define STG_SYSCON_RP_NEP_OFFSET               0xe8
>  #define STG_SYSCON_K_RP_NEP_MASK               BIT(8)
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  struct starfive_pcie {
>  	struct pcie_plda plda;
>  	struct clk_bulk	clks;
> diff --git a/drivers/pci_endpoint/pci_ep-uclass.c b/drivers/pci_endpoint/pci_ep-uclass.c
> index 902d1a51eaa..b71defe4019 100644
> --- a/drivers/pci_endpoint/pci_ep-uclass.c
> +++ b/drivers/pci_endpoint/pci_ep-uclass.c
> @@ -13,12 +13,9 @@
>  
>  #include <dm.h>
>  #include <errno.h>
> -#include <asm/global_data.h>
>  #include <linux/log2.h>
>  #include <pci_ep.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  int pci_ep_write_header(struct udevice *dev, uint fn, struct pci_ep_header *hdr)
>  {
>  	struct pci_ep_ops *ops = pci_ep_get_ops(dev);
> diff --git a/drivers/phy/marvell/comphy_core.c b/drivers/phy/marvell/comphy_core.c
> index a4121423873..b074d58f9f6 100644
> --- a/drivers/phy/marvell/comphy_core.c
> +++ b/drivers/phy/marvell/comphy_core.c
> @@ -7,7 +7,6 @@
>  
>  #include <dm.h>
>  #include <fdtdec.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <dm/device_compat.h>
>  #include <linux/err.h>
> @@ -18,8 +17,6 @@
>  
>  #define COMPHY_MAX_CHIP 4
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  static const char *get_speed_string(u32 speed)
>  {
>  	static const char * const speed_strings[] = {
> diff --git a/drivers/phy/omap-usb2-phy.c b/drivers/phy/omap-usb2-phy.c
> index 2be0178882a..6df4ff4eb05 100644
> --- a/drivers/phy/omap-usb2-phy.c
> +++ b/drivers/phy/omap-usb2-phy.c
> @@ -6,7 +6,6 @@
>   * Written by Jean-Jacques Hiblot <jjhiblot@ti.com>
>   */
>  
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <dm.h>
>  #include <errno.h>
> @@ -39,8 +38,6 @@
>  #define USB2PHY_USE_CHG_DET_REG		BIT(29)
>  #define USB2PHY_DIS_CHG_DET		BIT(28)
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  struct omap_usb2_phy {
>  	struct regmap *pwr_regmap;
>  	ulong flags;
> diff --git a/drivers/phy/rockchip/phy-rockchip-pcie.c b/drivers/phy/rockchip/phy-rockchip-pcie.c
> index 660037034ec..5775101c4cb 100644
> --- a/drivers/phy/rockchip/phy-rockchip-pcie.c
> +++ b/drivers/phy/rockchip/phy-rockchip-pcie.c
> @@ -9,7 +9,6 @@
>  
>  #include <clk.h>
>  #include <dm.h>
> -#include <asm/global_data.h>
>  #include <dm/device_compat.h>
>  #include <generic-phy.h>
>  #include <reset.h>
> @@ -19,8 +18,6 @@
>  #include <linux/iopoll.h>
>  #include <asm/arch-rockchip/clock.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  /*
>   * The higher 16-bit of this register is used for write protection
>   * only if BIT(x + 16) set to 1 the BIT(x) can be written.
> diff --git a/drivers/phy/rockchip/phy-rockchip-typec.c b/drivers/phy/rockchip/phy-rockchip-typec.c
> index 66d1d32d25c..305d5b0dd48 100644
> --- a/drivers/phy/rockchip/phy-rockchip-typec.c
> +++ b/drivers/phy/rockchip/phy-rockchip-typec.c
> @@ -10,7 +10,6 @@
>  
>  #include <clk.h>
>  #include <dm.h>
> -#include <asm/global_data.h>
>  #include <dm/device_compat.h>
>  #include <dm/lists.h>
>  #include <generic-phy.h>
> @@ -21,8 +20,6 @@
>  #include <linux/iopoll.h>
>  #include <asm/arch-rockchip/clock.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define usleep_range(a, b) udelay((b))
>  
>  #define CMN_SSM_BANDGAP			(0x21 << 2)
> diff --git a/drivers/pinctrl/mtmips/pinctrl-mt7628.c b/drivers/pinctrl/mtmips/pinctrl-mt7628.c
> index dc7acec4a77..be3a28eb94d 100644
> --- a/drivers/pinctrl/mtmips/pinctrl-mt7628.c
> +++ b/drivers/pinctrl/mtmips/pinctrl-mt7628.c
> @@ -6,15 +6,12 @@
>   */
>  
>  #include <dm.h>
> -#include <asm/global_data.h>
>  #include <dm/pinctrl.h>
>  #include <linux/bitops.h>
>  #include <linux/io.h>
>  
>  #include "pinctrl-mtmips-common.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define AGPIO_OFS			0
>  #define GPIOMODE1_OFS			0x24
>  #define GPIOMODE2_OFS			0x28
> diff --git a/drivers/pinctrl/nexell/pinctrl-nexell.c b/drivers/pinctrl/nexell/pinctrl-nexell.c
> index d5be7baf50d..af1acd91649 100644
> --- a/drivers/pinctrl/nexell/pinctrl-nexell.c
> +++ b/drivers/pinctrl/nexell/pinctrl-nexell.c
> @@ -7,13 +7,10 @@
>  
>  #include <dm.h>
>  #include <errno.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include "pinctrl-nexell.h"
>  #include "pinctrl-s5pxx18.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  /* given a pin-name, return the address of pin config registers */
>  unsigned long pin_to_bank_base(struct udevice *dev, const char *pin_name,
>  			       u32 *pin)
> diff --git a/drivers/pinctrl/nexell/pinctrl-s5pxx18.c b/drivers/pinctrl/nexell/pinctrl-s5pxx18.c
> index a6ae5764fbc..aeed3f1e1e1 100644
> --- a/drivers/pinctrl/nexell/pinctrl-s5pxx18.c
> +++ b/drivers/pinctrl/nexell/pinctrl-s5pxx18.c
> @@ -9,15 +9,12 @@
>  
>  #include <dm.h>
>  #include <errno.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <dm/pinctrl.h>
>  #include <dm/root.h>
>  #include "pinctrl-nexell.h"
>  #include "pinctrl-s5pxx18.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  static void nx_gpio_set_bit(u32 *value, u32 bit, int enable)
>  {
>  	register u32 newvalue;
> diff --git a/drivers/pinctrl/nxp/pinctrl-imx-mmio.c b/drivers/pinctrl/nxp/pinctrl-imx-mmio.c
> index 2f4228a9fc5..7cdbbbba747 100644
> --- a/drivers/pinctrl/nxp/pinctrl-imx-mmio.c
> +++ b/drivers/pinctrl/nxp/pinctrl-imx-mmio.c
> @@ -5,7 +5,6 @@
>  
>  #include <malloc.h>
>  #include <mapmem.h>
> -#include <asm/global_data.h>
>  #include <dm/device_compat.h>
>  #include <dm/devres.h>
>  #include <linux/bitops.h>
> @@ -16,8 +15,6 @@
>  
>  #include "pinctrl-imx.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  int imx_pinctrl_set_state_mmio(struct udevice *dev, struct udevice *config)
>  {
>  	struct imx_pinctrl_priv *priv = dev_get_priv(dev);
> diff --git a/drivers/pinctrl/nxp/pinctrl-imx.c b/drivers/pinctrl/nxp/pinctrl-imx.c
> index 7d91ccfb26f..d8011768581 100644
> --- a/drivers/pinctrl/nxp/pinctrl-imx.c
> +++ b/drivers/pinctrl/nxp/pinctrl-imx.c
> @@ -5,7 +5,6 @@
>  
>  #include <malloc.h>
>  #include <mapmem.h>
> -#include <asm/global_data.h>
>  #include <dm/device_compat.h>
>  #include <dm/devres.h>
>  #include <linux/bitops.h>
> @@ -16,8 +15,6 @@
>  
>  #include "pinctrl-imx.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  int imx_pinctrl_set_state_common(struct udevice *dev, struct udevice *config,
>  				 int pin_size, u32 **pin_data, int *npins)
>  {
> diff --git a/drivers/pinctrl/nxp/pinctrl-imx8.c b/drivers/pinctrl/nxp/pinctrl-imx8.c
> index 9b3b5aec07a..23865ee6428 100644
> --- a/drivers/pinctrl/nxp/pinctrl-imx8.c
> +++ b/drivers/pinctrl/nxp/pinctrl-imx8.c
> @@ -9,14 +9,11 @@
>  #include <asm/io.h>
>  #include <firmware/imx/sci/sci.h>
>  #include <misc.h>
> -#include <asm/global_data.h>
>  #include <dm/device.h>
>  #include <dm/pinctrl.h>
>  
>  #include "pinctrl-imx.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define PADRING_IFMUX_EN_SHIFT		31
>  #define PADRING_IFMUX_EN_MASK		BIT(31)
>  #define PADRING_GP_EN_SHIFT		30
> diff --git a/drivers/pinctrl/nxp/pinctrl-mxs.c b/drivers/pinctrl/nxp/pinctrl-mxs.c
> index 85ab5fdf640..8b764738014 100644
> --- a/drivers/pinctrl/nxp/pinctrl-mxs.c
> +++ b/drivers/pinctrl/nxp/pinctrl-mxs.c
> @@ -5,7 +5,6 @@
>   */
>  
>  #include <log.h>
> -#include <asm/global_data.h>
>  #include <dm/device_compat.h>
>  #include <dm/devres.h>
>  #include <linux/io.h>
> @@ -15,8 +14,6 @@
>  #include <dm/read.h>
>  #include "pinctrl-mxs.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  struct mxs_pinctrl_priv {
>  	void __iomem *base;
>  	const struct mxs_regs *regs;
> diff --git a/drivers/power/domain/imx8m-power-domain.c b/drivers/power/domain/imx8m-power-domain.c
> index a7e64971a2a..1c731b897cc 100644
> --- a/drivers/power/domain/imx8m-power-domain.c
> +++ b/drivers/power/domain/imx8m-power-domain.c
> @@ -7,7 +7,6 @@
>  #include <dm.h>
>  #include <malloc.h>
>  #include <power-domain-uclass.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <asm/mach-imx/sys_proto.h>
>  #include <dm/device-internal.h>
> @@ -22,8 +21,6 @@
>  #include <dt-bindings/power/imx8mp-power.h>
>  #include <dt-bindings/power/imx8mq-power.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define GPC_PGC_CPU_MAPPING			0x0ec
>  #define IMX8MP_GPC_PGC_CPU_MAPPING		0x1cc
>  
> diff --git a/drivers/power/pmic/bd71837.c b/drivers/power/pmic/bd71837.c
> index a5df2570fc3..13642794765 100644
> --- a/drivers/power/pmic/bd71837.c
> +++ b/drivers/power/pmic/bd71837.c
> @@ -7,14 +7,11 @@
>  #include <dm.h>
>  #include <i2c.h>
>  #include <log.h>
> -#include <asm/global_data.h>
>  #include <linux/printk.h>
>  #include <power/pmic.h>
>  #include <power/regulator.h>
>  #include <power/bd71837.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  static const struct pmic_child_info pmic_children_info[] = {
>  	/* buck */
>  	{ .prefix = "b", .driver = BD718XX_REGULATOR_DRIVER},
> diff --git a/drivers/power/pmic/mc34708.c b/drivers/power/pmic/mc34708.c
> index 43badb5767a..0ec52e25a9e 100644
> --- a/drivers/power/pmic/mc34708.c
> +++ b/drivers/power/pmic/mc34708.c
> @@ -9,11 +9,8 @@
>  #include <errno.h>
>  #include <fsl_pmic.h>
>  #include <i2c.h>
> -#include <asm/global_data.h>
>  #include <power/pmic.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  static int mc34708_reg_count(struct udevice *dev)
>  {
>  	return PMIC_NUM_OF_REGS;
> diff --git a/drivers/power/pmic/mp5416.c b/drivers/power/pmic/mp5416.c
> index 9d44f0ae655..899c2beeb37 100644
> --- a/drivers/power/pmic/mp5416.c
> +++ b/drivers/power/pmic/mp5416.c
> @@ -9,9 +9,6 @@
>  #include <power/pmic.h>
>  #include <power/regulator.h>
>  #include <power/mp5416.h>
> -#include <asm/global_data.h>
> -
> -DECLARE_GLOBAL_DATA_PTR;
>  
>  static const struct pmic_child_info pmic_children_info[] = {
>  	/* buck */
> diff --git a/drivers/power/pmic/pca9450.c b/drivers/power/pmic/pca9450.c
> index e5c1f037b61..c95e6357ee8 100644
> --- a/drivers/power/pmic/pca9450.c
> +++ b/drivers/power/pmic/pca9450.c
> @@ -10,7 +10,6 @@
>  #include <dm/lists.h>
>  #include <i2c.h>
>  #include <log.h>
> -#include <asm/global_data.h>
>  #include <linux/delay.h>
>  #include <linux/printk.h>
>  #include <power/pmic.h>
> @@ -18,8 +17,6 @@
>  #include <power/pca9450.h>
>  #include <sysreset.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  static const struct pmic_child_info pmic_children_info[] = {
>  	/* buck */
>  	{ .prefix = "b", .driver = PCA9450_REGULATOR_DRIVER},
> diff --git a/drivers/power/regulator/pwm_regulator.c b/drivers/power/regulator/pwm_regulator.c
> index ff738faadc5..adde5156c76 100644
> --- a/drivers/power/regulator/pwm_regulator.c
> +++ b/drivers/power/regulator/pwm_regulator.c
> @@ -11,12 +11,9 @@
>  #include <errno.h>
>  #include <log.h>
>  #include <pwm.h>
> -#include <asm/global_data.h>
>  #include <dm/device_compat.h>
>  #include <power/regulator.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  struct pwm_regulator_info {
>  	/* pwm id corresponding to the PWM driver */
>  	int pwm_id;
> diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
> index e9777c71f5e..dea7bc57495 100644
> --- a/drivers/pwm/pwm-sifive.c
> +++ b/drivers/pwm/pwm-sifive.c
> @@ -17,7 +17,6 @@
>  #include <dm.h>
>  #include <pwm.h>
>  #include <regmap.h>
> -#include <asm/global_data.h>
>  #include <linux/io.h>
>  #include <linux/log2.h>
>  #include <linux/bitfield.h>
> @@ -40,8 +39,6 @@
>  #define PWM_SIFIVE_CHANNEL_ENABLE_VAL   0
>  #define PWM_SIFIVE_CHANNEL_DISABLE_VAL  0xffff
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  struct pwm_sifive_regs {
>  	unsigned long cfg;
>  	unsigned long cnt;
> diff --git a/drivers/pwm/rk_pwm.c b/drivers/pwm/rk_pwm.c
> index 0a64eb01dc2..b51dee31a98 100644
> --- a/drivers/pwm/rk_pwm.c
> +++ b/drivers/pwm/rk_pwm.c
> @@ -11,14 +11,11 @@
>  #include <pwm.h>
>  #include <regmap.h>
>  #include <syscon.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <asm/arch-rockchip/pwm.h>
>  #include <linux/bitops.h>
>  #include <power/regulator.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  struct rockchip_pwm_data {
>  	struct rockchip_pwm_regs regs;
>  	unsigned int prescaler;
> diff --git a/drivers/pwm/sunxi_pwm.c b/drivers/pwm/sunxi_pwm.c
> index 2140a05b679..1dd2428da77 100644
> --- a/drivers/pwm/sunxi_pwm.c
> +++ b/drivers/pwm/sunxi_pwm.c
> @@ -9,13 +9,10 @@
>  #include <pwm.h>
>  #include <regmap.h>
>  #include <syscon.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <asm/arch/pwm.h>
>  #include <power/regulator.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define OSC_24MHZ 24000000
>  
>  struct sunxi_pwm_priv {
> diff --git a/drivers/ram/stm32mp1/stm32mp1_tests.c b/drivers/ram/stm32mp1/stm32mp1_tests.c
> index 6108faa7073..3b41d6045ad 100644
> --- a/drivers/ram/stm32mp1/stm32mp1_tests.c
> +++ b/drivers/ram/stm32mp1/stm32mp1_tests.c
> @@ -10,7 +10,6 @@
>  #include <log.h>
>  #include <rand.h>
>  #include <watchdog.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <linux/log2.h>
>  #include "stm32mp1_tests.h"
> @@ -19,8 +18,6 @@
>  
>  #define PATTERN_DEFAULT	"-"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  static int get_bufsize(char *string, int argc, char *argv[], int arg_nb,
>  		       size_t *bufsize, size_t default_size, size_t min_size)
>  {
> diff --git a/drivers/reboot-mode/reboot-mode-gpio.c b/drivers/reboot-mode/reboot-mode-gpio.c
> index 22ee40c3433..8d3e53d50ee 100644
> --- a/drivers/reboot-mode/reboot-mode-gpio.c
> +++ b/drivers/reboot-mode/reboot-mode-gpio.c
> @@ -10,8 +10,6 @@
>  #include <reboot-mode/reboot-mode-gpio.h>
>  #include <reboot-mode/reboot-mode.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  static int reboot_mode_get(struct udevice *dev, u32 *buf)
>  {
>  	int ret;
> diff --git a/drivers/reboot-mode/reboot-mode-rtc.c b/drivers/reboot-mode/reboot-mode-rtc.c
> index 4f4ad63febc..adca584d622 100644
> --- a/drivers/reboot-mode/reboot-mode-rtc.c
> +++ b/drivers/reboot-mode/reboot-mode-rtc.c
> @@ -9,8 +9,6 @@
>  #include <reboot-mode/reboot-mode.h>
>  #include <rtc.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  static int reboot_mode_get(struct udevice *dev, u32 *buf)
>  {
>  	if (!buf)
> diff --git a/drivers/remoteproc/rproc-uclass.c b/drivers/remoteproc/rproc-uclass.c
> index 2dbd3a21cea..47cb64fec77 100644
> --- a/drivers/remoteproc/rproc-uclass.c
> +++ b/drivers/remoteproc/rproc-uclass.c
> @@ -22,8 +22,6 @@
>  #include <linux/compat.h>
>  #include <linux/printk.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  struct resource_table {
>  	u32 ver;
>  	u32 num;
> diff --git a/drivers/serial/ns16550.c b/drivers/serial/ns16550.c
> index 4f7de3ea215..c885b46cf56 100644
> --- a/drivers/serial/ns16550.c
> +++ b/drivers/serial/ns16550.c
> @@ -14,13 +14,10 @@
>  #include <reset.h>
>  #include <spl.h>
>  #include <watchdog.h>
> -#include <asm/global_data.h>
>  #include <linux/err.h>
>  #include <linux/types.h>
>  #include <asm/io.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define UART_LCRVAL UART_LCR_8N1		/* 8 data, 1 stop, no parity */
>  #define UART_MCRVAL (UART_MCR_DTR | \
>  		     UART_MCR_RTS)		/* RTS/DTR */
> diff --git a/drivers/serial/sandbox.c b/drivers/serial/sandbox.c
> index cc0491bc3c8..658cbd2bbc9 100644
> --- a/drivers/serial/sandbox.c
> +++ b/drivers/serial/sandbox.c
> @@ -14,13 +14,10 @@
>  #include <os.h>
>  #include <serial.h>
>  #include <video.h>
> -#include <asm/global_data.h>
>  #include <linux/compiler.h>
>  #include <asm/serial.h>
>  #include <asm/state.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  static size_t _sandbox_serial_written = 1;
>  static bool sandbox_serial_enabled = true;
>  
> diff --git a/drivers/serial/serial_adi_uart4.c b/drivers/serial/serial_adi_uart4.c
> index 45f8315d0a0..784310ba231 100644
> --- a/drivers/serial/serial_adi_uart4.c
> +++ b/drivers/serial/serial_adi_uart4.c
> @@ -80,8 +80,6 @@
>  #define ERXS			BIT(8)
>  #define ETXS			BIT(9)
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  struct uart4_reg {
>  	u32 revid;
>  	u32 control;
> diff --git a/drivers/serial/serial_htif.c b/drivers/serial/serial_htif.c
> index 2a93bbbcc9f..690de3fc085 100644
> --- a/drivers/serial/serial_htif.c
> +++ b/drivers/serial/serial_htif.c
> @@ -8,14 +8,11 @@
>  #include <fdtdec.h>
>  #include <log.h>
>  #include <watchdog.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <linux/compiler.h>
>  #include <serial.h>
>  #include <linux/err.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define HTIF_DATA_BITS		48
>  #define HTIF_DATA_MASK		((1ULL << HTIF_DATA_BITS) - 1)
>  #define HTIF_DATA_SHIFT		0
> diff --git a/drivers/serial/serial_xen.c b/drivers/serial/serial_xen.c
> index e05805f6372..4ba8d3ee641 100644
> --- a/drivers/serial/serial_xen.c
> +++ b/drivers/serial/serial_xen.c
> @@ -7,7 +7,6 @@
>  #include <dm.h>
>  #include <serial.h>
>  #include <watchdog.h>
> -#include <asm/global_data.h>
>  
>  #include <linux/bug.h>
>  
> @@ -20,8 +19,6 @@
>  #include <xen/interface/io/console.h>
>  #include <xen/interface/io/ring.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  u32 console_evtchn;
>  
>  /*
> diff --git a/drivers/smem/msm_smem.c b/drivers/smem/msm_smem.c
> index b6b92d3530d..7a50d5a5792 100644
> --- a/drivers/smem/msm_smem.c
> +++ b/drivers/smem/msm_smem.c
> @@ -7,7 +7,6 @@
>  
>  #include <errno.h>
>  #include <dm.h>
> -#include <asm/global_data.h>
>  #include <dm/device_compat.h>
>  #include <dm/devres.h>
>  #include <dm/of_access.h>
> @@ -20,8 +19,6 @@
>  #include <linux/sizes.h>
>  #include <smem.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  /*
>   * The Qualcomm shared memory system is an allocate-only heap structure that
>   * consists of one of more memory areas that can be accessed by the processors
> diff --git a/drivers/spi/ca_sflash.c b/drivers/spi/ca_sflash.c
> index db32e39add2..f00df93a5f5 100644
> --- a/drivers/spi/ca_sflash.c
> +++ b/drivers/spi/ca_sflash.c
> @@ -21,9 +21,6 @@
>  #include <spi.h>
>  #include <spi-mem.h>
>  #include <reset.h>
> -#include <asm/global_data.h>
> -
> -DECLARE_GLOBAL_DATA_PTR;
>  
>  struct ca_sflash_regs {
>  	u32 idr;		/* 0x00:Flash word ID Register */
> diff --git a/drivers/spi/microchip_coreqspi.c b/drivers/spi/microchip_coreqspi.c
> index a84b257fb1a..b3ff611e8f7 100644
> --- a/drivers/spi/microchip_coreqspi.c
> +++ b/drivers/spi/microchip_coreqspi.c
> @@ -18,8 +18,6 @@
>  #include <linux/sizes.h>
>  #include <asm/gpio.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  /*
>   * QSPI Control register mask defines
>   */
> diff --git a/drivers/spi/mvebu_a3700_spi.c b/drivers/spi/mvebu_a3700_spi.c
> index fde9b142fb8..79836d7e271 100644
> --- a/drivers/spi/mvebu_a3700_spi.c
> +++ b/drivers/spi/mvebu_a3700_spi.c
> @@ -11,14 +11,11 @@
>  #include <spi.h>
>  #include <clk.h>
>  #include <wait_bit.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <dm/device_compat.h>
>  #include <linux/bitops.h>
>  #include <asm/gpio.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define MVEBU_SPI_A3700_XFER_RDY		BIT(1)
>  #define MVEBU_SPI_A3700_FIFO_FLUSH		BIT(9)
>  #define MVEBU_SPI_A3700_BYTE_LEN		BIT(5)
> diff --git a/drivers/spi/omap3_spi.c b/drivers/spi/omap3_spi.c
> index 35bd8766097..b2d115aded4 100644
> --- a/drivers/spi/omap3_spi.c
> +++ b/drivers/spi/omap3_spi.c
> @@ -20,13 +20,10 @@
>  #include <spi.h>
>  #include <time.h>
>  #include <malloc.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <linux/bitops.h>
>  #include <omap3_spi.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  struct omap2_mcspi_platform_config {
>  	unsigned int regs_offset;
>  };
> diff --git a/drivers/spi/spi-sunxi.c b/drivers/spi/spi-sunxi.c
> index e00532a371b..0bdc112d249 100644
> --- a/drivers/spi/spi-sunxi.c
> +++ b/drivers/spi/spi-sunxi.c
> @@ -26,7 +26,6 @@
>  #include <fdt_support.h>
>  #include <reset.h>
>  #include <wait_bit.h>
> -#include <asm/global_data.h>
>  #include <dm/device_compat.h>
>  #include <linux/bitops.h>
>  
> @@ -35,8 +34,6 @@
>  
>  #include <linux/iopoll.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  /* sun4i spi registers */
>  #define SUN4I_RXDATA_REG		0x00
>  #define SUN4I_TXDATA_REG		0x04
> diff --git a/drivers/spi/spi-synquacer.c b/drivers/spi/spi-synquacer.c
> index a3c0ad17121..66c97da610b 100644
> --- a/drivers/spi/spi-synquacer.c
> +++ b/drivers/spi/spi-synquacer.c
> @@ -99,8 +99,6 @@
>  #define TXBIT	1
>  #define RXBIT	2
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  struct synquacer_spi_plat {
>  	void __iomem *base;
>  	bool aces, rtm;
> diff --git a/drivers/spi/spi-uclass.c b/drivers/spi/spi-uclass.c
> index 49b584c648d..60401633341 100644
> --- a/drivers/spi/spi-uclass.c
> +++ b/drivers/spi/spi-uclass.c
> @@ -12,14 +12,11 @@
>  #include <spi.h>
>  #include <spi-mem.h>
>  #include <dm/device_compat.h>
> -#include <asm/global_data.h>
>  #include <dm/device-internal.h>
>  #include <dm/uclass-internal.h>
>  #include <dm/lists.h>
>  #include <dm/util.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define SPI_DEFAULT_SPEED_HZ 100000
>  
>  static int spi_set_speed_mode(struct udevice *bus, int speed, int mode)
> diff --git a/drivers/spi/tegra210_qspi.c b/drivers/spi/tegra210_qspi.c
> index b969a7993d4..0f77fbc8d41 100644
> --- a/drivers/spi/tegra210_qspi.c
> +++ b/drivers/spi/tegra210_qspi.c
> @@ -9,7 +9,6 @@
>  #include <dm.h>
>  #include <log.h>
>  #include <time.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <asm/arch/clock.h>
>  #include <asm/arch-tegra/clk_rst.h>
> @@ -19,8 +18,6 @@
>  #include <linux/delay.h>
>  #include "tegra_spi.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  /* COMMAND1 */
>  #define QSPI_CMD1_GO			BIT(31)
>  #define QSPI_CMD1_M_S			BIT(30)
> diff --git a/drivers/spmi/spmi-msm.c b/drivers/spmi/spmi-msm.c
> index f3cd98c3db8..b89dd0b406b 100644
> --- a/drivers/spmi/spmi-msm.c
> +++ b/drivers/spmi/spmi-msm.c
> @@ -10,13 +10,10 @@
>  #include <dm.h>
>  #include <errno.h>
>  #include <fdtdec.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <dm/device_compat.h>
>  #include <spmi/spmi.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  /* PMIC Arbiter configuration registers */
>  #define PMIC_ARB_VERSION 0x0000
>  #define PMIC_ARB_VERSION_V2_MIN 0x20010000
> diff --git a/drivers/thermal/imx_tmu.c b/drivers/thermal/imx_tmu.c
> index c8389d507ee..1bde4d07f52 100644
> --- a/drivers/thermal/imx_tmu.c
> +++ b/drivers/thermal/imx_tmu.c
> @@ -5,7 +5,6 @@
>   */
>  
>  #include <config.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <asm/arch/clock.h>
>  #include <asm/arch/sys_proto.h>
> @@ -19,8 +18,6 @@
>  #include <malloc.h>
>  #include <thermal.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define SITES_MAX	16
>  #define FLAGS_VER2	0x1
>  #define FLAGS_VER3	0x2
> diff --git a/drivers/timer/ostm_timer.c b/drivers/timer/ostm_timer.c
> index 314f956cdfb..3841d3c90d0 100644
> --- a/drivers/timer/ostm_timer.c
> +++ b/drivers/timer/ostm_timer.c
> @@ -7,7 +7,6 @@
>  
>  #include <clock_legacy.h>
>  #include <malloc.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <dm.h>
>  #include <clk.h>
> @@ -22,8 +21,6 @@
>  #define OSTM_CTL	0x20
>  #define OSTM_CTL_D	BIT(1)
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  struct ostm_priv {
>  	fdt_addr_t	regs;
>  };
> diff --git a/drivers/timer/sp804_timer.c b/drivers/timer/sp804_timer.c
> index 3e57f4b98ba..05532e3330c 100644
> --- a/drivers/timer/sp804_timer.c
> +++ b/drivers/timer/sp804_timer.c
> @@ -8,15 +8,12 @@
>  #include <dm.h>
>  #include <init.h>
>  #include <log.h>
> -#include <asm/global_data.h>
>  #include <dm/ofnode.h>
>  #include <mapmem.h>
>  #include <dt-structs.h>
>  #include <timer.h>
>  #include <asm/io.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define SP804_TIMERX_LOAD		0x00
>  #define SP804_TIMERX_VALUE		0x04
>  #define SP804_TIMERX_CONTROL		0x08
> diff --git a/drivers/usb/common/common.c b/drivers/usb/common/common.c
> index 13e9a61072a..22aa6525c96 100644
> --- a/drivers/usb/common/common.c
> +++ b/drivers/usb/common/common.c
> @@ -7,14 +7,11 @@
>   */
>  
>  #include <dm.h>
> -#include <asm/global_data.h>
>  #include <linux/printk.h>
>  #include <linux/usb/otg.h>
>  #include <linux/usb/ch9.h>
>  #include <linux/usb/phy.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  static const char *const usb_dr_modes[] = {
>  	[USB_DR_MODE_UNKNOWN]		= "",
>  	[USB_DR_MODE_HOST]		= "host",
> diff --git a/drivers/usb/phy/rockchip_usb2_phy.c b/drivers/usb/phy/rockchip_usb2_phy.c
> index ce9a7b5b819..bdbd0d44813 100644
> --- a/drivers/usb/phy/rockchip_usb2_phy.c
> +++ b/drivers/usb/phy/rockchip_usb2_phy.c
> @@ -5,15 +5,12 @@
>  
>  #include <hang.h>
>  #include <log.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <linux/bitops.h>
>  #include <linux/delay.h>
>  
>  #include "../gadget/dwc2_udc_otg_priv.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define BIT_WRITEABLE_SHIFT	16
>  
>  struct usb2phy_reg {
> diff --git a/drivers/usb/tcpm/tcpm.c b/drivers/usb/tcpm/tcpm.c
> index 0aee57cb2f4..3061b466d7c 100644
> --- a/drivers/usb/tcpm/tcpm.c
> +++ b/drivers/usb/tcpm/tcpm.c
> @@ -19,8 +19,6 @@
>  #include <usb/tcpm.h>
>  #include "tcpm-internal.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  const char * const tcpm_states[] = {
>  	FOREACH_TCPM_STATE(GENERATE_TCPM_STRING)
>  };
> diff --git a/drivers/video/hx8238d.c b/drivers/video/hx8238d.c
> index f0220e4cc07..b6980b1aec1 100644
> --- a/drivers/video/hx8238d.c
> +++ b/drivers/video/hx8238d.c
> @@ -16,8 +16,6 @@
>  #include <panel.h>
>  #include <spi.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  /* Register Address */
>  #define HX8238D_OUTPUT_CTRL_ADDR        0x01
>  #define HX8238D_LCD_AC_CTRL_ADDR        0x02
> diff --git a/drivers/video/imx/mxc_ipuv3_fb.c b/drivers/video/imx/mxc_ipuv3_fb.c
> index ab416fdd33c..ef5d4faf3b3 100644
> --- a/drivers/video/imx/mxc_ipuv3_fb.c
> +++ b/drivers/video/imx/mxc_ipuv3_fb.c
> @@ -21,7 +21,6 @@
>  #include "ipu_regs.h"
>  #include "mxcfb.h"
>  #include <asm/cache.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <asm/mach-imx/video.h>
>  #include <linux/err.h>
> @@ -37,8 +36,6 @@
>  #include <dm/devres.h>
>  #include <video.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  static int mxcfb_map_video_memory(struct fb_info *fbi);
>  static int mxcfb_unmap_video_memory(struct fb_info *fbi);
>  
> diff --git a/drivers/video/nexell_display.c b/drivers/video/nexell_display.c
> index ea3776258a0..e0416b70ec0 100644
> --- a/drivers/video/nexell_display.c
> +++ b/drivers/video/nexell_display.c
> @@ -16,14 +16,11 @@
>  #include <linux/compat.h>
>  #include <linux/err.h>
>  #include <video.h>		/* For struct video_uc_plat */
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <asm/arch/display.h>
>  #include <asm/arch/display_dev.h>
>  #include "videomodes.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #if !defined(CONFIG_DM) && !defined(CONFIG_OF_CONTROL)
>  static struct nx_display_dev *dp_dev;
>  #endif
> diff --git a/drivers/video/rockchip/rk_lvds.c b/drivers/video/rockchip/rk_lvds.c
> index c969dae30b6..97c8619a6d8 100644
> --- a/drivers/video/rockchip/rk_lvds.c
> +++ b/drivers/video/rockchip/rk_lvds.c
> @@ -10,7 +10,6 @@
>  #include <panel.h>
>  #include <regmap.h>
>  #include <syscon.h>
> -#include <asm/global_data.h>
>  #include <asm/gpio.h>
>  #include <asm/arch-rockchip/clock.h>
>  #include <asm/arch-rockchip/grf_rk3288.h>
> @@ -19,8 +18,6 @@
>  #include <dt-bindings/clock/rk3288-cru.h>
>  #include <dt-bindings/video/rk3288.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  /**
>   * struct rk_lvds_priv - private rockchip lvds display driver info
>   *
> diff --git a/drivers/video/rockchip/rk_mipi.c b/drivers/video/rockchip/rk_mipi.c
> index 0a603083ba9..e7b5973ca58 100644
> --- a/drivers/video/rockchip/rk_mipi.c
> +++ b/drivers/video/rockchip/rk_mipi.c
> @@ -10,7 +10,6 @@
>  #include <log.h>
>  #include <panel.h>
>  #include <regmap.h>
> -#include <asm/global_data.h>
>  #include "rk_mipi.h"
>  #include <syscon.h>
>  #include <asm/gpio.h>
> @@ -22,8 +21,6 @@
>  #include <asm/arch-rockchip/grf_rk3399.h>
>  #include <asm/arch-rockchip/rockchip_mipi_dsi.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  int rk_mipi_read_timing(struct udevice *dev,
>  			struct display_timing *timing)
>  {
> diff --git a/drivers/video/sandbox_sdl.c b/drivers/video/sandbox_sdl.c
> index 69dfa930273..48da350080a 100644
> --- a/drivers/video/sandbox_sdl.c
> +++ b/drivers/video/sandbox_sdl.c
> @@ -7,15 +7,12 @@
>  #include <fdtdec.h>
>  #include <log.h>
>  #include <video.h>
> -#include <asm/global_data.h>
>  #include <asm/sdl.h>
>  #include <asm/state.h>
>  #include <asm/u-boot-sandbox.h>
>  #include <dm/device-internal.h>
>  #include <dm/test.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  enum {
>  	/* Default LCD size we support */
>  	LCD_MAX_WIDTH		= 1366,
> diff --git a/drivers/video/tidss/tidss_drv.c b/drivers/video/tidss/tidss_drv.c
> index 790ff6e591c..c231fd0341e 100644
> --- a/drivers/video/tidss/tidss_drv.c
> +++ b/drivers/video/tidss/tidss_drv.c
> @@ -42,8 +42,6 @@
>  #include "tidss_regs.h"
>  #include "tidss_oldi.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  /* Panel parameters */
>  enum {
>  	LCD_MAX_WIDTH		= 1920,
> diff --git a/drivers/video/zynqmp/zynqmp_dpsub.c b/drivers/video/zynqmp/zynqmp_dpsub.c
> index a0efd3393f5..fba65bb3d5b 100644
> --- a/drivers/video/zynqmp/zynqmp_dpsub.c
> +++ b/drivers/video/zynqmp/zynqmp_dpsub.c
> @@ -20,12 +20,9 @@
>  #include <linux/delay.h>
>  #include <linux/ioport.h>
>  #include <dm/device_compat.h>
> -#include <asm/global_data.h>
>  
>  #include "zynqmp_dpsub.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  /* Maximum supported resolution */
>  #define WIDTH				1024
>  #define HEIGHT				768
> diff --git a/drivers/watchdog/armada-37xx-wdt.c b/drivers/watchdog/armada-37xx-wdt.c
> index 4b51178e1b8..d7a6b8de492 100644
> --- a/drivers/watchdog/armada-37xx-wdt.c
> +++ b/drivers/watchdog/armada-37xx-wdt.c
> @@ -7,14 +7,11 @@
>  
>  #include <dm.h>
>  #include <wdt.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <asm/arch/cpu.h>
>  #include <asm/arch/soc.h>
>  #include <dm/device_compat.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  struct a37xx_wdt {
>  	void __iomem *sel_reg;
>  	void __iomem *reg;
> diff --git a/drivers/watchdog/at91sam9_wdt.c b/drivers/watchdog/at91sam9_wdt.c
> index 72e13787448..2fb25126b8c 100644
> --- a/drivers/watchdog/at91sam9_wdt.c
> +++ b/drivers/watchdog/at91sam9_wdt.c
> @@ -15,7 +15,6 @@
>   */
>  
>  #include <log.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <asm/arch/at91_wdt.h>
>  #include <div64.h>
> @@ -23,8 +22,6 @@
>  #include <errno.h>
>  #include <wdt.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  /*
>   * AT91SAM9 watchdog runs a 12bit counter @ 256Hz,
>   * use this to convert a watchdog
> diff --git a/drivers/watchdog/mt7621_wdt.c b/drivers/watchdog/mt7621_wdt.c
> index 6308d9632a8..08ef3d84e26 100644
> --- a/drivers/watchdog/mt7621_wdt.c
> +++ b/drivers/watchdog/mt7621_wdt.c
> @@ -11,12 +11,9 @@
>  
>  #include <dm.h>
>  #include <wdt.h>
> -#include <asm/global_data.h>
>  #include <linux/bitops.h>
>  #include <linux/io.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  struct mt762x_wdt {
>  	void __iomem *regs;
>  };
> diff --git a/drivers/watchdog/orion_wdt.c b/drivers/watchdog/orion_wdt.c
> index 4562b2a37e3..a2000b968c9 100644
> --- a/drivers/watchdog/orion_wdt.c
> +++ b/drivers/watchdog/orion_wdt.c
> @@ -16,15 +16,12 @@
>  #include <clk.h>
>  #include <log.h>
>  #include <wdt.h>
> -#include <asm/global_data.h>
>  #include <linux/bitops.h>
>  #include <linux/kernel.h>
>  #include <asm/io.h>
>  #include <asm/arch/cpu.h>
>  #include <asm/arch/soc.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  struct orion_wdt_priv {
>  	void __iomem *reg;
>  	int wdt_counter_offset;
> diff --git a/drivers/watchdog/sbsa_gwdt.c b/drivers/watchdog/sbsa_gwdt.c
> index 03585529bb6..807884c5bc7 100644
> --- a/drivers/watchdog/sbsa_gwdt.c
> +++ b/drivers/watchdog/sbsa_gwdt.c
> @@ -5,7 +5,6 @@
>   * Copyright 2020 NXP
>   */
>  
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <dm/device.h>
>  #include <dm/fdtaddr.h>
> @@ -15,8 +14,6 @@
>  #include <watchdog.h>
>  #include <wdt.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  /* SBSA Generic Watchdog register definitions */
>  /* refresh frame */
>  #define SBSA_GWDT_WRR		0x000
> diff --git a/drivers/watchdog/wdt-uclass.c b/drivers/watchdog/wdt-uclass.c
> index b32590069d9..438833b2245 100644
> --- a/drivers/watchdog/wdt-uclass.c
> +++ b/drivers/watchdog/wdt-uclass.c
> @@ -14,13 +14,10 @@
>  #include <sysreset.h>
>  #include <time.h>
>  #include <wdt.h>
> -#include <asm/global_data.h>
>  #include <dm/device-internal.h>
>  #include <dm/lists.h>
>  #include <linux/kernel.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define WATCHDOG_TIMEOUT_SECS	(CONFIG_WATCHDOG_TIMEOUT_MSECS / 1000)
>  
>  struct wdt_priv {
> diff --git a/fs/fs.c b/fs/fs.c
> index 319c55c440a..8ea50a6c13c 100644
> --- a/fs/fs.c
> +++ b/fs/fs.c
> @@ -24,7 +24,6 @@
>  #include <ubifs_uboot.h>
>  #include <btrfs.h>
>  #include <asm/cache.h>
> -#include <asm/global_data.h>
>  #include <asm/io.h>
>  #include <div64.h>
>  #include <linux/math64.h>
> @@ -34,8 +33,6 @@
>  #include <erofs.h>
>  #include <exfat.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  static struct blk_desc *fs_dev_desc;
>  static int fs_dev_part;
>  static struct disk_partition fs_partition;
> diff --git a/fs/ubifs/ubifs.c b/fs/ubifs/ubifs.c
> index 40bad0e7da7..b0cc0d2e1b2 100644
> --- a/fs/ubifs/ubifs.c
> +++ b/fs/ubifs/ubifs.c
> @@ -16,7 +16,6 @@
>  #include <log.h>
>  #include <malloc.h>
>  #include <memalign.h>
> -#include <asm/global_data.h>
>  #include "ubifs.h"
>  #include <part.h>
>  #include <dm/devres.h>
> @@ -31,8 +30,6 @@
>  #include <abuf.h>
>  #endif
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  /* compress.c */
>  
>  /*
> diff --git a/include/relocate.h b/include/relocate.h
> index 8ca25e1105e..331be138728 100644
> --- a/include/relocate.h
> +++ b/include/relocate.h
> @@ -8,9 +8,7 @@
>  #define _RELOCATE_H_
>  
>  #ifndef USE_HOSTCC
> -#include <asm/global_data.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
>  #endif
>  
>  /**
> diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
> index 89e63ed8dd5..d66ddd1bbf8 100644
> --- a/lib/efi_loader/efi_capsule.c
> +++ b/lib/efi_loader/efi_capsule.c
> @@ -21,7 +21,6 @@
>  #include <mapmem.h>
>  #include <sort.h>
>  #include <sysreset.h>
> -#include <asm/global_data.h>
>  #include <u-boot/uuid.h>
>  
>  #include <asm/sections.h>
> @@ -29,8 +28,6 @@
>  #include <crypto/pkcs7_parser.h>
>  #include <linux/err.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  const efi_guid_t efi_guid_capsule_report = EFI_CAPSULE_REPORT_GUID;
>  static const efi_guid_t efi_guid_firmware_management_capsule_id =
>  		EFI_FIRMWARE_MANAGEMENT_CAPSULE_ID_GUID;
> diff --git a/lib/efi_loader/efi_gop.c b/lib/efi_loader/efi_gop.c
> index 3abb47d610e..9403e09691e 100644
> --- a/lib/efi_loader/efi_gop.c
> +++ b/lib/efi_loader/efi_gop.c
> @@ -13,9 +13,6 @@
>  #include <malloc.h>
>  #include <mapmem.h>
>  #include <video.h>
> -#include <asm/global_data.h>
> -
> -DECLARE_GLOBAL_DATA_PTR;
>  
>  static const efi_guid_t efi_gop_guid = EFI_GRAPHICS_OUTPUT_PROTOCOL_GUID;
>  
> diff --git a/lib/efi_loader/efi_rng.c b/lib/efi_loader/efi_rng.c
> index 4734f95eee1..7810b4e47ea 100644
> --- a/lib/efi_loader/efi_rng.c
> +++ b/lib/efi_loader/efi_rng.c
> @@ -10,9 +10,6 @@
>  #include <efi_rng.h>
>  #include <log.h>
>  #include <rng.h>
> -#include <asm/global_data.h>
> -
> -DECLARE_GLOBAL_DATA_PTR;
>  
>  const efi_guid_t efi_guid_rng_protocol = EFI_RNG_PROTOCOL_GUID;
>  
> diff --git a/net/eth-uclass.c b/net/eth-uclass.c
> index a233912fd8e..5c437143a30 100644
> --- a/net/eth-uclass.c
> +++ b/net/eth-uclass.c
> @@ -14,15 +14,12 @@
>  #include <log.h>
>  #include <net.h>
>  #include <nvmem.h>
> -#include <asm/global_data.h>
>  #include <dm/device-internal.h>
>  #include <dm/uclass-internal.h>
>  #include <net/pcap.h>
>  #include "eth_internal.h"
>  #include <eth_phy.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  /**
>   * struct eth_device_priv - private structure for each Ethernet device
>   *
> diff --git a/net/tftp.c b/net/tftp.c
> index 78ec44159c1..73d6a6a3c1b 100644
> --- a/net/tftp.c
> +++ b/net/tftp.c
> @@ -16,12 +16,9 @@
>  #include <mapmem.h>
>  #include <net.h>
>  #include <net6.h>
> -#include <asm/global_data.h>
>  #include <net/tftp.h>
>  #include "bootp.h"
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  /*
>   * We cannot use the 'tftpput' command in xPL phases. Given how the
>   * support is integrated in the code, this is how we disable that support
> diff --git a/net/wget.c b/net/wget.c
> index d3642958bf0..49bfb9fcb96 100644
> --- a/net/wget.c
> +++ b/net/wget.c
> @@ -4,7 +4,6 @@
>   * Copyright Duncan Hare <dh@synoia.com> 2017
>   */
>  
> -#include <asm/global_data.h>
>  #include <command.h>
>  #include <display_options.h>
>  #include <env.h>
> @@ -17,8 +16,6 @@
>  #include <net/wget.h>
>  #include <stdlib.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  /* The default, change with environment variable 'httpdstp' */
>  #define SERVER_PORT		80
>  
> diff --git a/test/cmd/exit.c b/test/cmd/exit.c
> index fdde054b928..e20bc5f7b98 100644
> --- a/test/cmd/exit.c
> +++ b/test/cmd/exit.c
> @@ -7,11 +7,8 @@
>  
>  #include <console.h>
>  #include <mapmem.h>
> -#include <asm/global_data.h>
>  #include <test/ut.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  /* Declare a new exit test */
>  #define EXIT_TEST(_name, _flags)	UNIT_TEST(_name, _flags, exit)
>  
> diff --git a/test/cmd/test_echo.c b/test/cmd/test_echo.c
> index 8b306cc907f..7ed534742f7 100644
> --- a/test/cmd/test_echo.c
> +++ b/test/cmd/test_echo.c
> @@ -6,14 +6,11 @@
>   */
>  
>  #include <command.h>
> -#include <asm/global_data.h>
>  #include <display_options.h>
>  #include <test/lib.h>
>  #include <test/test.h>
>  #include <test/ut.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  struct test_data {
>  	char *cmd;
>  	char *expected;
> diff --git a/test/cmd/test_pause.c b/test/cmd/test_pause.c
> index 174c31a3852..b2cf60d3e74 100644
> --- a/test/cmd/test_pause.c
> +++ b/test/cmd/test_pause.c
> @@ -5,12 +5,9 @@
>   * Copyright 2022, Samuel Dionne-Riel <samuel@dionne-riel.com>
>   */
>  
> -#include <asm/global_data.h>
>  #include <test/lib.h>
>  #include <test/ut.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  static int lib_test_hush_pause(struct unit_test_state *uts)
>  {
>  	/* Test default message */
> diff --git a/test/dm/blk.c b/test/dm/blk.c
> index 1b928b27d9c..f67869107da 100644
> --- a/test/dm/blk.c
> +++ b/test/dm/blk.c
> @@ -8,14 +8,11 @@
>  #include <part.h>
>  #include <sandbox_host.h>
>  #include <usb.h>
> -#include <asm/global_data.h>
>  #include <asm/state.h>
>  #include <dm/test.h>
>  #include <test/test.h>
>  #include <test/ut.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  /* Test that block devices can be created */
>  static int dm_test_blk_base(struct unit_test_state *uts)
>  {
> diff --git a/test/dm/i3c.c b/test/dm/i3c.c
> index 81336e67555..816ecabd722 100644
> --- a/test/dm/i3c.c
> +++ b/test/dm/i3c.c
> @@ -8,8 +8,6 @@
>  #include <dm/test.h>
>  #include <test/ut.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  /* Basic test of the i3c uclass */
>  static int dm_test_i3c_base(struct unit_test_state *uts)
>  {
> diff --git a/test/lib/test_print.c b/test/lib/test_print.c
> index cd7f3f85769..2aeb034b121 100644
> --- a/test/lib/test_print.c
> +++ b/test/lib/test_print.c
> @@ -7,13 +7,10 @@
>  
>  #include <command.h>
>  #include <display_options.h>
> -#include <asm/global_data.h>
>  #include <test/lib.h>
>  #include <test/test.h>
>  #include <test/ut.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  static int test_print_freq(struct unit_test_state *uts,
>  			   uint64_t freq, char *expected)
>  {
> diff --git a/test/log/log_filter.c b/test/log/log_filter.c
> index 680c60164b6..147b83980cf 100644
> --- a/test/log/log_filter.c
> +++ b/test/log/log_filter.c
> @@ -6,12 +6,9 @@
>  #include <console.h>
>  #include <log.h>
>  #include <vsprintf.h>
> -#include <asm/global_data.h>
>  #include <test/log.h>
>  #include <test/ut.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  /* Test invalid options */
>  static int log_test_filter_invalid(struct unit_test_state *uts)
>  {

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
