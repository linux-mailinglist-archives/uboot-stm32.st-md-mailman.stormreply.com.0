Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E1E9E4D08
	for <lists+uboot-stm32@lfdr.de>; Thu,  5 Dec 2024 05:28:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85059C71292;
	Thu,  5 Dec 2024 04:28:06 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2073.outbound.protection.outlook.com [40.107.236.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A3CCC7128A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Dec 2024 04:27:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IYbtB3Tcupj5UqqByK2kZE3C8gAgjcidFDyUrvSERc+iyBGnfyTBMFYUQDwG/JSpugV00XumtHW4E6OTdNhRVW3hYfYOf2OA+8sMyIw5ZuquuRy9tukcl+3TjNbUT98mXmEhwpMSfgMzXWRmlTaF5muZQp56NCOzyKJrZk0Fc1xlGVCIWgkQAYfC5R2xVVzdw+Z+LgHiVUB7yMh1owgB6TzSixxTt96Xm6qUdgu7Poec9A+lwpiU6t9Yo3Dq4fTCxcHLpmvtZbqk+MQAhZ+1998umR1wW0AiVjOJm4vgSzZhJH5q13NQIwBbzSijOpWKzT2RhEShBzo7TxP2FeEl9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f33sNiCqJnkgf22ZLRvntDY/eZfAdREFny4gfRotT4k=;
 b=NOqNYmgaxCy+QSja47etzU98xz8ObS/D3cXCZ1qKFWUH9FaheEX4D6SMv73wpjaVyIwMG3OQacJXqCKCcQ22Kk6LPKtZTg2xCKprxSXcSEgBvB4RPDZ6+Aq81NwsCTLKau0mG65+FZ+7Hq+BG7oB7moAqZLMvCHl5rHJCxUsZ6MVvpViC2e3tpR3zGNK2SpU56TGNV5ofoEoWsnVoYxNv2yRBO1NCW2oiHNrtPRK11QB2WzBYih807GndL66uxu+wnIMK5j4VAFlWwE+qN4BFRar544gi2JaiaGsvlZW3oUL3/DEpkG/ugIWU/W5sXm0aRrI7gLTCnM6sRd2t078ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f33sNiCqJnkgf22ZLRvntDY/eZfAdREFny4gfRotT4k=;
 b=lH3eC04szilxW5EdzJykNoixUwLylNNtvb/2vYXqz3cf/Hzl8FMh16KWd8BPuzkQW4pwpqm3QCsXajXSJ0rBQ0vObXRhR3HC18nd/f//OqGIBnT5GPoN3HLJAYRrl3Mg66OxLSMVKD76BWqM+Y8kCe2ODf4VUkPeuS5/5rwLyQw=
Received: from SA1PR12MB8697.namprd12.prod.outlook.com (2603:10b6:806:385::10)
 by PH7PR12MB5951.namprd12.prod.outlook.com (2603:10b6:510:1da::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Thu, 5 Dec
 2024 04:27:53 +0000
Received: from SA1PR12MB8697.namprd12.prod.outlook.com
 ([fe80::dbf9:f1d1:7c67:f88c]) by SA1PR12MB8697.namprd12.prod.outlook.com
 ([fe80::dbf9:f1d1:7c67:f88c%4]) with mapi id 15.20.8207.017; Thu, 5 Dec 2024
 04:27:52 +0000
From: "Abbarapu, Venkatesh" <venkatesh.abbarapu@amd.com>
To: Jon Humphreys <j-humphreys@ti.com>, Marek Vasut <marek.vasut@mailbox.org>, 
 "Simek, Michal" <michal.simek@amd.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>, Tom Rini <trini@konsulko.com>
Thread-Topic: [PATCH 1/6] Revert "spi: zynq_qspi: Add parallel memories
 support in QSPI driver"
Thread-Index: AQHbJMZY/tA7en8DbUuS+Zl7COVM+rKT/mQAgAAGBACAFrNQAIAAGcaAgAAS3QCAAC8HgIAA/EEAgAAESoCABiukAIAlD9cAgAAC7HA=
Date: Thu, 5 Dec 2024 04:27:52 +0000
Message-ID: <SA1PR12MB86974AC7EFCCBD7AE99FDD3E98302@SA1PR12MB8697.namprd12.prod.outlook.com>
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
In-Reply-To: <865xny69y1.fsf@udb0321960.dhcp.ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB8697:EE_|PH7PR12MB5951:EE_
x-ms-office365-filtering-correlation-id: 6743ec13-9e08-445f-6d6a-08dd14e52f10
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?DU+FoQlTaACIMvJJ3Q9VXgrkYQTt3wrD6nCeE5mE/oPg/WC3KUAn/a+dO+HT?=
 =?us-ascii?Q?5U7iaGAo0ixCKOnx1bhRuSGjnDYYhwDxtSYWZbzZLkQIVDoez5yXt11ka/J6?=
 =?us-ascii?Q?1T0EYv7xwL5Hm92OJulGyfMHr/DLVraErNTMvETZBHVK2cnley2VxLSZbj3G?=
 =?us-ascii?Q?lr0RnGEMuK8hRLRzY115ttV3WpYi1xyzZxe1gEckA1pFwRHyHKX99sIa7NM/?=
 =?us-ascii?Q?tY6ztG8Q96La8XmpWfmyDz/SEHTmPFlatimANmaUp0jvkrwvqyPfFkMFGHC+?=
 =?us-ascii?Q?+Mq7lYgmKP1pbu3I7xQvx6dNCcoxiu7w6VhKaQSjup8BSztJzmjeOMepQlKp?=
 =?us-ascii?Q?ahjKTMDBKK0K9EYucxF7Q6vRcIO86gPT7aeeSRya5kuCpl7cpNnJWu/gJ+w8?=
 =?us-ascii?Q?Ci9iKq1lfbfr3IhTevZiNR9pfNCBGgt8X1Y8GTR1v6LujiCEdKx5SJ2qtil2?=
 =?us-ascii?Q?ekHb6yeQ0/Bm7ryXfRKGjCTP5Ci2WFau92g6eEqUADJ2yOtkv9PM9LwLUolQ?=
 =?us-ascii?Q?XnJuGlPLMzvewJHHbsyA2LpqR23FRlSu25M+1LDGWUSWLrWaB86bpjsjJ0+P?=
 =?us-ascii?Q?IzHR/L8dCUAQ6LDcVoegQYHKJ9QXGiXI/wQ7jINhAxZux52YsYGIzmCpjONt?=
 =?us-ascii?Q?pWSxs/8JAl4oTl6KpVkhytjNZioVW75wXWFA5May4oscylujU6LR8AN3ZkKf?=
 =?us-ascii?Q?/yIUdpmnke2XCP1l1oAWB6weYjof2Vd4Y9kHFuzH4WPYG1PwVOhU+hLJah20?=
 =?us-ascii?Q?nkRpKj6Tgom5BtZRA6UQ1qpfBhCLzl7ZFuW00qGXiR5JKxlCiILdX/y8Nqmy?=
 =?us-ascii?Q?+PjFPC7BfcAshwtp0CKOayyZguk74qD6l1b0RCWnnItpmK83WTz4okpxJeZg?=
 =?us-ascii?Q?RMSUthr7BBPWDLCuoNQrjpoV89ifzlWR5gsH5zRGWGbE+5YqOCzifnsP0r8L?=
 =?us-ascii?Q?CjoK089sOS9SUltV6zPJxmC14SJdMrPpgPMt9bj0A56uSTdwbruPKXABCTmn?=
 =?us-ascii?Q?0sSv8DVAp8WGQbH6V3v+wgpNyWFn0fYcOeVya5J9ZzVHptGaIeRA3YpnpH1j?=
 =?us-ascii?Q?YaOj9uqDJTa50bL1L1Typ0CCTfE3FdTFaJj2KiZZ/T86rIcAiRWD4qh6STG8?=
 =?us-ascii?Q?Pi8b6UUHUFISUKv4sXaLLhMMOoCVGSqIkUB8Cvr5Z5yY+e2fqpzBoWewbZok?=
 =?us-ascii?Q?GaTPSkfYF06saBZqhfNLP7GfxEV914oTwN6WPUBr0nXfaaE2ryh5BrtTVagM?=
 =?us-ascii?Q?TSJHL5vuv07FnRo9Ds3uhbU9wCC2taJFvt/rIqM1jZHFKfFQxKN4Uvq3Wqfz?=
 =?us-ascii?Q?g8X3areX4YFE9uBBw2HyEDKK9+4vgv4kRnakSdSbwirMEdR2uQtsbg+Y1XZ/?=
 =?us-ascii?Q?d39WWRTyxJ1OmToecdqeKj6aZ07I3skuOnuTw2Fr0Pt6GXd2VQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB8697.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NQ0RC48/4/rbIlUkMjt/r/v2woLPuMDAsPwOSXXz4Auj+0iYPxzUwFG3LZSl?=
 =?us-ascii?Q?TjAFj+MOG7EdY7p0N12TJguOfk9hZjhGsFoIDMKDTFYEqel1RxjF/E9bfM24?=
 =?us-ascii?Q?mzIVDLVZmfL6EzD84oTcVbA/fcE+jJdN0y9UoD5s13Gzo4zrvsKdle3Y1G4u?=
 =?us-ascii?Q?wJ7Oi8T3aMxkmTOUbfC/2TLK8gbbD4oXgaF/InoXgR+orbU8/2V15PWsg/u8?=
 =?us-ascii?Q?pBlF7MAW5YfuYkPxXCQAlEx4nolsLVF24awzKRgSRxq4aOY84EAfih5clPdm?=
 =?us-ascii?Q?dLyVUwqwJCXJR+hM+lLvXuYXQuWrdFSV5Iu/PcsquFpAabKKodvHc6k5oUu4?=
 =?us-ascii?Q?4N9GUZbyb0xvyEtDwKYz5O+EkSDqavrACHOGBUB9nfo73XZDD5yJ14TDhWOs?=
 =?us-ascii?Q?ZyYhixyIymYnjkgpEpfifysD+7gUu9VAZam/1N6p5708h3dP/WXWFVT6jeup?=
 =?us-ascii?Q?12QvddCs29mfNfJoIEDkraWaxvz6XggXOespbtCopSuU2Z7n1ETOMvVNozw7?=
 =?us-ascii?Q?Z+VbLUrTqJ5cw7E73iS0YRbR3FhlB6GB9UhKsVaAQMpqsolwIAl6VkCo1APa?=
 =?us-ascii?Q?RTVYV9UkriEm+GH/Donj1A6CL0yxUQNyEfSnn3brD67huq/JoPwPQJfmDQzk?=
 =?us-ascii?Q?izBrCh/G0P6o68P+JgyTb0iIFnwF6eEV50SfkuwBpiGJx2ig6Oe4Y2d5mkqr?=
 =?us-ascii?Q?2VKGL2sTmZx/At+X8AEN5T5ewyaJP59PYdVCbgtgx+jerjDTkn88wi4lCPNn?=
 =?us-ascii?Q?UTd2sQTnopeeassyvM5Og4fzY1v+8+I63cfSPlMdOHCGXO4sFGUm1Kk92jd0?=
 =?us-ascii?Q?3jDbRrMXMjfQ7rEqdIEg5mOI+QSpqAAb3e0vywTI7UICxuGSZxyjd5Si7sO9?=
 =?us-ascii?Q?RKaZkX5RhRWMjlTjCXB3c8TZhPF7KOkMaX1XCTtd059nbT6WrWnVM+lpDsiM?=
 =?us-ascii?Q?ESaqii/OD4rsH0HVwRzx4i3KMTN6dkwZfC3zROadb0IGmEQciL0jo2/83xkn?=
 =?us-ascii?Q?sVIsGD0iJZRKn10JFy87Au5F8BbGYF+CXQJlQZojRTSNHjxugehO3UQs+21Z?=
 =?us-ascii?Q?H1AAQvXCKlh9ACzgFqOieiH3SFXOOgeqkG4BwuR+P8IzEM+T9RkqxVBo5y2j?=
 =?us-ascii?Q?9Hn/R3HhEl2fL26wo0oewV1W6Pv4mZeGFH9Om3W/RgomfOxlbu2beKel9Pk3?=
 =?us-ascii?Q?KeLPdga59kLgb3K/3mKe1tZxpP+IM9VVMZbV9EEMiHwwRsRJ4GUva/tf8AMT?=
 =?us-ascii?Q?nDxXg6JBv97kk/SehHzYCAZa3Rrt8jv+fZ8iuM3+xeCLxntKQdJ2KVzDkXVf?=
 =?us-ascii?Q?XV63OiLLcsk4XFEF4HzZUwtMknzTCBaJI1kwVDMVhFUqlTFx4ISWAyPojBv4?=
 =?us-ascii?Q?yQ9QNIbaT2WZlp9b/nOXLzDEhiMY0iurnB/6xVIAWbJLl4UwuOfAcdKfvyPa?=
 =?us-ascii?Q?kkFJKcBwHPG2o4etH5jPrECQ07Y/+YnFNvOv0gLgOfpdVS7cRilwz1Ffwtug?=
 =?us-ascii?Q?eaXOWe4hckiuYTy1xlFjCiHNa/ZDboSEutHlINFoyklwxgac3Qqx+3Kha+Xa?=
 =?us-ascii?Q?mM3dVVTE2yybQHlfu5Q=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB8697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6743ec13-9e08-445f-6d6a-08dd14e52f10
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2024 04:27:52.6127 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pwkf2wJIUlCk9AHyWtCqINsQ0Zo2lWn1U9s0URwftWz+FJBXpj97TlIinVOyf6AhMBNkQLdGEsmHtXysQon+6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5951
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

Hi,

> -----Original Message-----
> From: Jon Humphreys <j-humphreys@ti.com>
> Sent: Thursday, December 5, 2024 9:47 AM
> To: Marek Vasut <marek.vasut@mailbox.org>; Simek, Michal
> <michal.simek@amd.com>; u-boot@lists.denx.de; Tom Rini <trini@konsulko.com>
> Cc: Andre Przywara <andre.przywara@arm.com>; Ashok Reddy Soma
> <ashok.reddy.soma@amd.com>; Jagan Teki <jagan@amarulasolutions.com>;
> Michael Walle <mwalle@kernel.org>; Patrice Chotard
> <patrice.chotard@foss.st.com>; Patrick Delaunay <patrick.delaunay@foss.st.com>;
> Pratyush Yadav <p.yadav@ti.com>; Quentin Schulz <quentin.schulz@cherry.de>;
> Sean Anderson <seanga2@gmail.com>; Simon Glass <sjg@chromium.org>;
> Takahiro Kuwano <Takahiro.Kuwano@infineon.com>; Tudor Ambarus
> <tudor.ambarus@linaro.org>; Abbarapu, Venkatesh
> <venkatesh.abbarapu@amd.com>; uboot-stm32@st-md-mailman.stormreply.com
> Subject: Re: [PATCH 1/6] Revert "spi: zynq_qspi: Add parallel memories support in
> QSPI driver"
> 
> Jon Humphreys <j-humphreys@ti.com> writes:
> 
> > Marek Vasut <marek.vasut@mailbox.org> writes:
> >
> >> On 11/7/24 4:49 PM, Jon Humphreys wrote:
> >>> Marek Vasut <marek.vasut@mailbox.org> writes:
> >>>
> >>>> On 11/6/24 10:58 PM, Jon Humphreys wrote:
> >>>>> Marek Vasut <marek.vasut@mailbox.org> writes:
> >>>>>
> >>>>>> On 11/6/24 8:18 PM, Jon Humphreys wrote:
> >>>>>>> Marek Vasut <marek.vasut@mailbox.org> writes:
> >>>>>>>
> >>>>>>>> On 10/23/24 10:17 AM, Michal Simek wrote:
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> On 10/22/24 23:06, Marek Vasut wrote:
> >>>>>>>>>> This reverts commit 1e36d34b52e7a1ebe5a2a5339d6905540f4253aa.
> >>>>>>>>>>
> >>>>>>>>>> This parallel/stacked support breaks basic SPI NOR support,
> >>>>>>>>>> e.g. this no longer works:
> >>>>>>>>>>
> >>>>>>>>>> => sf probe && sf update 0x50000000 0 0x160000
> >>>>>>>>>> SF: Detected s25fs512s with page size 256 Bytes, erase size
> >>>>>>>>>> 256 KiB, total 64 MiB device 0 offset 0x0, size 0x160000 SPI
> >>>>>>>>>> flash failed in read step
> >>>>>>>>>
> >>>>>>>>> Reverting everything seems to me too much. Tom has tested it
> >>>>>>>>> on his HW and didn't see any issue. That's why better to look
> >>>>>>>>> at code which is causing this.
> >>>>>>>>> You are reverting everything but likely there is specific
> >>>>>>>>> patch which is causing this. Which one is it?
> >>>>>>>>> Which board was used for your testing? Likely we don't have access to
> it.
> >>>>>>>>> Is there any QEMU available which can be used for debugging?
> >>>>>>>>
> >>>>>>>> The testcase including the exact SPI NOR model is above.
> >>>>>>>>
> >>>>>>>> iMX6 with w25q16dw seems to be broken too.
> >>>>>>>>
> >>>>>>>> Basically every board I have access no longer has a working "sf
> >>>>>>>> probe ; sf update" combination ... so yeah, this means this
> >>>>>>>> patchset is fundamentally broken.
> >>>>>>>>
> >>>>>>>
> >>>>>>> I can also confirm that the patch series:
> >>>>>>>
> >>>>>>> f8efc68b30e Merge patch series "spi-nor: Add parallel and
> >>>>>>> stacked memories support"
> >>>>>>>
> >>>>>>> breaks SPI NOR on TI platforms, particularly SK-AM62 and SK-AM62P:
> >>>>>>>
> >>>>>>> U-Boot 2024.10-00752-gf8efc68b30e2 (Nov 06 2024 - 12:25:13
> >>>>>>> -0600)
> >>>>>>>
> >>>>>>> SoC:   AM62X SR1.0 HS-FS
> >>>>>>> Model: Texas Instruments AM625 SK ...
> >>>>>>> Hit any key to stop autoboot:  0 => sf probe && sf update
> >>>>>>> ${loadaddr} 0x400000 0x10
> >>>>>>> SF: Detected s28hs512t with page size 256 Bytes, erase size 256
> >>>>>>> KiB, total 64 MiB device 0 offset 0x400000, size 0x10 SPI flash
> >>>>>>> failed in read step =>
> >>>>>> Sigh ... can you please test current u-boot/master and see if the
> >>>>>> error is fixed there ?
> >>>>>>
> >>>>>
> >>>>> Yes I had verified it also fails against master, although the
> >>>>> behavior was a bit different.  The .'s below are our DMA engine waiting
> indefinitely.
> >>>>>
> >>>>> => sf probe && sf update ${loadaddr} 0x400000 0x10
> >>>>> SF: Detected s28hs512t with page size 256 Bytes, erase size 256
> >>>>> KiB, total 64 MiB device 0 offset 0x400000, size 0x10
> >>>>> .....................................................
> >>>>>
> >>>>> I have not investigated further.
> >>>>
> >>>> Can you try and run some 'git bisect' to find out exactly which
> >>>> commit broke your use case ? There is a bunch of fixes for the
> >>>> worst breakage that landed recently, but clearly there is more.
> >>>>
> >>>> Full revert seems increasingly appealing ...
> >>>
> >>> commit 5d40b3d384d
> >> So there is still something broken in that specific commit that I
> >> missed when removing the defects ? Sigh ... can you try to narrow it down ?
> >
> > Hi Marek, I tried to narrow the changes in commit
> > 5d40b3d384dc536ec26ce9b76b20b0b84749d2d1 a bit by first applying all
> > of the changes in the .h files, and then for spi-nor-core.c, only
> > applying changes per function. The only function change that causes
> > errors was spi_nor_read(). With the changes in spi_nor_read() in
> > commit
> > 5d40b3d384dc536ec26ce9b76b20b0b84749d2d1 applied to the prior commit
> > fbe16bc2801, did I get:
> >
> > => sf probe && sf update ${loadaddr} 0x400000 0x10
> > SF: Detected s28hs512t with page size 256 Bytes, erase size 256 KiB,
> > total 64 MiB device 0 offset 0x400000, size 0x10 SPI flash failed in
> > read step
> >
> 
> Hi all.  What is the status of addressing the failures introduced by this patchset?  I
> tried building from u-boot next and still see the failure.
> 
> Marek, was the isolation of changes I performed above helpful in understanding the
> failure?
> 

Can you try by applying this change https://lore.kernel.org/u-boot/20241118090544.21956-1-venkatesh.abbarapu@amd.com/

Thanks
Venkatesh
> Thanks
> Jon
> 
> > Let me know if this helps.
> >
> > Jon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
