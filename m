Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B6B9EA681
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Dec 2024 04:20:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99017C78021;
	Tue, 10 Dec 2024 03:20:28 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061.outbound.protection.outlook.com [40.107.92.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95FD2C78014
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Dec 2024 03:20:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tFy8JSlbr5CGeVFfHqyUJ2vjGx8DubcnBITl62lUieafZSqTIgWUAPndSbuw3K/m9K4avv0FrrD3XFP/RZaaZ98cGxSZoXqbs+OcJrWnjIj7LLjyt5B9pPctgfWR+3t0lL/PIf1CbjiGlFxSx3sJU333xHcFY8nK+FGbWbBjxKpttWXs8C0oBwvRUdC9wo1vHlaiaDg5yHGh70wGYvdiasRnVcNOyPG6iQLmsZ2p7wLM5KtTpBZDkZtl+MYbQqqEIe4jtxiYqhSXMMnMTVHipYCquAz9Dzr8rWdM1M10uWHnq1eHZgPk/c8utUvXpbGlyoFb5CyitkRfX8NgWgIseQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5hH4YA3MFlXsAZBOUxix0KBc6Q1751NpgO8iocKwvSc=;
 b=Aynw8XTd0qn37sh3/JNUwxAgIWEh0f0gi/iiSJYdOXnZ03UD/U11AipfCSg9Mr/rsIcuNMSe7ZIxLRX/Rz3iRS75arrZFrBqQz6TuMd0U5t4gsvpZvNPlONAXIco6csCIDW01Xx02OmqCm57pYMydctHpTuCASBBXqXdWB1HEke5nYVgVMSaYMrNKvctBZwZBbvPbXq5UaWdWfYYDW+tWr/zigi5F7BSYFZB3FaRpjzVj3aaML+/vMEfr/u4y5QFVeO56goHTjISAZNqrVN78m9DauD7f6uk3uCiSKHqyUQROeNniSUKGdIHzOiBkGHRE39esaARor4RD5poKB1pfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5hH4YA3MFlXsAZBOUxix0KBc6Q1751NpgO8iocKwvSc=;
 b=YtuEPNX52DClXzum7uPktsxtlx1IyUE0gXGAKcetah32DNYH/7eO1CGwMvOMqJ+TH55rwDV+i2FxML3f8tjPZ297JSAT2XMVftx7MI5SGYdWenDdmJ2BXwUwYd8cSSplqRKH+M5PiHikpCnWL15zt6jjOncs5wMuxQOFd8hDzGI=
Received: from SA1PR12MB8697.namprd12.prod.outlook.com (2603:10b6:806:385::10)
 by CY8PR12MB7513.namprd12.prod.outlook.com (2603:10b6:930:91::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Tue, 10 Dec
 2024 03:20:18 +0000
Received: from SA1PR12MB8697.namprd12.prod.outlook.com
 ([fe80::dbf9:f1d1:7c67:f88c]) by SA1PR12MB8697.namprd12.prod.outlook.com
 ([fe80::dbf9:f1d1:7c67:f88c%4]) with mapi id 15.20.8230.016; Tue, 10 Dec 2024
 03:20:18 +0000
From: "Abbarapu, Venkatesh" <venkatesh.abbarapu@amd.com>
To: Tom Rini <trini@konsulko.com>, Marek Vasut <marek.vasut@mailbox.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>
Thread-Topic: [PATCH 1/6] Revert "spi: zynq_qspi: Add parallel memories
 support in QSPI driver"
Thread-Index: AQHbJMZY/tA7en8DbUuS+Zl7COVM+rKT/mQAgAAGBACAFrNQAIAAGcaAgAAS3QCAAC8HgIAA/EEAgAAESoCABiukAIAlD9cAgAAC7HCAAZQxgIAAVmOggAB0ZICABWkNUA==
Date: Tue, 10 Dec 2024 03:20:17 +0000
Message-ID: <SA1PR12MB86977B7233CE821D113F369C983D2@SA1PR12MB8697.namprd12.prod.outlook.com>
References: <edcec18f-75a0-44d8-907a-f042779ca6ee@mailbox.org>
 <86ses458k3.fsf@udb0321960.dhcp.ti.com>
 <f7bb335d-681a-4b60-92f6-b605cc6f477f@mailbox.org>
 <86pln759j9.fsf@udb0321960.dhcp.ti.com>
 <33e99705-77e3-4acf-95f7-fad65f60ae62@mailbox.org>
 <86ldxp6ehf.fsf@udb0321960.dhcp.ti.com>
 <865xny69y1.fsf@udb0321960.dhcp.ti.com>
 <SA1PR12MB86974AC7EFCCBD7AE99FDD3E98302@SA1PR12MB8697.namprd12.prod.outlook.com>
 <8634j15t1y.fsf@udb0321960.dhcp.ti.com>
 <SA1PR12MB869743652A0B3EC3335A9F9F98312@SA1PR12MB8697.namprd12.prod.outlook.com>
 <20241206163931.GS2457179@bill-the-cat>
In-Reply-To: <20241206163931.GS2457179@bill-the-cat>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB8697:EE_|CY8PR12MB7513:EE_
x-ms-office365-filtering-correlation-id: 3fd810c3-8db8-4da5-05d2-08dd18c99260
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?VJ9+KR/m7u6Y22mt3G7oiUWxxGQ3F7oCkaespaOWuoIqiuTg4Ov15DCs9BKE?=
 =?us-ascii?Q?N5Hz1sgO/I7o1xp7PnarsXWIKDhW3fqC+t1FWc+3l3IZqDj/VORS+K4uF2VZ?=
 =?us-ascii?Q?L9xJ2sTnEFd0beAE23eIo6HqfD/+yfa0auDPE7E14rlys+8JqOreGwb9kIod?=
 =?us-ascii?Q?i0e/l47jZ8/3RThmSJ24E4YgRs3S9NasYV6rLCYP9tYoUibLhm8eO1wZVFlW?=
 =?us-ascii?Q?NobPSBgT/CiUQjsqA9LbZHr+3cJg2gywbgdM1qtB+C3Kf3W0sfW0v1FCNOch?=
 =?us-ascii?Q?9+qh2qV5a4S/UdmbIu5LZfVcxXOLN9xQwkvHWdt9eyY2G1KZ0K+DAvJIitX4?=
 =?us-ascii?Q?rn1jEM6pWoNqnWvmwta5Xg9v50lwOTtjGHb1hGEry/sAWcdnIxTi5kuYRdzX?=
 =?us-ascii?Q?smRJwZxSTyHW6eDDTNF0BBHhJGRjWsuXV/uAdGo9FbBCLr9xTgjNEX8lqfD8?=
 =?us-ascii?Q?/en29MpdlhL12s+R0weLF+KBV+JmGDqT/MB8+aUiAMF6IVEXAUDO/8DUrFYw?=
 =?us-ascii?Q?l35dDweaXGRaDN3UYc+v7DcspF+L22tpc/iRowNkmXs6lnqRrQQo/xrKD5Iw?=
 =?us-ascii?Q?SK00Hq/ai5migcP32aNiRD4pBxYDg0ioVsa9Spj8fj0AVaBgkjrjb6RHgcqX?=
 =?us-ascii?Q?9XJ1EBdx0EO0WOH33wfR2Ja3JLnE9UBUr870S6UyGsRGROMDrhg/hJ8bafAi?=
 =?us-ascii?Q?/oJkXSboTlUlyW3g1ZAzBAINK0Dh5d24RKxV8tbG6XVpBDMzKdyuJ2a4bTKf?=
 =?us-ascii?Q?Q0WBtnjBrV3PSxjAAVJiDOjQyHkX8eSRJjr58JV9UpjUVK/Hh+ka+vjEubMW?=
 =?us-ascii?Q?Cwoxu8FqoPx1bPgsr+VfJMj9/gwS4O/A2pv7KwOqtM/Pe1bgmd/NsEeCYbWv?=
 =?us-ascii?Q?gvMWvcBoZAC92KjeIFQ17AgToZS6qcI0vyBY85q5707qnevUnIZndBZ3vD41?=
 =?us-ascii?Q?V057/4ycl9PqG40GcdAkoC0Y5YV6CsRnxWNwt9pm7L2rkVDm62DNl2EaGqFd?=
 =?us-ascii?Q?zrCqQBfWNPhYaolCmCcDP43Ob5tLkCuAfFFa3pmrWZmpZWNrB5nFlEwL2sGW?=
 =?us-ascii?Q?hb1SZQ1YP3TRaN8a8uzcYY65i2Cn8PZumZ266mYJDbFZ7M7/yhvZt/Uqhdrw?=
 =?us-ascii?Q?F2qDKQ3lukcMvE60Ujwlk+i6VpmzEU5xf96eDSchamIr9vMnqNufU+LE2bP3?=
 =?us-ascii?Q?ZF4HP8jlnzqYj+YMsRlDKbkEr4qf2OdKbCGSUV4H4Wriq1vBaYN0v/yKirbl?=
 =?us-ascii?Q?+wMRNeBSLnqgYMhm/OyWOhIYA1OA1ZzZOEKCSZycSZJN6H+9j7WDMLFTufBC?=
 =?us-ascii?Q?ZyOmutHL7P2ZCCNegI9QqMtUxYog28EK3aGwCxB30dlrJk6aBeso3XUdhRDQ?=
 =?us-ascii?Q?VXn48e61aAZrq9b8Ec8kK2EsnMDpwKIVSDyhpe4mFoKzKUwuWg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB8697.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uyLpb0Pj5+lLzaY+4g0LWDKGNOg8RIlADdYJpYsPmcnoFPe8PIXWXbxzWBV/?=
 =?us-ascii?Q?vE548qlbTaAWBQLG64/2b17tuA87IWO5C9OiYQz07LyDEUz+xOZedCxMMvXf?=
 =?us-ascii?Q?6GXRaI9FKtmHcN7s03nA442DPwXC3UaOJQRVmgPdJNVTbgUH7QFfYxicHOLo?=
 =?us-ascii?Q?rhB9ULXx675SNB0jcBhYlOUwDZUM55g8cte+xdsoGa6HzAqSiwocOi5/9WVp?=
 =?us-ascii?Q?Iqueuh2TS3G+rUq/JKFASysaWjnqkpBxjWiwTec1ujVyj+oF57VxF70B9JTQ?=
 =?us-ascii?Q?1XWBTU1mdPWERsq7OuWqGuLTfeP8z6PaZNFi6w/RpTJIQC5MoLBLqLeJqaC+?=
 =?us-ascii?Q?VMREskD6va45C82T+XZCzJqpMZqpenhBkD3P8336TOihTlTsXmAwYb36p7mw?=
 =?us-ascii?Q?LArYUUP28gzQaF8yhjvM9BqrgcKWyZjI4ohQpOaHkDCsJuTvaANZDfD3vF2T?=
 =?us-ascii?Q?RxdqQYvgexXkSJ4xYjj5u8pvfT6f7K8BppJo7JuLRRCLZ1TMGHeHzc5Nsr1h?=
 =?us-ascii?Q?sXWxO4azq8pCYhr8j02i78+BeEMdCVWMRLScQMC8qWalBzGUbzqX2/0ztYds?=
 =?us-ascii?Q?zPVPIXSMKvN8PPi9lANWmb/qzOTVZcTFL64S7tFVcBn0Kq7T6M56/pnvItib?=
 =?us-ascii?Q?td1Ad092WZJGF18CyRC/Z71fdoxqHv8w511K7j2IKWGD6B0PffbjzDa9lTk7?=
 =?us-ascii?Q?HbPfBXlq0ESJqgM4XWDiMO+nnC5ZyRzdvb4L+M6QjLfuW2D0n2WXj9GVZAJr?=
 =?us-ascii?Q?hw89L37Obz3S0CtLlJnJ5xZCkYIWcKaCOAO6uvYQIoK2GIFyrVyyW2iAO/oF?=
 =?us-ascii?Q?0E2VCXagn0pXFl2OJpDjn9i7v9Y4cgiUQ+9Z1sNyZimpFkK7Qk3t9NTGunFX?=
 =?us-ascii?Q?otBztSi2t+Q4YbYfWDM3qw3PMXL8xBosPgsPtJ7+4H0X56gObRttNdlOW1DZ?=
 =?us-ascii?Q?xSMZZEqLSr0xTeLvW5seQzonrUORAARN3MuFY38AxdWODdmH6xFXyVgH0f/5?=
 =?us-ascii?Q?2nOCV66RoLEuEcpyPxYTt84HUZ+KcOUXuJ55VaGuMatdNh6DHmMyzJqSqBSx?=
 =?us-ascii?Q?QzrZP7+DlQFYGr3tATL9ZdW2Lrj+7D5fIvotq46bMv7heR+UUEP66LCuwK7Q?=
 =?us-ascii?Q?C51r7577bp9VvwGGaoWXMdwenoubjPN6aBax/Xbp4ZFaTYQ4uKS/HECjIvPf?=
 =?us-ascii?Q?9tRsIjVyXza3qiU4gNUtpjPFiC0yQQ92+Ou0mKxTOYoJI2iyA08dM7qFt7M6?=
 =?us-ascii?Q?//Qfecoi0Owvosg2dUk1lGhgCxFgcODi3mAHEHYZH8b1EyIocrWZ32t7enfG?=
 =?us-ascii?Q?GTMNMQjG333gCNqxYRGHKKx6Q5cChQhDMWzn8VPGJogep1JMZbK/VvtADf+8?=
 =?us-ascii?Q?sNBgqOIE3qfyW44/wOR+i8EWmMws6NJJA/FNI6y+NQz3hl7UrmI/yKql+e4b?=
 =?us-ascii?Q?oelzGOVBvpF4SeJpT8R1AiZ/rAJv3us4piYUh7fCHSFARUCdC8I/j+jT994u?=
 =?us-ascii?Q?cetYLAAKxg8w5EoadGi1UaiiolqWRQ22Xw2uKLHHZ7LmN7cZ2j/Ku9HqUnEl?=
 =?us-ascii?Q?hO4DEsTbEYwYRxEJPxY=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB8697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fd810c3-8db8-4da5-05d2-08dd18c99260
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2024 03:20:17.9365 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TIgf2GRZ5og8W29KnDRTxBfSqcPBTQ04qQmYk32hTzoB7rSspHiY+041kizBo0RX5ayVL0w0gvNjrWyqdh+Nhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7513
Cc: Jon Humphreys <j-humphreys@ti.com>, Michael Walle <mwalle@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>, Simon Glass <sjg@chromium.org>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>, "Simek, Michal" <michal.simek@amd.com>,
 Ashok Reddy Soma <ashok.reddy.soma@amd.com>, Pratyush Yadav <p.yadav@ti.com>,
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
> From: Tom Rini <trini@konsulko.com>
> Sent: Friday, December 6, 2024 10:10 PM
> To: Abbarapu, Venkatesh <venkatesh.abbarapu@amd.com>
> Cc: Jon Humphreys <j-humphreys@ti.com>; Marek Vasut
> <marek.vasut@mailbox.org>; Simek, Michal <michal.simek@amd.com>; u-
> boot@lists.denx.de; Andre Przywara <andre.przywara@arm.com>; Ashok Reddy
> Soma <ashok.reddy.soma@amd.com>; Jagan Teki
> <jagan@amarulasolutions.com>; Michael Walle <mwalle@kernel.org>; Patrice
> Chotard <patrice.chotard@foss.st.com>; Patrick Delaunay
> <patrick.delaunay@foss.st.com>; Pratyush Yadav <p.yadav@ti.com>; Quentin
> Schulz <quentin.schulz@cherry.de>; Sean Anderson <seanga2@gmail.com>;
> Simon Glass <sjg@chromium.org>; Takahiro Kuwano
> <Takahiro.Kuwano@infineon.com>; Tudor Ambarus <tudor.ambarus@linaro.org>;
> uboot-stm32@st-md-mailman.stormreply.com
> Subject: Re: [PATCH 1/6] Revert "spi: zynq_qspi: Add parallel memories support in
> QSPI driver"
> 
> On Fri, Dec 06, 2024 at 09:46:08AM +0000, Abbarapu, Venkatesh wrote:
> >
> >
> > > -----Original Message-----
> > > From: Jon Humphreys <j-humphreys@ti.com>
> > > Sent: Friday, December 6, 2024 10:04 AM
> > > To: Abbarapu, Venkatesh <venkatesh.abbarapu@amd.com>; Marek Vasut
> > > <marek.vasut@mailbox.org>; Simek, Michal <michal.simek@amd.com>; u-
> > > boot@lists.denx.de; Tom Rini <trini@konsulko.com>
> > > Cc: Andre Przywara <andre.przywara@arm.com>; Ashok Reddy Soma
> > > <ashok.reddy.soma@amd.com>; Jagan Teki <jagan@amarulasolutions.com>;
> > > Michael Walle <mwalle@kernel.org>; Patrice Chotard
> > > <patrice.chotard@foss.st.com>; Patrick Delaunay
> > > <patrick.delaunay@foss.st.com>; Pratyush Yadav <p.yadav@ti.com>;
> > > Quentin Schulz <quentin.schulz@cherry.de>; Sean Anderson
> > > <seanga2@gmail.com>; Simon Glass <sjg@chromium.org>; Takahiro Kuwano
> > > <Takahiro.Kuwano@infineon.com>; Tudor Ambarus
> > > <tudor.ambarus@linaro.org>; uboot-stm32@st-md-mailman.stormreply.com
> > > Subject: RE: [PATCH 1/6] Revert "spi: zynq_qspi: Add parallel
> > > memories support in QSPI driver"
> > >
> > > "Abbarapu, Venkatesh" <venkatesh.abbarapu@amd.com> writes:
> > >
> > > > Hi,
> > > >
> > > >> -----Original Message-----
> > > >> From: Jon Humphreys <j-humphreys@ti.com>
> > > >> Sent: Thursday, December 5, 2024 9:47 AM
> > > >> To: Marek Vasut <marek.vasut@mailbox.org>; Simek, Michal
> > > >> <michal.simek@amd.com>; u-boot@lists.denx.de; Tom Rini
> > > >> <trini@konsulko.com>
> > > >> Cc: Andre Przywara <andre.przywara@arm.com>; Ashok Reddy Soma
> > > >> <ashok.reddy.soma@amd.com>; Jagan Teki
> > > >> <jagan@amarulasolutions.com>; Michael Walle <mwalle@kernel.org>;
> > > >> Patrice Chotard <patrice.chotard@foss.st.com>; Patrick Delaunay
> > > >> <patrick.delaunay@foss.st.com>; Pratyush Yadav <p.yadav@ti.com>;
> > > >> Quentin Schulz <quentin.schulz@cherry.de>; Sean Anderson
> > > >> <seanga2@gmail.com>; Simon Glass <sjg@chromium.org>; Takahiro
> > > >> Kuwano <Takahiro.Kuwano@infineon.com>; Tudor Ambarus
> > > >> <tudor.ambarus@linaro.org>; Abbarapu, Venkatesh
> > > >> <venkatesh.abbarapu@amd.com>;
> > > >> uboot-stm32@st-md-mailman.stormreply.com
> > > >> Subject: Re: [PATCH 1/6] Revert "spi: zynq_qspi: Add parallel
> > > >> memories support in QSPI driver"
> > > >>
> > > >> Jon Humphreys <j-humphreys@ti.com> writes:
> > > >>
> > > >> > Marek Vasut <marek.vasut@mailbox.org> writes:
> > > >> >
> > > >> >> On 11/7/24 4:49 PM, Jon Humphreys wrote:
> > > >> >>> Marek Vasut <marek.vasut@mailbox.org> writes:
> > > >> >>>
> > > >> >>>> On 11/6/24 10:58 PM, Jon Humphreys wrote:
> > > >> >>>>> Marek Vasut <marek.vasut@mailbox.org> writes:
> > > >> >>>>>
> > > >> >>>>>> On 11/6/24 8:18 PM, Jon Humphreys wrote:
> > > >> >>>>>>> Marek Vasut <marek.vasut@mailbox.org> writes:
> > > >> >>>>>>>
> > > >> >>>>>>>> On 10/23/24 10:17 AM, Michal Simek wrote:
> > > >> >>>>>>>>>
> > > >> >>>>>>>>>
> > > >> >>>>>>>>> On 10/22/24 23:06, Marek Vasut wrote:
> > > >> >>>>>>>>>> This reverts commit
> > > 1e36d34b52e7a1ebe5a2a5339d6905540f4253aa.
> > > >> >>>>>>>>>>
> > > >> >>>>>>>>>> This parallel/stacked support breaks basic SPI NOR
> > > >> >>>>>>>>>> support, e.g. this no longer works:
> > > >> >>>>>>>>>>
> > > >> >>>>>>>>>> => sf probe && sf update 0x50000000 0 0x160000
> > > >> >>>>>>>>>> SF: Detected s25fs512s with page size 256 Bytes, erase
> > > >> >>>>>>>>>> size
> > > >> >>>>>>>>>> 256 KiB, total 64 MiB device 0 offset 0x0, size
> > > >> >>>>>>>>>> 0x160000 SPI flash failed in read step
> > > >> >>>>>>>>>
> > > >> >>>>>>>>> Reverting everything seems to me too much. Tom has
> > > >> >>>>>>>>> tested it on his HW and didn't see any issue. That's
> > > >> >>>>>>>>> why better to look at code which is causing this.
> > > >> >>>>>>>>> You are reverting everything but likely there is
> > > >> >>>>>>>>> specific patch which is causing this. Which one is it?
> > > >> >>>>>>>>> Which board was used for your testing? Likely we don't
> > > >> >>>>>>>>> have access to
> > > >> it.
> > > >> >>>>>>>>> Is there any QEMU available which can be used for debugging?
> > > >> >>>>>>>>
> > > >> >>>>>>>> The testcase including the exact SPI NOR model is above.
> > > >> >>>>>>>>
> > > >> >>>>>>>> iMX6 with w25q16dw seems to be broken too.
> > > >> >>>>>>>>
> > > >> >>>>>>>> Basically every board I have access no longer has a
> > > >> >>>>>>>> working "sf probe ; sf update" combination ... so yeah,
> > > >> >>>>>>>> this means this patchset is fundamentally broken.
> > > >> >>>>>>>>
> > > >> >>>>>>>
> > > >> >>>>>>> I can also confirm that the patch series:
> > > >> >>>>>>>
> > > >> >>>>>>> f8efc68b30e Merge patch series "spi-nor: Add parallel and
> > > >> >>>>>>> stacked memories support"
> > > >> >>>>>>>
> > > >> >>>>>>> breaks SPI NOR on TI platforms, particularly SK-AM62 and
> > > >> >>>>>>> SK-
> > > AM62P:
> > > >> >>>>>>>
> > > >> >>>>>>> U-Boot 2024.10-00752-gf8efc68b30e2 (Nov 06 2024 -
> > > >> >>>>>>> 12:25:13
> > > >> >>>>>>> -0600)
> > > >> >>>>>>>
> > > >> >>>>>>> SoC:   AM62X SR1.0 HS-FS
> > > >> >>>>>>> Model: Texas Instruments AM625 SK ...
> > > >> >>>>>>> Hit any key to stop autoboot:  0 => sf probe && sf update
> > > >> >>>>>>> ${loadaddr} 0x400000 0x10
> > > >> >>>>>>> SF: Detected s28hs512t with page size 256 Bytes, erase
> > > >> >>>>>>> size
> > > >> >>>>>>> 256 KiB, total 64 MiB device 0 offset 0x400000, size 0x10
> > > >> >>>>>>> SPI flash failed in read step =>
> > > >> >>>>>> Sigh ... can you please test current u-boot/master and see
> > > >> >>>>>> if the error is fixed there ?
> > > >> >>>>>>
> > > >> >>>>>
> > > >> >>>>> Yes I had verified it also fails against master, although
> > > >> >>>>> the behavior was a bit different.  The .'s below are our
> > > >> >>>>> DMA engine waiting
> > > >> indefinitely.
> > > >> >>>>>
> > > >> >>>>> => sf probe && sf update ${loadaddr} 0x400000 0x10
> > > >> >>>>> SF: Detected s28hs512t with page size 256 Bytes, erase size
> > > >> >>>>> 256 KiB, total 64 MiB device 0 offset 0x400000, size 0x10
> > > >> >>>>> .....................................................
> > > >> >>>>>
> > > >> >>>>> I have not investigated further.
> > > >> >>>>
> > > >> >>>> Can you try and run some 'git bisect' to find out exactly
> > > >> >>>> which commit broke your use case ? There is a bunch of fixes
> > > >> >>>> for the worst breakage that landed recently, but clearly there is more.
> > > >> >>>>
> > > >> >>>> Full revert seems increasingly appealing ...
> > > >> >>>
> > > >> >>> commit 5d40b3d384d
> > > >> >> So there is still something broken in that specific commit
> > > >> >> that I missed when removing the defects ? Sigh ... can you try to narrow it
> down ?
> > > >> >
> > > >> > Hi Marek, I tried to narrow the changes in commit
> > > >> > 5d40b3d384dc536ec26ce9b76b20b0b84749d2d1 a bit by first
> > > >> > applying all of the changes in the .h files, and then for
> > > >> > spi-nor-core.c, only applying changes per function. The only
> > > >> > function change that causes errors was spi_nor_read(). With the
> > > >> > changes in
> > > >> > spi_nor_read() in commit
> > > >> > 5d40b3d384dc536ec26ce9b76b20b0b84749d2d1 applied to the prior
> > > >> > commit fbe16bc2801, did I get:
> > > >> >
> > > >> > => sf probe && sf update ${loadaddr} 0x400000 0x10
> > > >> > SF: Detected s28hs512t with page size 256 Bytes, erase size 256
> > > >> > KiB, total 64 MiB device 0 offset 0x400000, size 0x10 SPI flash
> > > >> > failed in read step
> > > >> >
> > > >>
> > > >> Hi all.  What is the status of addressing the failures introduced
> > > >> by this patchset?  I tried building from u-boot next and still see the failure.
> > > >>
> > > >> Marek, was the isolation of changes I performed above helpful in
> > > >> understanding the failure?
> > > >>
> > > >
> > > > Can you try by applying this change
> > > > https://lore.kernel.org/u-boot/20241118090544.21956-1-venkatesh.ab
> > > > bara
> > > > pu@amd.com/
> > > >
> > >
> > > Hi Venkatesh, the patch seems to remove the issue I was seeing.
> > >
> > > Thanks
> > > Jon
> >
> > Hi Humphreys,
> > Thank you for confirming that the patch worked and resolved the issue.
> 
> OK, but going back to the patch in question, Tudor has requested changes. When
> can we expect a v2 that addresses those, so that Jon and Marek can also confirm
> their platforms work? Thanks.

Tudor, Do you want me to implement separate spi_nor_erase()/spi_nor_read()/spi_nor_write() for the parallel/stacked configurations?
Marek, any suggestions regarding this implementation?

Thanks
Venaktesh
> 
> --
> Tom
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
