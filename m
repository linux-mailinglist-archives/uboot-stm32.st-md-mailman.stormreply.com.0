Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 957E09AE527
	for <lists+uboot-stm32@lfdr.de>; Thu, 24 Oct 2024 14:40:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E5ABC78F75;
	Thu, 24 Oct 2024 12:40:31 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2046.outbound.protection.outlook.com [40.107.92.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5BC2CC5E2D2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2024 14:25:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=quvpVyY/3r10+kRflpufc9d4w4EqE1eurNcv0Yso8dY7QlQzBZ0ZvNs+Gdara3EP0quFyTgXWEpGMoFKRGdmFUNgvssgPykFnsboLX+1FxMmsBOgw/HelHupGM4/pjQd58ChElTTOjH2wSwc04RKZL40dMGeWKttaVy+Zrs1PjDNKuBV0QB2+qdK5d9nC/JfBtMl2MWQWlkCDamFgLkZwCiqWUU/3/v2W64oS7PaBF38czz4fH2TZn/rYQ7ZpO1sbSWKWOHoIzFtpbK1ooTN04yd9L2Gs2PbuRDpMjStwEZrOZWfEdTbZDdU9+0ynQMMgmRctbP9PBoDHC8kLCPGhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Cy7rduceYJ8k0wHGoBqjaQD6EX+njDPnlpcZTIVv68=;
 b=jYqMdVw5ykpu5fojTFpTTxX+Hnd4K+JW8vKsaIktIuHOcm9ARgd7b0Sx2OnL6/Vk8kagd7mkJl0oQOeVl/d7ZQ7raZPmbPaSaoBr7v4dFlHlkHnATNhkBtkJHkWdvotezP8+yE3CRec/J0nMOWlZUjuYLY3BQVLWgfKtM2Bum7Sc29ePXOgue7uUL78xVXfJWpnFdfne3RSmp5sdZ5zRpW8J9gztCyO6g8RnTVRgE4znNUjPQKrKTf6eiCA9rKIXfhyOAbYEdQkHE0xIqhC4CW7ZkHt/r7ycFMkZL2/tHkNGcgvzXk2o8x04TJEpRpdHSO25zHbb2K5DDNXuX9jddw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Cy7rduceYJ8k0wHGoBqjaQD6EX+njDPnlpcZTIVv68=;
 b=Cm3fXtlj3eVQRxF8YpCX4JnXHyuku3LkIPL98G4xjMzJXe8vl1kk/4keUW4dYABKDJKJBF1+SEjpPomTGyb/IvhrQh7HfMFsZEgN0Z6UrWzFadY9accocTR5tnb7H9iEREDj8ltdVYrPQ5qAWAlqiUmL/4wzlNEG2yOpwdob0F4=
Received: from SA1PR12MB8697.namprd12.prod.outlook.com (2603:10b6:806:385::10)
 by SJ2PR12MB7961.namprd12.prod.outlook.com (2603:10b6:a03:4c0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Wed, 23 Oct
 2024 14:25:25 +0000
Received: from SA1PR12MB8697.namprd12.prod.outlook.com
 ([fe80::dbf9:f1d1:7c67:f88c]) by SA1PR12MB8697.namprd12.prod.outlook.com
 ([fe80::dbf9:f1d1:7c67:f88c%6]) with mapi id 15.20.8069.031; Wed, 23 Oct 2024
 14:25:25 +0000
From: "Abbarapu, Venkatesh" <venkatesh.abbarapu@amd.com>
To: Marek Vasut <marek.vasut@mailbox.org>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 1/6] Revert "spi: zynq_qspi: Add parallel memories
 support in QSPI driver"
Thread-Index: AQHbJMZY/tA7en8DbUuS+Zl7COVM+rKTqicwgABbA4CAAAHK4IAAQkAAgAAX4vCAAAJngIAAAMPg
Date: Wed, 23 Oct 2024 14:25:25 +0000
Message-ID: <SA1PR12MB8697E723395F31AEFCD1C8F1984D2@SA1PR12MB8697.namprd12.prod.outlook.com>
References: <20241022210633.271534-1-marek.vasut+renesas@mailbox.org>
 <SA1PR12MB8697AF99B0A56734FF65AD47984D2@SA1PR12MB8697.namprd12.prod.outlook.com>
 <699f9d96-a109-40ab-9cd8-ed0c5b4b589f@mailbox.org>
 <SA1PR12MB869767A8D003AB114830D46A984D2@SA1PR12MB8697.namprd12.prod.outlook.com>
 <03389ee7-3da9-4160-a193-00fd517ad56e@mailbox.org>
 <SA1PR12MB869722D8E2019193343572AF984D2@SA1PR12MB8697.namprd12.prod.outlook.com>
 <a78899c6-aecf-4eaa-a9c9-8f11758542cd@mailbox.org>
In-Reply-To: <a78899c6-aecf-4eaa-a9c9-8f11758542cd@mailbox.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB8697:EE_|SJ2PR12MB7961:EE_
x-ms-office365-filtering-correlation-id: 263af117-0ae9-4932-b20e-08dcf36e8955
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?RU5qRHZ4bkFYd1pEQTNQU09JR2hZbWhlZHN6UzNZVnNTTUVaOXN4am5LT2ph?=
 =?utf-8?B?S1hvMUZYTGtOaGFtcWZFVmxzQjFJTGNMRDRPTU14UWxYOFlKdnlRcWFyOG5I?=
 =?utf-8?B?N1VKU3QyazlwaHhxalhJSGxiakF1QktsdTZ1UUwrWjVESmRySHNWT21wQy91?=
 =?utf-8?B?WjAzRXhXTHFDbHZJOWFDVTJ1RDlBc1NXQVhUMXdEeGxOUHQ3MXdTNVFvQ3dX?=
 =?utf-8?B?MXJhYVo3aW1jSStuc004MEpDTDJYUWx0QlE1MGZwVGZiYlp3YW5hRm5EeUZD?=
 =?utf-8?B?Vk95anVnN0JsZmZqVmJjcFN1T1FXK29SNENvaVlYL1d5eUlNTFFyRWQzMjRX?=
 =?utf-8?B?Rlp0eEtzV2ZpV1VMeU5VOTFOY2d2RURvVFZZVm01RStyelZOUGt5RUNTMTQz?=
 =?utf-8?B?SGRxYTZGYmdpQmw1VlNLc3NOWWxDeWJuM3hzQTlPSFpwTGZKY3RpbHpMQ1R4?=
 =?utf-8?B?bDFmZTF1TlBiMUdEZUtFbEt6T2dzT0d4aFhDUFFNKzFpWFhwZ0Fnd21PQXdo?=
 =?utf-8?B?clM0Z1loYVJqaWRCc1ZzNXpJWnd2RFkvaUhibCtId1BCdituQUxUT0xFUDVN?=
 =?utf-8?B?TDRYbHZGd1c4ZFpZaUZuWCs0Vm5lNzhxaVNIMTNKME1YWFhCcFJ1bW1RdFVO?=
 =?utf-8?B?bEpKTVQraGNmYWk2ck9pVDdmU2syc3RaRVB6NzZ1NSthVFZ6N3p3UXI1cXVi?=
 =?utf-8?B?YzQwY3JHczE3Q2hUN1pnMXhWdUhCRHhMQ3lieTBFZTIyY3orMUFvUUlzTUti?=
 =?utf-8?B?V2g0LzVyYytDWkV5OGdLU0dyRm5MMUpPS2F6b0dHN2VCZEphUFNXWWhiSk5E?=
 =?utf-8?B?elNIRzl1eE9MYTlGTXBIZGhOYjgxUXhRc3RySGttUkY4MFRlUzlzTzQyYk5W?=
 =?utf-8?B?bkEyK3c2YUFSOU9adTJwcVg1L21ZTDVHYndQaTlPUmRDSHJSWDdjaDcxMDht?=
 =?utf-8?B?OVJ1aWhsUHd1b3ZpODBNVlFMYnE3NWJDcy9mb1NxblZpYlozYXM1SGg0UEV5?=
 =?utf-8?B?TFZpcTdzdHVHTUpJVGlRckxGSjZHQjRjUy8vSlEzRDQwRnpCK1U4RFJEUi9V?=
 =?utf-8?B?dmQ3ZWlsOE9RVGVkZFVaR21OZGZvVmk1ZFVjV3ZwRnBJOHB3L3NQUWsvNHd0?=
 =?utf-8?B?eWhEWGNmMjdlb1dZZUdrYVhjcURqeGxZbFlJeU1wcU9MeDZScVFWY2FFdVhz?=
 =?utf-8?B?Tm5wNGdJMi9ITEFTMlJsVFJQbUR1eCtjQ2lzK0Z6Qk0wa1VHMllLNXRwcVlT?=
 =?utf-8?B?bGZtdzduZmx6akM2djA2RXowNmkvRmRCS2R4YXJCVTlLellJQlFvZGt3RUV5?=
 =?utf-8?B?S0VvRXZnd0l2a1BITHl5a3BXUHJoNDBRTTZQcFRBcnhzOWpZQnFhNW1acE5Z?=
 =?utf-8?B?NS92dzdwVGE4M09lTnovVm9hdTgxaGk0VlEwL0xpaExrNmR4bzNRT2FXZ2VG?=
 =?utf-8?B?ZWNKZlhoaGtRcUJ1a2U1Q2M0Tm03THBYQkU5ZlBmUC93eWdRaVdWZmtTTEVK?=
 =?utf-8?B?SlcrTGhCaDV3QldWSTBzS0I3RkJiOTA0cGlOMldmeE9ianIydzZ0NWozS2tC?=
 =?utf-8?B?ZmNHVVRCZDVFV05LemlVQ3pxbTBtMTRMZmFCSDJadFhGa0dMWmc3MGNqd3hS?=
 =?utf-8?B?ZFVwaEtZdjlnSXNDdGl1Vk03bWUyazFoYVNEN1Y0MmlTNHY1Z3cvRzQ4QkVn?=
 =?utf-8?B?dTQ1ZUJTQjJhTVhJVlJTYUxKTmhDUzc1UTFFWXlDdGVWMUUwOVhnSFJKdDhk?=
 =?utf-8?B?cFpMeXZ3SEdkMmlWVE96dERVZDcrRnZlejEwalUxb05aUUFDZUNnK2lDaUVj?=
 =?utf-8?B?V2EyNW95amxkNkRFR2loWGVQSUNxcVllTWo1RHZxUG9FZ2VEUzhUcS9LendT?=
 =?utf-8?Q?Y5z+rsUT23mTf?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB8697.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UGU3cjdKYWN0VmwwWE9JKytJWmhQRXNCUTdWN3phdWhHRkpsWUUxaXZZS1Bw?=
 =?utf-8?B?dEN1SU94WkIvNUsrVUxqaVBlY2RRTk53Y1dIdmlTOXYwek83ZGxZT25EbXJq?=
 =?utf-8?B?bThQZjRJL2lnLytTUjZROGZYejJ0bG1nNHJ2WkNnWXJiM3hMb3hGQi8zb1lx?=
 =?utf-8?B?ZGhxZm1sKzhna3hsY3F4WTF6czFlMDhGUjRoSzRacHhyR2VzdHl4MFRDeVE0?=
 =?utf-8?B?Z3R1KzNISWc3VTdZYzJSNWFSOUJiOVVPSkpKalpyR0VzY1dWWUZweWdRUFhO?=
 =?utf-8?B?RDRYTXVSdXBRZHl2WTBJa3IzYkttdis2UmVRU2MzZDA3b044YnQxZkUwMzVm?=
 =?utf-8?B?MEN1OUQvWnlUd0FCbFd0aDFaN3FEVFhDb3RkbkxEc29TMWVxUE9xaE1QUWFN?=
 =?utf-8?B?WlZvc2JwWkJ4VHBQelp6c002OTU2SC9PNjVKbnJhaGtXNVBkS2FORlpKdnBi?=
 =?utf-8?B?SDFmQ29KU1JiUklrU3MzTjNRK0FmRXFISEdFTTB3OWFXS2pVbDlqUzBwMlRF?=
 =?utf-8?B?TDF2TEsvTzNoOFVsSDNrclhLSUhQN0JhSzZtaFVQMElXSjhhWjFTQVZPSnlU?=
 =?utf-8?B?L1JKYzE4L0VVVGxYUTJVZTZ4cVpiUkMzR3BRZ3Y4QUFqSTNjUER0aHBwSGFi?=
 =?utf-8?B?cXBpa0pXa09iYlZUUkd6N3poaTI1WmZnZi95MVRGbjJ4eHJRcDhmMWp6Y1hp?=
 =?utf-8?B?Vitrc1dIa1A5VGkzN2JDLzlWZGJFdVlLSURsSTV3RkVEekgzK2FIaVRpdHhl?=
 =?utf-8?B?T2pxRGtuRW8xRDVrS2dKRVZEeUE5SHgya25WWmtSaDA3ZEd2VDRaNlVHYzdJ?=
 =?utf-8?B?VllsY2JkdnJ3Z21RSDJsQnpMTC9aZGY2MDkrVk5xVkwzWTdkeEh5R2dzenll?=
 =?utf-8?B?NjNzb0ZyUmRpRTRMVnhTRFl1UklPZ28rYjgvcm5ROGFYZEVnYTdtekYyWnVo?=
 =?utf-8?B?LzArbHdHUHBBZVdKOFJ6VHNBdW9RRGVwK3djdkJWN2ZUR21HYVVCczFma0Ur?=
 =?utf-8?B?QjJ0MmpWUnFpYzFkems5S2Z4NHMvRmMvT3MzbERNc3R1V1hNQi82WFR2ME0z?=
 =?utf-8?B?bE5YOHNJbXJuUmFWN0RvZjY5dk5jdVc2RWk0ZXJPOFFiSUg0ZFBnZEdRQ1p5?=
 =?utf-8?B?U2h6emdPNExmR2VzKzRZTWliMTc2MkhUYWw3UFY4M0dDUnEzc1Q0cVFWNWZt?=
 =?utf-8?B?RnIwY0s1WUZkT3huU1BTNDFzd3lLYmhqZ0gxQlJnVThXb3k5cjFhWkpRRlh0?=
 =?utf-8?B?d1BmUVZRanh6YlBUaThrSDd2b05uaDBQdEZtQ3BFSldIK2JWWWlqYnRjeFcz?=
 =?utf-8?B?TDR6by9ZenRtakpMMnVTcnhLbzR2Nk9EQ29aV3Z0ODNiM05UaFNYY1VnR09S?=
 =?utf-8?B?T1VSV1kvcmczRCtXeG9taXlDeVo3YXNiclFHcERxbEVKSDZ6d1dqMHJEeXpm?=
 =?utf-8?B?Q2Y0WTB0NlMzaHN4UEZVQkRWRkwzeXg0elVGeVF4SlJxTHphM0V2c1A5ZUR5?=
 =?utf-8?B?OWVQbVJzOXpCQzhjaEFUcnROdkpiVlNYSDhtSnNtVFBQMEFyb2JnYklCeWFm?=
 =?utf-8?B?T3RBTUNvZmJZSDRNQlBMeUxGZksxTU1LYnVrQTlKME1XVzZpeEMrSWdVQmto?=
 =?utf-8?B?bHVDZXUrVjdjaGEzSnI5eWZoM2NtaUFFVlE3cC9jM0NMYUpXWldGNWZhTkxt?=
 =?utf-8?B?UVoxMUdpL2lGSlZma1RNZ0ozd29jaWsyUGRDcy9EczhQN1laK3lKNmE1Rnpj?=
 =?utf-8?B?WHpKY1BqMm1UR3o1TzNlZGZuVG9hb0JIZFl4dE9sZUtDRWcrQU1GNkx6TEw0?=
 =?utf-8?B?aW9TdHV6SU9KT0ptMCt6Q1ZWY1JoOUxMVVZ3eE9jVlFMSFhVc3o3c2swd2Vs?=
 =?utf-8?B?OHNJeTRqZE1CVGxEaW15UmNQOG5qeWJ4ejl2cVNRUldhVHlZd1JDdnEzODBM?=
 =?utf-8?B?RUtIam9xRTNZOXJDb0xlSkUycWhWdjlmMFZYd0Qya3RWY3VNMnNRd0RxbE10?=
 =?utf-8?B?a25RRy9oZ1JVQmtXUTJYOWc4TUM3Nm5jVlhXVjJ1LzBYNXI2ZGZhcVkrQWs3?=
 =?utf-8?B?OU82MXpYdVJnSVBybU5hR2dPRzl6ZUxNOFVCeXhVeG12NmIyTHRTZXc5L1lj?=
 =?utf-8?Q?q8WA=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB8697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 263af117-0ae9-4932-b20e-08dcf36e8955
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2024 14:25:25.5736 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BOCJVdA355hN9BQDuukQKGR/XSaz/pjXLaZKoVAA/ZzFl0nMcSQzCCfdUQ8TsNqNzzoTbnUfne0yxY+i4+WVTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7961
X-Mailman-Approved-At: Thu, 24 Oct 2024 12:40:30 +0000
Cc: Tom Rini <trini@konsulko.com>, Michael Walle <mwalle@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>, Simon Glass <sjg@chromium.org>,
 Ashok Reddy Soma <ashok.reddy.soma@amd.com>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>, "Simek, Michal" <michal.simek@amd.com>,
 Pratyush Yadav <p.yadav@ti.com>,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFyZWsgVmFzdXQg
PG1hcmVrLnZhc3V0QG1haWxib3gub3JnPg0KPiBTZW50OiBXZWRuZXNkYXksIE9jdG9iZXIgMjMs
IDIwMjQgNzo0OSBQTQ0KPiBUbzogQWJiYXJhcHUsIFZlbmthdGVzaCA8dmVua2F0ZXNoLmFiYmFy
YXB1QGFtZC5jb20+OyB1LWJvb3RAbGlzdHMuZGVueC5kZQ0KPiBDYzogQW5kcmUgUHJ6eXdhcmEg
PGFuZHJlLnByenl3YXJhQGFybS5jb20+OyBBc2hvayBSZWRkeSBTb21hDQo+IDxhc2hvay5yZWRk
eS5zb21hQGFtZC5jb20+OyBKYWdhbiBUZWtpIDxqYWdhbkBhbWFydWxhc29sdXRpb25zLmNvbT47
DQo+IE1pY2hhZWwgV2FsbGUgPG13YWxsZUBrZXJuZWwub3JnPjsgU2ltZWssIE1pY2hhbCA8bWlj
aGFsLnNpbWVrQGFtZC5jb20+Ow0KPiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBm
b3NzLnN0LmNvbT47IFBhdHJpY2sgRGVsYXVuYXkNCj4gPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5z
dC5jb20+OyBQcmF0eXVzaCBZYWRhdiA8cC55YWRhdkB0aS5jb20+OyBRdWVudGluDQo+IFNjaHVs
eiA8cXVlbnRpbi5zY2h1bHpAY2hlcnJ5LmRlPjsgU2VhbiBBbmRlcnNvbiA8c2VhbmdhMkBnbWFp
bC5jb20+Ow0KPiBTaW1vbiBHbGFzcyA8c2pnQGNocm9taXVtLm9yZz47IFRha2FoaXJvIEt1d2Fu
bw0KPiA8VGFrYWhpcm8uS3V3YW5vQGluZmluZW9uLmNvbT47IFRvbSBSaW5pIDx0cmluaUBrb25z
dWxrby5jb20+OyBUdWRvcg0KPiBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+OyB1
Ym9vdC1zdG0zMkBzdC1tZC0NCj4gbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQ0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIDEvNl0gUmV2ZXJ0ICJzcGk6IHp5bnFfcXNwaTogQWRkIHBhcmFsbGVsIG1lbW9y
aWVzIHN1cHBvcnQgaW4NCj4gUVNQSSBkcml2ZXIiDQo+IA0KPiBPbiAxMC8yMy8yNCA0OjE0IFBN
LCBBYmJhcmFwdSwgVmVua2F0ZXNoIHdyb3RlOg0KPiA+IEhpLA0KPiA+DQo+ID4+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IE1hcmVrIFZhc3V0IDxtYXJlay52YXN1dEBt
YWlsYm94Lm9yZz4NCj4gPj4gU2VudDogV2VkbmVzZGF5LCBPY3RvYmVyIDIzLCAyMDI0IDY6MTUg
UE0NCj4gPj4gVG86IEFiYmFyYXB1LCBWZW5rYXRlc2ggPHZlbmthdGVzaC5hYmJhcmFwdUBhbWQu
Y29tPjsNCj4gPj4gdS1ib290QGxpc3RzLmRlbnguZGUNCj4gPj4gQ2M6IEFuZHJlIFByenl3YXJh
IDxhbmRyZS5wcnp5d2FyYUBhcm0uY29tPjsgQXNob2sgUmVkZHkgU29tYQ0KPiA+PiA8YXNob2su
cmVkZHkuc29tYUBhbWQuY29tPjsgSmFnYW4gVGVraSA8amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5j
b20+Ow0KPiA+PiBNaWNoYWVsIFdhbGxlIDxtd2FsbGVAa2VybmVsLm9yZz47IFNpbWVrLCBNaWNo
YWwNCj4gPj4gPG1pY2hhbC5zaW1la0BhbWQuY29tPjsgUGF0cmljZSBDaG90YXJkDQo+ID4+IDxw
YXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+OyBQYXRyaWNrIERlbGF1bmF5DQo+ID4+IDxwYXRy
aWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPjsgUHJhdHl1c2ggWWFkYXYgPHAueWFkYXZAdGkuY29t
PjsNCj4gPj4gUXVlbnRpbiBTY2h1bHogPHF1ZW50aW4uc2NodWx6QGNoZXJyeS5kZT47IFNlYW4g
QW5kZXJzb24NCj4gPj4gPHNlYW5nYTJAZ21haWwuY29tPjsgU2ltb24gR2xhc3MgPHNqZ0BjaHJv
bWl1bS5vcmc+OyBUYWthaGlybyBLdXdhbm8NCj4gPj4gPFRha2FoaXJvLkt1d2Fub0BpbmZpbmVv
bi5jb20+OyBUb20gUmluaSA8dHJpbmlAa29uc3Vsa28uY29tPjsgVHVkb3INCj4gPj4gQW1iYXJ1
cyA8dHVkb3IuYW1iYXJ1c0BsaW5hcm8ub3JnPjsgdWJvb3Qtc3RtMzJAc3QtbWQtDQo+ID4+IG1h
aWxtYW4uc3Rvcm1yZXBseS5jb20NCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzZdIFJldmVy
dCAic3BpOiB6eW5xX3FzcGk6IEFkZCBwYXJhbGxlbA0KPiA+PiBtZW1vcmllcyBzdXBwb3J0IGlu
IFFTUEkgZHJpdmVyIg0KPiA+Pg0KPiA+PiBPbiAxMC8yMy8yNCAxMTowNyBBTSwgQWJiYXJhcHUs
IFZlbmthdGVzaCB3cm90ZToNCj4gPj4+IEhpLA0KPiA+Pj4gVGVzdGVkIHdpdGggdGhlIG5vbi1z
dGFja2VkIGRlZmF1bHQgc2luZ2xlIGNvbmZpZ3VyYXRpb24gb24gWnlucU1QDQo+ID4+PiB6Y3Ux
MDIgYm9hcmQNCj4gPj4gYW5kIGRpZG7igJl0IHNlZSBhbnkgaXNzdWUuDQo+ID4+Pg0KPiA+Pj4g
WnlucU1QPiBzZiBwcm9iZSAwIDAgMA0KPiA+Pj4gU0Y6IERldGVjdGVkIG10MjVxdTUxMmEgd2l0
aCBwYWdlIHNpemUgMjU2IEJ5dGVzLCBlcmFzZSBzaXplIDY0IEtpQiwNCj4gPj4+IHRvdGFsIDY0
IE1pQg0KPiA+Pj4gWnlucU1QPiBzZiBlcmFzZSAweDAgMHg0MDAwMDAwO213LmIgMHg4MDAwIGFh
YmJjY2RkIDB4NDAwMDAwMDtzZg0KPiA+Pj4gWnlucU1QPiB3cml0ZQ0KPiA+Pj4gWnlucU1QPiAw
eDgwMDAgMHgwIDB4NDAwMDAwMDttdy5iIDB4ODAwODAwMCAweDAgMHg0MDAwMDAwO3NmIHJlYWQN
Cj4gPj4+IFp5bnFNUD4gMHg4MDA4MDAwIDB4MCAweDQwMDAwMDA7Y21wLmIgMHg4MDAwIDB4ODAw
ODAwMCAweDQwMDAwMDANCj4gPj4+IFNGOiA2NzEwODg2NCBieXRlcyBAIDB4MCBFcmFzZWQ6IE9L
DQo+ID4+PiBkZXZpY2UgMCB3aG9sZSBjaGlwDQo+ID4+PiBTRjogNjcxMDg4NjQgYnl0ZXMgQCAw
eDAgV3JpdHRlbjogT0sgZGV2aWNlIDAgd2hvbGUgY2hpcA0KPiA+Pj4gU0Y6IDY3MTA4ODY0IGJ5
dGVzIEAgMHgwIFJlYWQ6IE9LDQo+ID4+PiBUb3RhbCBvZiA2NzEwODg2NCBieXRlKHMpIHdlcmUg
dGhlIHNhbWUNCj4gPj4+DQo+ID4+PiBUaGFua3MNCj4gPj4+IFZlbmthdGVzaA0KPiA+Pj4NCj4g
Pj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+Pj4+IEZyb206IE1hcmVrIFZhc3V0
IDxtYXJlay52YXN1dEBtYWlsYm94Lm9yZz4NCj4gPj4+PiBTZW50OiBXZWRuZXNkYXksIE9jdG9i
ZXIgMjMsIDIwMjQgMjoxMiBQTQ0KPiA+Pj4+IFRvOiBBYmJhcmFwdSwgVmVua2F0ZXNoIDx2ZW5r
YXRlc2guYWJiYXJhcHVAYW1kLmNvbT47IE1hcmVrIFZhc3V0DQo+ID4+Pj4gPG1hcmVrLnZhc3V0
K3JlbmVzYXNAbWFpbGJveC5vcmc+OyB1LWJvb3RAbGlzdHMuZGVueC5kZQ0KPiA+Pj4+IENjOiBB
bmRyZSBQcnp5d2FyYSA8YW5kcmUucHJ6eXdhcmFAYXJtLmNvbT47IEFzaG9rIFJlZGR5IFNvbWEN
Cj4gPj4+PiA8YXNob2sucmVkZHkuc29tYUBhbWQuY29tPjsgSmFnYW4gVGVraQ0KPiA+Pj4+IDxq
YWdhbkBhbWFydWxhc29sdXRpb25zLmNvbT47IE1pY2hhZWwgV2FsbGUgPG13YWxsZUBrZXJuZWwu
b3JnPjsNCj4gPj4+PiBTaW1laywgTWljaGFsIDxtaWNoYWwuc2ltZWtAYW1kLmNvbT47IFBhdHJp
Y2UgQ2hvdGFyZA0KPiA+Pj4+IDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+OyBQYXRyaWNr
IERlbGF1bmF5DQo+ID4+Pj4gPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+OyBQcmF0eXVz
aCBZYWRhdiA8cC55YWRhdkB0aS5jb20+Ow0KPiA+Pj4+IFF1ZW50aW4gU2NodWx6IDxxdWVudGlu
LnNjaHVsekBjaGVycnkuZGU+OyBTZWFuIEFuZGVyc29uDQo+ID4+Pj4gPHNlYW5nYTJAZ21haWwu
Y29tPjsgU2ltb24gR2xhc3MgPHNqZ0BjaHJvbWl1bS5vcmc+OyBUYWthaGlybw0KPiA+Pj4+IEt1
d2FubyA8VGFrYWhpcm8uS3V3YW5vQGluZmluZW9uLmNvbT47IFRvbSBSaW5pDQo+ID4+Pj4gPHRy
aW5pQGtvbnN1bGtvLmNvbT47IFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNAbGluYXJvLm9y
Zz47DQo+ID4+Pj4gdWJvb3Qtc3RtMzJAc3QtbWQtIG1haWxtYW4uc3Rvcm1yZXBseS5jb20NCj4g
Pj4+PiBTdWJqZWN0OiBSZTogW1BBVENIIDEvNl0gUmV2ZXJ0ICJzcGk6IHp5bnFfcXNwaTogQWRk
IHBhcmFsbGVsDQo+ID4+Pj4gbWVtb3JpZXMgc3VwcG9ydCBpbiBRU1BJIGRyaXZlciINCj4gPj4+
Pg0KPiA+Pj4+IE9uIDEwLzIzLzI0IDU6MTggQU0sIEFiYmFyYXB1LCBWZW5rYXRlc2ggd3JvdGU6
DQo+ID4+Pj4+IEhpIE1hcmVrLA0KPiA+Pj4+PiBUaGVyZSB3YXMgc29tZSBpc3N1ZSBhbmQgZml4
IGlzIHNlbnQNCj4gPj4+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvdS1ib290LzIwMjQxMDE4
MDgyNjQ0LjIyNDk1LTEtdmVua2F0ZXNoLmFiDQo+ID4+Pj4+IGJhDQo+ID4+Pj4+IHJhDQo+ID4+
Pj4+IHB1QGFtZC5jb20vVC8jdQ0KPiA+Pj4+DQo+ID4+Pj4gSXMgdGhpcyBvbmUgZml4IG9yIHRo
cmVlIGZpeGVzIGZvciB0aHJlZSBkaWZmZXJlbnQgaXNzdWVzID8NCj4gPj4+Pg0KPiA+Pj4+IFRo
aXMgc2VlbXMgdG8gZml4IFJFQUQgZXJyb3JzLCB3aGljaCBpcyBhcHBhcmVudGx5IGFub3RoZXIg
ZXJyb3INCj4gPj4+PiBpbnRyb2R1Y2VkIGJ5IHRoaXMgc3R1ZmYuIEluIG15IGNhc2UsIHBsYWlu
IGFuZCBzaW1wbHkgJ3NmIHByb2JlIDsNCj4gPj4+PiBzZiB1cGRhdGUnIGNvbWJpbmF0aW9uIHdp
dGggc2luZ2xlIG5vbi0gc3RhY2tlZCBTUEkgTk9SIGRvZXMgbm90DQo+ID4+Pj4gd29yay4gV2Fz
IHN1Y2gNCj4gPj4gYSBzaW1wbGUgY29uZmlndXJhdGlvbiBldmVyIHRlc3RlZCA/DQo+ID4+Pj4N
Cj4gPj4+Pj4gTm90IHN1cmUgd2UgbmVlZCB0byByZXZlcnQgd2hvbGUgcGFyYWxsZWwvc3RhY2tl
ZCBzdXBwb3J0Pw0KPiA+Pj4+IFBsZWFzZSBzdG9wIHRvcC1wb3N0aW5nLg0KPiA+Pg0KPiA+PiBZ
b3UgcmFuIGNvbXBsZXRlbHkgZGlmZmVyZW50IHRlc3Qgb24gY29tcGxldGVseSBkaWZmZXJlbnQg
Y2hpcC4NCj4gPj4NCj4gPj4gU3RvcCB0b3AgcG9zdGluZy4NCj4gPg0KPiA+IFNvcnJ5IGZvciB0
b3AgcG9zdGluZw0KPiA+DQo+ID4gV2lsbCB0cnkgdG8gZ2V0IHRoZSBzcGFuc2lvbiBmbGFzaCBw
YXJ0IGFuZCB0cnkgdGhlIGJlbG93IHRlc3RzLg0KPiA+IEF0IHRoaXMgcG9pbnQgdHJpZWQgdGVz
dGluZyBvbiBkaWZmZXJlbnQgYm9hcmQgd2l0aCBkaWZmZXJlbnQgZmxhc2ggcGFydC4NCj4gPg0K
PiA+IFp5bnE+IHNmIHByb2JlIDAgMCAwDQo+ID4gU0Y6IERldGVjdGVkIG14NjZsMWc0NWcgd2l0
aCBwYWdlIHNpemUgMjU2IEJ5dGVzLCBlcmFzZSBzaXplIDY0IEtpQiwNCj4gPiB0b3RhbCAxMjgg
TWlCDQo+ID4gWnlucT4gc2YgdXBkYXRlIDB4NDAwMDAwMCAwIDB4MTYwMDAwDQo+ID4gZGV2aWNl
IDAgb2Zmc2V0IDB4MCwgc2l6ZSAweDE2MDAwMA0KPiA+IDE0NDE3OTIgYnl0ZXMgd3JpdHRlbiwg
MCBieXRlcyBza2lwcGVkIGluIDUuNzM1cywgc3BlZWQgMjU3NDM1IEIvcw0KPiA+DQo+ID4gWnlu
cT4gc2YgZXJhc2UgMHgwIDB4NDAwMDAwMDttdy5iIDB4ODAwMCBhYWJiY2NkZCAweDQwMDAwMDA7
c2Ygd3JpdGUNCj4gPiBaeW5xPiAweDgwMDAgMHgwIDB4NDAwMDAwMDttdy5iIDB4ODAwODAwMCAw
eDAgMHg0MDAwMDAwO3NmIHJlYWQNCj4gPiBaeW5xPiAweDgwMDgwMDAgMHgwIDB4NDAwMDAwMDtj
bXAuYiAweDgwMDAgMHg4MDA4MDAwIDB4NDAwMDAwMA0KPiA+IFNGOiA2NzEwODg2NCBieXRlcyBA
IDB4MCBFcmFzZWQ6IE9LDQo+ID4gZGV2aWNlIDAgb2Zmc2V0IDB4MCwgc2l6ZSAweDQwMDAwMDAN
Cj4gPiBTRjogNjcxMDg4NjQgYnl0ZXMgQCAweDAgV3JpdHRlbjogT0sNCj4gPiBkZXZpY2UgMCBv
ZmZzZXQgMHgwLCBzaXplIDB4NDAwMDAwMA0KPiA+IFNGOiA2NzEwODg2NCBieXRlcyBAIDB4MCBS
ZWFkOiBPSw0KPiA+IFRvdGFsIG9mIDY3MTA4ODY0IGJ5dGUocykgd2VyZSB0aGUgc2FtZQ0KPiBD
b21taXQgbWVzc2FnZSByZWFkczoNCj4gDQo+ICINCj4gdGhpcyBubyBsb25nZXIgd29ya3M6DQo+
IA0KPiA9PiBzZiBwcm9iZSAmJiBzZiB1cGRhdGUgMHg1MDAwMDAwMCAwIDB4MTYwMDAwDQo+IFNG
OiBEZXRlY3RlZCBzMjVmczUxMnMgd2l0aCBwYWdlIHNpemUgMjU2IEJ5dGVzLCBlcmFzZSBzaXpl
IDI1NiBLaUIsIHRvdGFsIDY0IE1pQg0KPiBkZXZpY2UgMCBvZmZzZXQgMHgwLCBzaXplIDB4MTYw
MDAwIFNQSSBmbGFzaCBmYWlsZWQgaW4gcmVhZCBzdGVwICINCj4gDQo+IFlvdSByYW4gY29tcGxl
dGVseSBkaWZmZXJlbnQgdGVzdCBvbiBjb21wbGV0ZWx5IGRpZmZlcmVudCBjaGlwLg0KPiANCj4g
VGhlIHRlc3QgaXMgInNmIHByb2JlICYmIHNmIHVwZGF0ZSAweDUwMDAwMDAwIDAgMHgxNjAwMDAi
ICwgZGlkIHlvdSBldmVyIHRlc3QgInNmDQo+IHVwZGF0ZSIgPw0KDQpUcmllZCB0aGUgdGVzdCAi
IHNmIHByb2JlICYmIHNmIHVwZGF0ZSAweDQwMDAwMDAgMCAweDE2MDAwMCIgDQoNClp5bnE+IHNm
IHByb2JlICYmIHNmIHVwZGF0ZSAweDQwMDAwMDAgMCAweDE2MDAwMA0KU0Y6IERldGVjdGVkIG14
NjZsMWc0NWcgd2l0aCBwYWdlIHNpemUgMjU2IEJ5dGVzLCBlcmFzZSBzaXplIDY0IEtpQiwgdG90
YWwgMTI4IE1pQg0KZGV2aWNlIDAgb2Zmc2V0IDB4MCwgc2l6ZSAweDE2MDAwMA0KMCBieXRlcyB3
cml0dGVuLCAxNDQxNzkyIGJ5dGVzIHNraXBwZWQgaW4gMC4xNTRzLCBzcGVlZCA5NTg2OTgwIEIv
cw0KWnlucT4NCg0KDQpUaGFua3MNClZlbmthdGVzaA0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
