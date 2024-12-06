Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 093259E6AF6
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Dec 2024 10:46:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A79E8C6DD9A;
	Fri,  6 Dec 2024 09:46:20 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2053.outbound.protection.outlook.com [40.107.244.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EBB30C6C855
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Dec 2024 09:46:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qJyq78KAnAja1SwAV1TbYoYuoGezIWsl2frmCe+SKLxEYkubtZFsAY+Wes9rbP7HmHt72U+pG28UOWVTlQ6XmhL8rpGf/BrEoZdlIXlfcQ2CvZAm79eGqzvKjGl3rXhOuU3e+0c+Ak5O+bRqIivvX0WHhha+QU7AEuMf+5AZAEt0TZQPmJvgMUQNlSS0ynjIQSHg0CbE2LPwa2amE5j0u0Tff0+33MnN4rbxS1qi8x70lpd5HbmPIEwqgzA0g1/eTtpZ4A1IrBSq6DVEsbtR/CXVtR0idX7mUPC1Gs9rFEqtMzQ7GqyZ3w3jeJ/ApDBwZE0bntlK9NT0c7pA5R2qUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mgKP8Fnl8TM+DO3eAOFX0x21f8BQwHnpInI1ym/gVMY=;
 b=M5Zf80Dq4GwkG3QtdU5x/oNxEF8E3f9aNQSWL8MgRPVce3krgLpaLtVWOo39qlsn4rtKo+xiqVt4L0nYdC4peJtodEvL5SZWM/0hFIar4CErdxR3ok8wtethtoV/k5LIYm0A0D3AcdZtGXCvzzk6PSADRlYue9C/B2ecpstGadSS8+1hQhe/Ufnp0sT12FzyEr8/QjdvgrE5qb2xryy7bRmIrGFmb+f7NDiGpYeJvJuNejeH90SI6bCknszSAoAtPK48k+qZV7I3ZPLXBZmStJStmb0n+LIW8QVATr5Urb/Loqu4BpzrgU0dMLD1N+4sFoITALQ2IX20otphQpDHzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mgKP8Fnl8TM+DO3eAOFX0x21f8BQwHnpInI1ym/gVMY=;
 b=1Q5mmg4bx/lnt43wpVTGC3gTtr0CHh1PAOt9l7rtMWbfCTeZQcWJgOy2qJSozdLW5CCJi5MXK5n43GyVMZT0VDUnynN5hYdbGcORCWEjNj+DmNqaE7Ua2+r2hvU1Z/urRoZwmaCvzj38YVPmwApvMlTvfJo2S5fZnfN5dTaw8mU=
Received: from SA1PR12MB8697.namprd12.prod.outlook.com (2603:10b6:806:385::10)
 by PH7PR12MB8037.namprd12.prod.outlook.com (2603:10b6:510:27d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Fri, 6 Dec
 2024 09:46:08 +0000
Received: from SA1PR12MB8697.namprd12.prod.outlook.com
 ([fe80::dbf9:f1d1:7c67:f88c]) by SA1PR12MB8697.namprd12.prod.outlook.com
 ([fe80::dbf9:f1d1:7c67:f88c%4]) with mapi id 15.20.8207.017; Fri, 6 Dec 2024
 09:46:08 +0000
From: "Abbarapu, Venkatesh" <venkatesh.abbarapu@amd.com>
To: Jon Humphreys <j-humphreys@ti.com>, Marek Vasut <marek.vasut@mailbox.org>, 
 "Simek, Michal" <michal.simek@amd.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>, Tom Rini <trini@konsulko.com>
Thread-Topic: [PATCH 1/6] Revert "spi: zynq_qspi: Add parallel memories
 support in QSPI driver"
Thread-Index: AQHbJMZY/tA7en8DbUuS+Zl7COVM+rKT/mQAgAAGBACAFrNQAIAAGcaAgAAS3QCAAC8HgIAA/EEAgAAESoCABiukAIAlD9cAgAAC7HCAAZQxgIAAVmOg
Date: Fri, 6 Dec 2024 09:46:08 +0000
Message-ID: <SA1PR12MB869743652A0B3EC3335A9F9F98312@SA1PR12MB8697.namprd12.prod.outlook.com>
References: <20241022210633.271534-1-marek.vasut+renesas@mailbox.org>
 <b9cb3ec8-b6f2-4f38-8cda-d3d10278f503@amd.com>
 <e9929e0c-aa43-428f-8bf7-7b4cdef0e9c3@mailbox.org>
 <86v7x05fyd.fsf@udb0321960.dhcp.ti.com>
 <edcec18f-75a0-44d8-907a-f042779ca6ee@mailbox.org>
 <86ses458k3.fsf@udb0321960.dhcp.ti.com>
 <f7bb335d-681a-4b60-92f6-b605cc6f477f@mailbox.org>
 <86pln759j9.fsf@udb0321960.dhcp.ti.com>
 <33e99705-77e3-4acf-95f7-fad65f60ae62@mailbox.org>
 <86ldxp6ehf.fsf@udb0321960.dhcp.ti.com>
 <865xny69y1.fsf@udb0321960.dhcp.ti.com>
 <SA1PR12MB86974AC7EFCCBD7AE99FDD3E98302@SA1PR12MB8697.namprd12.prod.outlook.com>
 <8634j15t1y.fsf@udb0321960.dhcp.ti.com>
In-Reply-To: <8634j15t1y.fsf@udb0321960.dhcp.ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB8697:EE_|PH7PR12MB8037:EE_
x-ms-office365-filtering-correlation-id: 0bab1a61-fc86-4d9f-75e8-08dd15dacf67
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7416014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ijOR/DqwXJ6eseW5SbNq75CR88NLAcqh4uVboeSjv7jt4zbynaSiEvf43s17?=
 =?us-ascii?Q?5XEK2pbRPA7q5soNiiWo8Jl48/rGUKNa9ZJ71KmPd04Ab3Qbc5XHtqNmzd5j?=
 =?us-ascii?Q?ArIw+jgidr1jskTZUyDygwkJcjmckTOdHkoaJRBCywcZWpTASvXU6HVhMD09?=
 =?us-ascii?Q?ZtXzLyjju4w6H/jhKkZ146m/MPrffbghWOpZBmz7RKyMCQX6Drn+2mmcy22I?=
 =?us-ascii?Q?qo/pGpHaoljxa82XHbzuDtnRrWoGYAQvTG6fcHJ/TpdTHjcsy2U/8GxT+u2h?=
 =?us-ascii?Q?8ix/wrCpyFiIDYG9tnJ2g9IFkmWqmisgDpsVHXzgdEaenZ47i8oJmN11gCfB?=
 =?us-ascii?Q?a3Is5X4iXzCAQhIMiNtWdwt0yX/q2QE15CfzmyknED1wvwiaom0NihxqJhD4?=
 =?us-ascii?Q?yAy1OOSGoKSToxSqs1F8ygXRAZ5E6dPzsV5nQ0nmixp2RznkeWrg8JvyvJYL?=
 =?us-ascii?Q?4ypEKxnFglwZ9dKBUSNqc1wXke/JHe+fvN+os2O/maDc8yFE5YL8h/U3huS6?=
 =?us-ascii?Q?iUqT4jp3x9OEiu/Q7HzJhajPNCzT4jlqDvVOiLmef6cxs8xyZ2UniYjh7Fvx?=
 =?us-ascii?Q?4odKdAWHypeHMUvefwmKagfaF8CLa9Hj0rFHcS0oMzXTO5VdkOmJtl26LiOv?=
 =?us-ascii?Q?YeTkowmaAHt64Pdp4Cx+VSsqZs/1RXH8s7MVQu1Hbvw2kreDmXluGiLBDOQP?=
 =?us-ascii?Q?kIBHi4HMc6IugoPN4kVg83JhDY39PEO5kLIZF4IzSUYfltBVo+Yd9lO8upMC?=
 =?us-ascii?Q?S6k+ay9pyH5pv1EGH38rwCpot4KLLc12iVCtntwLexPJfuJrmMQVFn6ZJ4y1?=
 =?us-ascii?Q?u0HjPCrSLC4qCo/OBy2FAsE2pDRQj2fkrMlCAG878RS5ua0N/FQMlyP7uXjv?=
 =?us-ascii?Q?VVDOPR15GC7STvhgFJT/VNvCk0CjwQNVaJq7z8xiJnv3sUsH8cO4iJRFgfmr?=
 =?us-ascii?Q?R6nk8xZExXcVf43Ovs2e+zlWLiavO74bPQg64ezmRYYYlINt9DLFaoiAUo/I?=
 =?us-ascii?Q?ciHj42b4I5QLkuUKnQW5WvzCFz5WX+srD2iFGUsrDM+CyyahCbDsV8dqnXMt?=
 =?us-ascii?Q?87Pe2uSczkn1tz4DkohhXzuB5wh4QfWgzlpX4Z4lNO879+89Q0sXMy7hC0UU?=
 =?us-ascii?Q?ztTf0fo57sSEPZXGZ8iqXGQhi5pRD/MelHN4YfWvpA2y49oHdcDhQSka+vSO?=
 =?us-ascii?Q?/JCGX1bKNBjx/Xv+HxjqJs2ggcplJtoj9Thaqe3yfuj9DGs8qjcN3iB9ozqc?=
 =?us-ascii?Q?OdLFwe01/zLWGwWuWPA/MuW3zZ5pu/I928WSRE9rGiN5YT8M4zpoHBk+1WuJ?=
 =?us-ascii?Q?tYdJPOil18+nFHPMJI1K0vNCNnlIeWNFtVlVlLW/o6dyI+7nItufGlqjMsra?=
 =?us-ascii?Q?5qfX+HAEsAj5tm12tbrL5Y0COs9NSDyz7seSsQX9rF8h2rOmMg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB8697.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?INPESgggztpj64ppawtAfJa4OhX3DCMttmFdDPSfE2kABfOB5YDH25Bmowb8?=
 =?us-ascii?Q?uZKrsXGZGVSQpGAyLLkRdvyb1FkSMIbXciFXZogpbzuMAzcD5UfWBLFvdSB6?=
 =?us-ascii?Q?OY/tkzoSV3XQp2NKFwIz0fhuk12II/lW1rAHo+CCCuoHpkgGlkQ83aZU0H6s?=
 =?us-ascii?Q?SlZgUm99PTzce0U/tnQOhVG+8YDK++F1S7vdGZzRtRvF/X8jtG9e7wmna7dF?=
 =?us-ascii?Q?wOdcC5CoQlyWfqdrDH8GhkJd6ijZTEQrip0DS0G2VwcG7nXJlspFCVWDJCRS?=
 =?us-ascii?Q?y+2toQ7EzmDjl/0fq5PZTbLPpAjbUrXZ8fd9KekUWpXz+f7v4M0unsX9UHPF?=
 =?us-ascii?Q?AP89MWQZLJbBe1TQxvrigT9lpqnVUHUmJvyKgRtHWZZm5NQYmeXT433mtn4C?=
 =?us-ascii?Q?j3NzpYzmXMNgM1z+z6EuAluNfZuGwaQqp4Fa2NsTlbIQmiaXgpVGW4NxwIKm?=
 =?us-ascii?Q?eMQUFTW9qm+YFP8/is7+yv01GyAoy9K/s5ZlqyNSs+5ZlxPP4Z6/DgJaPpx4?=
 =?us-ascii?Q?qQVCuTQzFOqvWqoEWLjpzirPieF/9fZn2SZYYPWpyNyODj9xpSWA9sRYmPBT?=
 =?us-ascii?Q?9iX1lFunzbZZWaLQG9Em5Of4xW6Y0ObYCgcZ13fmQZVgLgGt3NZiixZ/pEXx?=
 =?us-ascii?Q?67N0+IJoFXVjhIGLxjWYThRvPuw4buNE0DmJZWv1EwCQSOAlUY78L6RHBIeM?=
 =?us-ascii?Q?lB7KEUld3ozMlgscCpfRHd+B2LJB11FnZ1VfF9W6k7oC/GmuG2XO5LSEiD0d?=
 =?us-ascii?Q?4pdH6HRFx7B0k0q5wfPFm6u6ioDIxQPEIhs9acIj4QzfaZrK1blyfX5NRyYk?=
 =?us-ascii?Q?+He7w/zzfacCxFhJysh6uI9Efb3+YXQUi8V+n5dr0Zyf5bEytgUszGheaomg?=
 =?us-ascii?Q?DkwE82ZpuXOXeutQVIoFYBmiTm2/vVDl7UC7Jx5+7HjuK1Nrjufs8zKO05zq?=
 =?us-ascii?Q?cOLj0jK3mB4FypCdrVrUXDEoDKg1HCU+5eApAmwCOGsoI/yv7skk1bZWd8Mb?=
 =?us-ascii?Q?70yu5+do9P0cihdgSbs14zH0u+RMzQZx1CS7TKRSK25AuiiiVNx/z6oB5ub+?=
 =?us-ascii?Q?CsAhY293MR1st5z93GblsZBWe6FbJdV5oGTT6yVV7rANTCUXu90Vn/VkLZj+?=
 =?us-ascii?Q?L0x16XTam8CEaHm0xwgLz6iTBFo3CIoeb5lxpXpmQVl6pUqWQUVt5Q8k4P/M?=
 =?us-ascii?Q?/yxIydDV1cF5TfJUKf5i0GyWL8qQzvVymIZbgQNzq8NAGng2I+Bq/QrHfNSU?=
 =?us-ascii?Q?jr/OyxuDVOXXB8uyx2RTvRow3l1At3A1rBotS/9M4PUheWJZMfScgUXXnJw1?=
 =?us-ascii?Q?MRaV5pwt4xsrJgXeY6JGgAs/B4WMIVl7gh8rBySNlFdRYfvTKUZtJS902PQf?=
 =?us-ascii?Q?uu0kac0GhJXJ1h1y74AvQJQOvhVq3+hHdVBuxPukfeHP8LxnFCoPbvDvKvKM?=
 =?us-ascii?Q?z9hnq6/M16zgo2imjOfuHhJ+4b9FoUdSfppJIO4ApzVVGtFvwY7fTCA4N6LM?=
 =?us-ascii?Q?lL9EQvLHnlBbOgK4sPSfHbF3JnaFUpG4TvwRJ4HtX3gLOk3z63PIm1v5YPX0?=
 =?us-ascii?Q?yIae3DPuZfhvlf5pMEY=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB8697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bab1a61-fc86-4d9f-75e8-08dd15dacf67
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2024 09:46:08.2934 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UgCQvJUu/Jiv1J8n837X+8vujvWGKrXpe7J+hY0TW6o/ydYJVIyO6XYkzCluFB2rnvdDDkq+C5IMhERebv9Qpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8037
Cc: Michael Walle <mwalle@kernel.org>, Andre Przywara <andre.przywara@arm.com>,
 Simon Glass <sjg@chromium.org>, Ashok Reddy Soma <ashok.reddy.soma@amd.com>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>, Pratyush Yadav <p.yadav@ti.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: Re: [Uboot-stm32] [PATCH 1/6] Revert "spi: zynq_qspi: Add parallel
 memories support in QSPI driver"
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



> -----Original Message-----
> From: Jon Humphreys <j-humphreys@ti.com>
> Sent: Friday, December 6, 2024 10:04 AM
> To: Abbarapu, Venkatesh <venkatesh.abbarapu@amd.com>; Marek Vasut
> <marek.vasut@mailbox.org>; Simek, Michal <michal.simek@amd.com>; u-
> boot@lists.denx.de; Tom Rini <trini@konsulko.com>
> Cc: Andre Przywara <andre.przywara@arm.com>; Ashok Reddy Soma
> <ashok.reddy.soma@amd.com>; Jagan Teki <jagan@amarulasolutions.com>;
> Michael Walle <mwalle@kernel.org>; Patrice Chotard
> <patrice.chotard@foss.st.com>; Patrick Delaunay <patrick.delaunay@foss.st.com>;
> Pratyush Yadav <p.yadav@ti.com>; Quentin Schulz <quentin.schulz@cherry.de>;
> Sean Anderson <seanga2@gmail.com>; Simon Glass <sjg@chromium.org>;
> Takahiro Kuwano <Takahiro.Kuwano@infineon.com>; Tudor Ambarus
> <tudor.ambarus@linaro.org>; uboot-stm32@st-md-mailman.stormreply.com
> Subject: RE: [PATCH 1/6] Revert "spi: zynq_qspi: Add parallel memories support in
> QSPI driver"
> 
> "Abbarapu, Venkatesh" <venkatesh.abbarapu@amd.com> writes:
> 
> > Hi,
> >
> >> -----Original Message-----
> >> From: Jon Humphreys <j-humphreys@ti.com>
> >> Sent: Thursday, December 5, 2024 9:47 AM
> >> To: Marek Vasut <marek.vasut@mailbox.org>; Simek, Michal
> >> <michal.simek@amd.com>; u-boot@lists.denx.de; Tom Rini
> >> <trini@konsulko.com>
> >> Cc: Andre Przywara <andre.przywara@arm.com>; Ashok Reddy Soma
> >> <ashok.reddy.soma@amd.com>; Jagan Teki <jagan@amarulasolutions.com>;
> >> Michael Walle <mwalle@kernel.org>; Patrice Chotard
> >> <patrice.chotard@foss.st.com>; Patrick Delaunay
> >> <patrick.delaunay@foss.st.com>; Pratyush Yadav <p.yadav@ti.com>;
> >> Quentin Schulz <quentin.schulz@cherry.de>; Sean Anderson
> >> <seanga2@gmail.com>; Simon Glass <sjg@chromium.org>; Takahiro Kuwano
> >> <Takahiro.Kuwano@infineon.com>; Tudor Ambarus
> >> <tudor.ambarus@linaro.org>; Abbarapu, Venkatesh
> >> <venkatesh.abbarapu@amd.com>;
> >> uboot-stm32@st-md-mailman.stormreply.com
> >> Subject: Re: [PATCH 1/6] Revert "spi: zynq_qspi: Add parallel
> >> memories support in QSPI driver"
> >>
> >> Jon Humphreys <j-humphreys@ti.com> writes:
> >>
> >> > Marek Vasut <marek.vasut@mailbox.org> writes:
> >> >
> >> >> On 11/7/24 4:49 PM, Jon Humphreys wrote:
> >> >>> Marek Vasut <marek.vasut@mailbox.org> writes:
> >> >>>
> >> >>>> On 11/6/24 10:58 PM, Jon Humphreys wrote:
> >> >>>>> Marek Vasut <marek.vasut@mailbox.org> writes:
> >> >>>>>
> >> >>>>>> On 11/6/24 8:18 PM, Jon Humphreys wrote:
> >> >>>>>>> Marek Vasut <marek.vasut@mailbox.org> writes:
> >> >>>>>>>
> >> >>>>>>>> On 10/23/24 10:17 AM, Michal Simek wrote:
> >> >>>>>>>>>
> >> >>>>>>>>>
> >> >>>>>>>>> On 10/22/24 23:06, Marek Vasut wrote:
> >> >>>>>>>>>> This reverts commit
> 1e36d34b52e7a1ebe5a2a5339d6905540f4253aa.
> >> >>>>>>>>>>
> >> >>>>>>>>>> This parallel/stacked support breaks basic SPI NOR
> >> >>>>>>>>>> support, e.g. this no longer works:
> >> >>>>>>>>>>
> >> >>>>>>>>>> => sf probe && sf update 0x50000000 0 0x160000
> >> >>>>>>>>>> SF: Detected s25fs512s with page size 256 Bytes, erase
> >> >>>>>>>>>> size
> >> >>>>>>>>>> 256 KiB, total 64 MiB device 0 offset 0x0, size 0x160000
> >> >>>>>>>>>> SPI flash failed in read step
> >> >>>>>>>>>
> >> >>>>>>>>> Reverting everything seems to me too much. Tom has tested
> >> >>>>>>>>> it on his HW and didn't see any issue. That's why better to
> >> >>>>>>>>> look at code which is causing this.
> >> >>>>>>>>> You are reverting everything but likely there is specific
> >> >>>>>>>>> patch which is causing this. Which one is it?
> >> >>>>>>>>> Which board was used for your testing? Likely we don't have
> >> >>>>>>>>> access to
> >> it.
> >> >>>>>>>>> Is there any QEMU available which can be used for debugging?
> >> >>>>>>>>
> >> >>>>>>>> The testcase including the exact SPI NOR model is above.
> >> >>>>>>>>
> >> >>>>>>>> iMX6 with w25q16dw seems to be broken too.
> >> >>>>>>>>
> >> >>>>>>>> Basically every board I have access no longer has a working
> >> >>>>>>>> "sf probe ; sf update" combination ... so yeah, this means
> >> >>>>>>>> this patchset is fundamentally broken.
> >> >>>>>>>>
> >> >>>>>>>
> >> >>>>>>> I can also confirm that the patch series:
> >> >>>>>>>
> >> >>>>>>> f8efc68b30e Merge patch series "spi-nor: Add parallel and
> >> >>>>>>> stacked memories support"
> >> >>>>>>>
> >> >>>>>>> breaks SPI NOR on TI platforms, particularly SK-AM62 and SK-
> AM62P:
> >> >>>>>>>
> >> >>>>>>> U-Boot 2024.10-00752-gf8efc68b30e2 (Nov 06 2024 - 12:25:13
> >> >>>>>>> -0600)
> >> >>>>>>>
> >> >>>>>>> SoC:   AM62X SR1.0 HS-FS
> >> >>>>>>> Model: Texas Instruments AM625 SK ...
> >> >>>>>>> Hit any key to stop autoboot:  0 => sf probe && sf update
> >> >>>>>>> ${loadaddr} 0x400000 0x10
> >> >>>>>>> SF: Detected s28hs512t with page size 256 Bytes, erase size
> >> >>>>>>> 256 KiB, total 64 MiB device 0 offset 0x400000, size 0x10 SPI
> >> >>>>>>> flash failed in read step =>
> >> >>>>>> Sigh ... can you please test current u-boot/master and see if
> >> >>>>>> the error is fixed there ?
> >> >>>>>>
> >> >>>>>
> >> >>>>> Yes I had verified it also fails against master, although the
> >> >>>>> behavior was a bit different.  The .'s below are our DMA engine
> >> >>>>> waiting
> >> indefinitely.
> >> >>>>>
> >> >>>>> => sf probe && sf update ${loadaddr} 0x400000 0x10
> >> >>>>> SF: Detected s28hs512t with page size 256 Bytes, erase size 256
> >> >>>>> KiB, total 64 MiB device 0 offset 0x400000, size 0x10
> >> >>>>> .....................................................
> >> >>>>>
> >> >>>>> I have not investigated further.
> >> >>>>
> >> >>>> Can you try and run some 'git bisect' to find out exactly which
> >> >>>> commit broke your use case ? There is a bunch of fixes for the
> >> >>>> worst breakage that landed recently, but clearly there is more.
> >> >>>>
> >> >>>> Full revert seems increasingly appealing ...
> >> >>>
> >> >>> commit 5d40b3d384d
> >> >> So there is still something broken in that specific commit that I
> >> >> missed when removing the defects ? Sigh ... can you try to narrow it down ?
> >> >
> >> > Hi Marek, I tried to narrow the changes in commit
> >> > 5d40b3d384dc536ec26ce9b76b20b0b84749d2d1 a bit by first applying
> >> > all of the changes in the .h files, and then for spi-nor-core.c,
> >> > only applying changes per function. The only function change that
> >> > causes errors was spi_nor_read(). With the changes in
> >> > spi_nor_read() in commit
> >> > 5d40b3d384dc536ec26ce9b76b20b0b84749d2d1 applied to the prior
> >> > commit fbe16bc2801, did I get:
> >> >
> >> > => sf probe && sf update ${loadaddr} 0x400000 0x10
> >> > SF: Detected s28hs512t with page size 256 Bytes, erase size 256
> >> > KiB, total 64 MiB device 0 offset 0x400000, size 0x10 SPI flash
> >> > failed in read step
> >> >
> >>
> >> Hi all.  What is the status of addressing the failures introduced by
> >> this patchset?  I tried building from u-boot next and still see the failure.
> >>
> >> Marek, was the isolation of changes I performed above helpful in
> >> understanding the failure?
> >>
> >
> > Can you try by applying this change
> > https://lore.kernel.org/u-boot/20241118090544.21956-1-venkatesh.abbara
> > pu@amd.com/
> >
> 
> Hi Venkatesh, the patch seems to remove the issue I was seeing.
> 
> Thanks
> Jon

Hi Humphreys,
Thank you for confirming that the patch worked and resolved the issue.


Thanks
Venkatesh
> 
> > Thanks
> > Venkatesh
> >> Thanks
> >> Jon
> >>
> >> > Let me know if this helps.
> >> >
> >> > Jon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
