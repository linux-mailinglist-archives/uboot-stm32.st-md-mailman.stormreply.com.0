Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 876769AE524
	for <lists+uboot-stm32@lfdr.de>; Thu, 24 Oct 2024 14:40:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35104C78F73;
	Thu, 24 Oct 2024 12:40:31 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061.outbound.protection.outlook.com [40.107.92.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD263C5E2D2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2024 14:14:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mBeWBwUcSiQMFIGey2CGWibef44JzzeUHpfEo/U5brpr7ibR8aLKudS5uItVFP0mxtD5QgOWRrZXgWKadwjHDhm1kMXoNorawM3KWky/nfaMUp8R3D4wtMkm2psO6eLU2URg3ncjPaQ0wykQYZbOarA8Sb8tXq5mYB4djSHN3eX9v1O6Crdg+Hp2Avhz2z541dB5qmlPXg9sk81ZDAtaJyu12/0UeMppZe9/b8lOnpFrhHEIr/y1yIcHWxMGp20ZSVnr5TPc+qRpcUIGQgmiQpi3BaB+RRmuerSksZaldPGgY+shBCGlQUb4Ql0he0gQmX97YR4CfMDXzAlW3oDzXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3RjCXuAyuolAnPGWvs0s63s/KmPodP9+0CSrMmBMKXQ=;
 b=d0wA6uAM4AotaO4RHzAef//s6xnNSwXOxfiFRE6GJ75qEGv//uiKREVstp+KXKcsLBWOhLRYrGQ4x904C1zFF2dcsU9AF+VSL2rk0jPrhcp7taR2AkdcgmE27VaC4ax31S5tGp5jPZk2rqOOy/9rWCfWSV7y/KOLNVQeQQ1XbMKViLmfd8J0Ts+yMVH7kv2HV3DPIHgqlFdsxC+sCS9LyS8L+19qDR6Z3gwQuAUsCxQAEqYPent7PQO6B1S1+18WlP+QXLI8y8dw3tN6Jd4O76OaqVvyDtEjWs1AOOXHD5xSJS5hRK5xR7eChrStFP2UnF3LrA1b7CpkiPpI2qGhGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3RjCXuAyuolAnPGWvs0s63s/KmPodP9+0CSrMmBMKXQ=;
 b=M6qGKSoSEKL5RQayqbcaVECdHWhTHQhDoKFbKiHTkDrv/lE4l0lViYmiCQarixgB/HG0K8jO5ETETkJDPXQfErotBOdLS0puNAEacU87g0taFnLnln4iKbRWNdphE3KxhN3dBtPe+/iKHJz8UewWceSuxloHURtjuAAtZI1uF9k=
Received: from SA1PR12MB8697.namprd12.prod.outlook.com (2603:10b6:806:385::10)
 by PH8PR12MB7302.namprd12.prod.outlook.com (2603:10b6:510:221::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Wed, 23 Oct
 2024 14:14:38 +0000
Received: from SA1PR12MB8697.namprd12.prod.outlook.com
 ([fe80::dbf9:f1d1:7c67:f88c]) by SA1PR12MB8697.namprd12.prod.outlook.com
 ([fe80::dbf9:f1d1:7c67:f88c%6]) with mapi id 15.20.8069.031; Wed, 23 Oct 2024
 14:14:38 +0000
From: "Abbarapu, Venkatesh" <venkatesh.abbarapu@amd.com>
To: Marek Vasut <marek.vasut@mailbox.org>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 1/6] Revert "spi: zynq_qspi: Add parallel memories
 support in QSPI driver"
Thread-Index: AQHbJMZY/tA7en8DbUuS+Zl7COVM+rKTqicwgABbA4CAAAHK4IAAQkAAgAAX4vA=
Date: Wed, 23 Oct 2024 14:14:38 +0000
Message-ID: <SA1PR12MB869722D8E2019193343572AF984D2@SA1PR12MB8697.namprd12.prod.outlook.com>
References: <20241022210633.271534-1-marek.vasut+renesas@mailbox.org>
 <SA1PR12MB8697AF99B0A56734FF65AD47984D2@SA1PR12MB8697.namprd12.prod.outlook.com>
 <699f9d96-a109-40ab-9cd8-ed0c5b4b589f@mailbox.org>
 <SA1PR12MB869767A8D003AB114830D46A984D2@SA1PR12MB8697.namprd12.prod.outlook.com>
 <03389ee7-3da9-4160-a193-00fd517ad56e@mailbox.org>
In-Reply-To: <03389ee7-3da9-4160-a193-00fd517ad56e@mailbox.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB8697:EE_|PH8PR12MB7302:EE_
x-ms-office365-filtering-correlation-id: c4b15f35-a13d-4d6f-bd2b-08dcf36d0776
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?RHpDMENjMUZpMldVUmVETWJWS0Q3d0wxZ1RSLytRTEp6RlpUUWtGcnFYMW1W?=
 =?utf-8?B?SUNQeEQ2WWxkdjYycGdXQU1OV29WeFpMY2Radi82WExtN25DUFZGaTREeEFE?=
 =?utf-8?B?dVo0U0ZEV2JFZmxiOHZ0YW1oRVZzd0Fua0UrNFJMTDdkQ0VIM3g5RTQyU1Vn?=
 =?utf-8?B?YkhuNjd1ZkptTk1SZElZTEo3ejBmL1RDaWE4NVMrbGV2RlNFTXdmZ1dxaFN0?=
 =?utf-8?B?aDZHeFpBMDdUNldDcnpKSDMvL2ZUS2p3QTlIZmFqdGVHYlB5bVhydTdiTThR?=
 =?utf-8?B?ZkZFeEVHR1FMMEN2MFMwRjRQUS91alZKdzhwL1hLK0lVNHZpMlRjdkdLK21w?=
 =?utf-8?B?UitwUkJSckRQaGd6Z3VNNXZralZYTVBNQmxkb3ZlTWFQY29yanFzSWVkVFpP?=
 =?utf-8?B?dWxjamtDSHRCWUFJYnBwbUtHUTJCa2JXSzVnM0hYNmxSbUVwcFhlbHBwc1ZL?=
 =?utf-8?B?RXZZSmVlOVp5RW1yREdjSlloTElXSWdrUHI3UzJ2NFhqVWNQbXp5NnNoKy9F?=
 =?utf-8?B?RkRYdlJNbWJEQ0R1TGt5NlNQcnlRMzNxZ3JHUW1QV0lnZkE5bTdDYlZvcUN1?=
 =?utf-8?B?dlZrN2ZKaVhVYVdyQ3dJYSszYUo2aG1YQjJ4c1ZNM3lHaVF4ZzJyUXF2TzRz?=
 =?utf-8?B?ZXFJbU5sclVzd1RBQWhVc05iTnI2WnkreW9NMnFWandVSm1IQ2I4Q1ZzZ0Mw?=
 =?utf-8?B?elFlajZrNmhidlNPd3grTjBiNXBWbUhPTWJNY2pHbndkZ2hFRXBBTjlDc3JO?=
 =?utf-8?B?ejA4Nk1TYXQyMlRmZE9ML1Jubnd6ejZhWUV4ekVMd3owUXN1bmlnSmt5aVd3?=
 =?utf-8?B?ZUhsR2RNcGxrQ3ZFQmp1WGM1dE9WNzhYazRmSU50eU1Fek1oUUZKM0RHNVVB?=
 =?utf-8?B?RVhISDJnRjRpcjc5c1QwM1hDc29ZUlk2REdhaGU0VzZ4SkdqRG84c0QxSmEz?=
 =?utf-8?B?eksrT3RXdytsejJYdFdNVXF0bEQ3Z1M1M3pGUUs1R0IrbnBSM1VJTE12YXdl?=
 =?utf-8?B?ak9BY1d2VUE5ZHFMMmZsUEI5Y0plNzd1M3FsWnl4aTkxcUgvbmlZYkFndVBm?=
 =?utf-8?B?TCsyL2gvTHFnWnBPMnV4YTdaMmxDclBhYzVWT3lDK1VSTGkxZjRLUU5Oa1hh?=
 =?utf-8?B?Q1BRZTdyLzNBc293WERNUm5OQlRWVUlCcjhUOE5nc255V0pSRlBzNldSMHRV?=
 =?utf-8?B?dGp3MG5KS21EdE1rdkdiSmNrL1hucFowU3J4enVSeTBvV3dpOWZvMktvR3lo?=
 =?utf-8?B?c3R2ZVpISFJsT2ZxamZRQk1URlY4cmkrZFBzUFh3MElaalYwQzllbnpRQkJ4?=
 =?utf-8?B?YlhhT0lwa3g3WGNDZlkyOU5uUjIyci9ydFNEY1I1L0V4QjI5SUFCOVIxR2ZE?=
 =?utf-8?B?Vmp6R2g4M2FMeWJka3pKRHI5bTFqSlRGUDVYckYveW1xSlpOVlFLeEREOEVL?=
 =?utf-8?B?NlRzVGFIaFZ0RVErellNOXFGRGVRVlNWblBBRmVxMlMzdXJEbXk1Z1hPS01r?=
 =?utf-8?B?Z0F6K0xUNHRFc0JoRGxyVVFCdFlMMWwybUYxUWhoVGo0dzc5ajZ1b3YyckdZ?=
 =?utf-8?B?MzVubkdQSkVKSjlGK3BFaWh2VFBwSU9xRFVLWWg1eURSSnpKUVUyMXE4V0Vs?=
 =?utf-8?B?SG5IUXVTcHFoL0M2M1RNNjMvMGtVUldTaTZrajhXOVU1bTkzcjBISFFJT2pn?=
 =?utf-8?B?dnphaWc3K01mL0ZLR0haeU9WMjNaN0VVM2tNUkk1QVdyVGxMb3pBcDA4Qjdn?=
 =?utf-8?B?enh5QlFoSUdKQ2JVbk9MbmVMUzdqT2F2WDQzUW9mWEp1WGxUajd1M2JtRk1M?=
 =?utf-8?B?dGNyRVhLZStVM0x0Y3c2N0xmYWkzNmorQkRiall5c04vWEY2NzZhTG9NWGh1?=
 =?utf-8?Q?+UR7YAG7zIAwR?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB8697.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?djJmR3NQTDRxaU9MTWtFYytIV2s5UGlySFBmbjU2NUMxckRNYkpRT21jQWU4?=
 =?utf-8?B?ZFdUMG9yU2IvWkllRE95VTZqOFYxWG5aYnllQy95cmpEOFFoQXlsSjhDckpw?=
 =?utf-8?B?aE9rRVVBSVNPQW9maERORHczdFRiUmc3UHcrVWZPYS9NYlcvYkhnbkJ3Y25t?=
 =?utf-8?B?ZHNrVmhuVXpIRVdrd09FNTM0MFA3L2xLeElpOENpakxWYkhFMVI5dkRLV09h?=
 =?utf-8?B?aWRMd2ZxdHoxK2tFeklScnc4cUNHWGxhSnlrNVljZ1hKQ01mcjZnWm5oeW9Z?=
 =?utf-8?B?OS9MZndyQ1NFQmVWb3B0Wk5RR2xuVW55dCs0MkovVDJTYTVyTWJlaFhId3c4?=
 =?utf-8?B?ZnhZM0svMldCOGY0YkZIYStCRWtDamxpUnFmaHFtRGVMdmthR0FUQkZQOEh6?=
 =?utf-8?B?aTF0TVRUaklWbUQ3MzBxS1dtRnhhdXpGbFdneDNFR3hnWnIxbHovcGtOcTll?=
 =?utf-8?B?VVNjM09YYmsxQko4dk9Zb2tmYUZPYno3bGgwMHcrRElWdE1pK2lrOUFhbk9U?=
 =?utf-8?B?WEVCM3MwM1IzWDJ4dFBDOEhaK2o3NGpWYWlnby9CL1hQSDVhRHp6MmZqRTVH?=
 =?utf-8?B?RmRYZFlCb2VFSWJJR3NiakVuK1JUcGlqUVJ2WjJnZXhvTmlnQUd3KzRIZkxS?=
 =?utf-8?B?ZlZrZEsyb0xXSXREcVlCT3pBaTdRdVRIZ2E4OVNHclBlYi9jSi84cFZkNGJG?=
 =?utf-8?B?cDdZUnZmUlQvQmI3eFRNZWd6cWpRd3ljQzVGNEZqdXc1N1dFWVJ6NzBzWFFl?=
 =?utf-8?B?RnZHUnpGVVFTME9zcVZ0clU2UHlEVWU3MXBwK2hPVjh6SUdxM1FZYTQwdS9w?=
 =?utf-8?B?bWcwSkZZc091dUZzeEcxRWpSd1k4bTlEUHZJZUZrTXAwNW9YQUkrQVp2bEVR?=
 =?utf-8?B?QmoxbDBROVdTdXRFS1FUdzRFT2NKckZMS1NtMWczMW1PVitUWVVNRUtwUlp0?=
 =?utf-8?B?SzlydTkzT000MXlJWmoycnUyQjZ6eFpiU3A3L28rMys1T3BmL2NScjBYeVN0?=
 =?utf-8?B?TEhHMnBGYzBJeXhPcnNVTGhGeXRRRytFcGo5bGE1ZFdMYUkvdHV6L1BtTmI3?=
 =?utf-8?B?U1BJVzRNa0dwRE9TazFqdFl4S3FUSlVxN1FaSnVLSWJhaWIwQjl0Rmx5bGhx?=
 =?utf-8?B?VHBJK0R0OFc2WWYxY3RqQjhjU2YyYmlmNnBNWnp4ODRqYWtDT3ZqSTFHYlp6?=
 =?utf-8?B?Q2tIQWdTa0ZBT0huVHlUWkhwZkpmL3h1enZMMC9kTkJSSFNjOEVxUHpRcDdN?=
 =?utf-8?B?SFRkYStKNUQvZTQvYzExYjVldytuOUhLRmRQZlkwOXJhTStwdDlQdG5INUwy?=
 =?utf-8?B?RDBWZktvM2VPbGxwRG5sR3JFRXRTZnhVYmttTzNrb2FMV2xnemFuNUUrRUcy?=
 =?utf-8?B?WFRCd05ndlFVdkRqeEgzenlXYnRQSHJ4SkRUK2p3SkZlT3JHUWk1L1pGRVBt?=
 =?utf-8?B?b3FHU2NOTG9FTHhxQlF0WmU5V1RIN0xDVzRFVGxvU0RlQUlsdVVKa2F3VEw0?=
 =?utf-8?B?bjlZem1BQUI4dDVBbEVKKzhPUFRGa3AvMm94K3BxY1l2bzcwcXh4Y0pxWTJ5?=
 =?utf-8?B?S0JtQUZnYVRsVkNOb21veHZIRCt2QUViWVJaUEhxOTFtZmlzcWFlOGE2NHhJ?=
 =?utf-8?B?VUJMd2JpLzRtem5qZUt2ZjBYOUNpcXFzK3ZVR01TbWVYZkhDSWptLzdnZERj?=
 =?utf-8?B?Sk9WWEc3L1M2dU5melArSEl5bjZ5N3g1OUhpWlJ5WFpQcHVtMFNmejNXVHEz?=
 =?utf-8?B?dXI1R3I5cFgzb0lrUDc5RkZZeFhmQ251bXJVazc0WWxNWDcrSk1BT0xCTEN5?=
 =?utf-8?B?Tk9iREFVNldzWlpmTEVJZmlYS2FrZHg5Vjc5THFvRDNxamNwRm8zRXVtQ2pE?=
 =?utf-8?B?SEJ3dzRxNFkxT1A4SDQ4Y3BIZk1LTXp0TTFVcDJ6bVlQeXp2Z0RMd1M4MWFU?=
 =?utf-8?B?R1VvdGNyZWdDRzBqbFBBT3V2QzJJVXFyYVJNeWQzclppOVgyOG5pUDJhRnhy?=
 =?utf-8?B?Q2MzbTZOS21kKyt3dCtXUkpVN05VUGVkdnBtMzBrYU9lREFxUHVLZmJ6V0hR?=
 =?utf-8?B?RjNEeGhZYkhpdW1TUGVFQi9mdlNsem41QW5UMmRZbDg5eUlwTkY2NkorQ09h?=
 =?utf-8?Q?nWEo=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB8697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4b15f35-a13d-4d6f-bd2b-08dcf36d0776
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2024 14:14:38.1675 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zBPH82kQy0X322OxW2zJI0qkteFwo2qYnStX0Cm7B1kg4pN2wp4A+xNmalQFDxn1eayvMIZueF2caxvqO64suw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7302
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
IDIwMjQgNjoxNSBQTQ0KPiBUbzogQWJiYXJhcHUsIFZlbmthdGVzaCA8dmVua2F0ZXNoLmFiYmFy
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
aWVzIHN1cHBvcnQgaW4NCj4gUVNQSSBkcml2ZXIiDQo+IA0KPiBPbiAxMC8yMy8yNCAxMTowNyBB
TSwgQWJiYXJhcHUsIFZlbmthdGVzaCB3cm90ZToNCj4gPiBIaSwNCj4gPiBUZXN0ZWQgd2l0aCB0
aGUgbm9uLXN0YWNrZWQgZGVmYXVsdCBzaW5nbGUgY29uZmlndXJhdGlvbiBvbiBaeW5xTVAgemN1
MTAyIGJvYXJkDQo+IGFuZCBkaWRu4oCZdCBzZWUgYW55IGlzc3VlLg0KPiA+DQo+ID4gWnlucU1Q
PiBzZiBwcm9iZSAwIDAgMA0KPiA+IFNGOiBEZXRlY3RlZCBtdDI1cXU1MTJhIHdpdGggcGFnZSBz
aXplIDI1NiBCeXRlcywgZXJhc2Ugc2l6ZSA2NCBLaUIsDQo+ID4gdG90YWwgNjQgTWlCDQo+ID4g
WnlucU1QPiBzZiBlcmFzZSAweDAgMHg0MDAwMDAwO213LmIgMHg4MDAwIGFhYmJjY2RkIDB4NDAw
MDAwMDtzZiB3cml0ZQ0KPiA+IFp5bnFNUD4gMHg4MDAwIDB4MCAweDQwMDAwMDA7bXcuYiAweDgw
MDgwMDAgMHgwIDB4NDAwMDAwMDtzZiByZWFkDQo+ID4gWnlucU1QPiAweDgwMDgwMDAgMHgwIDB4
NDAwMDAwMDtjbXAuYiAweDgwMDAgMHg4MDA4MDAwIDB4NDAwMDAwMA0KPiA+IFNGOiA2NzEwODg2
NCBieXRlcyBAIDB4MCBFcmFzZWQ6IE9LDQo+ID4gZGV2aWNlIDAgd2hvbGUgY2hpcA0KPiA+IFNG
OiA2NzEwODg2NCBieXRlcyBAIDB4MCBXcml0dGVuOiBPSw0KPiA+IGRldmljZSAwIHdob2xlIGNo
aXANCj4gPiBTRjogNjcxMDg4NjQgYnl0ZXMgQCAweDAgUmVhZDogT0sNCj4gPiBUb3RhbCBvZiA2
NzEwODg2NCBieXRlKHMpIHdlcmUgdGhlIHNhbWUNCj4gPg0KPiA+IFRoYW5rcw0KPiA+IFZlbmth
dGVzaA0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IE1h
cmVrIFZhc3V0IDxtYXJlay52YXN1dEBtYWlsYm94Lm9yZz4NCj4gPj4gU2VudDogV2VkbmVzZGF5
LCBPY3RvYmVyIDIzLCAyMDI0IDI6MTIgUE0NCj4gPj4gVG86IEFiYmFyYXB1LCBWZW5rYXRlc2gg
PHZlbmthdGVzaC5hYmJhcmFwdUBhbWQuY29tPjsgTWFyZWsgVmFzdXQNCj4gPj4gPG1hcmVrLnZh
c3V0K3JlbmVzYXNAbWFpbGJveC5vcmc+OyB1LWJvb3RAbGlzdHMuZGVueC5kZQ0KPiA+PiBDYzog
QW5kcmUgUHJ6eXdhcmEgPGFuZHJlLnByenl3YXJhQGFybS5jb20+OyBBc2hvayBSZWRkeSBTb21h
DQo+ID4+IDxhc2hvay5yZWRkeS5zb21hQGFtZC5jb20+OyBKYWdhbiBUZWtpIDxqYWdhbkBhbWFy
dWxhc29sdXRpb25zLmNvbT47DQo+ID4+IE1pY2hhZWwgV2FsbGUgPG13YWxsZUBrZXJuZWwub3Jn
PjsgU2ltZWssIE1pY2hhbA0KPiA+PiA8bWljaGFsLnNpbWVrQGFtZC5jb20+OyBQYXRyaWNlIENo
b3RhcmQNCj4gPj4gPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT47IFBhdHJpY2sgRGVsYXVu
YXkNCj4gPj4gPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+OyBQcmF0eXVzaCBZYWRhdiA8
cC55YWRhdkB0aS5jb20+Ow0KPiA+PiBRdWVudGluIFNjaHVseiA8cXVlbnRpbi5zY2h1bHpAY2hl
cnJ5LmRlPjsgU2VhbiBBbmRlcnNvbg0KPiA+PiA8c2VhbmdhMkBnbWFpbC5jb20+OyBTaW1vbiBH
bGFzcyA8c2pnQGNocm9taXVtLm9yZz47IFRha2FoaXJvIEt1d2Fubw0KPiA+PiA8VGFrYWhpcm8u
S3V3YW5vQGluZmluZW9uLmNvbT47IFRvbSBSaW5pIDx0cmluaUBrb25zdWxrby5jb20+OyBUdWRv
cg0KPiA+PiBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+OyB1Ym9vdC1zdG0zMkBz
dC1tZC0NCj4gPj4gbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQ0KPiA+PiBTdWJqZWN0OiBSZTogW1BB
VENIIDEvNl0gUmV2ZXJ0ICJzcGk6IHp5bnFfcXNwaTogQWRkIHBhcmFsbGVsDQo+ID4+IG1lbW9y
aWVzIHN1cHBvcnQgaW4gUVNQSSBkcml2ZXIiDQo+ID4+DQo+ID4+IE9uIDEwLzIzLzI0IDU6MTgg
QU0sIEFiYmFyYXB1LCBWZW5rYXRlc2ggd3JvdGU6DQo+ID4+PiBIaSBNYXJlaywNCj4gPj4+IFRo
ZXJlIHdhcyBzb21lIGlzc3VlIGFuZCBmaXggaXMgc2VudA0KPiA+Pj4gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvdS1ib290LzIwMjQxMDE4MDgyNjQ0LjIyNDk1LTEtdmVua2F0ZXNoLmFiYmENCj4g
Pj4+IHJhDQo+ID4+PiBwdUBhbWQuY29tL1QvI3UNCj4gPj4NCj4gPj4gSXMgdGhpcyBvbmUgZml4
IG9yIHRocmVlIGZpeGVzIGZvciB0aHJlZSBkaWZmZXJlbnQgaXNzdWVzID8NCj4gPj4NCj4gPj4g
VGhpcyBzZWVtcyB0byBmaXggUkVBRCBlcnJvcnMsIHdoaWNoIGlzIGFwcGFyZW50bHkgYW5vdGhl
ciBlcnJvcg0KPiA+PiBpbnRyb2R1Y2VkIGJ5IHRoaXMgc3R1ZmYuIEluIG15IGNhc2UsIHBsYWlu
IGFuZCBzaW1wbHkgJ3NmIHByb2JlIDsgc2YNCj4gPj4gdXBkYXRlJyBjb21iaW5hdGlvbiB3aXRo
IHNpbmdsZSBub24tIHN0YWNrZWQgU1BJIE5PUiBkb2VzIG5vdCB3b3JrLiBXYXMgc3VjaA0KPiBh
IHNpbXBsZSBjb25maWd1cmF0aW9uIGV2ZXIgdGVzdGVkID8NCj4gPj4NCj4gPj4+IE5vdCBzdXJl
IHdlIG5lZWQgdG8gcmV2ZXJ0IHdob2xlIHBhcmFsbGVsL3N0YWNrZWQgc3VwcG9ydD8NCj4gPj4g
UGxlYXNlIHN0b3AgdG9wLXBvc3RpbmcuDQo+IA0KPiBZb3UgcmFuIGNvbXBsZXRlbHkgZGlmZmVy
ZW50IHRlc3Qgb24gY29tcGxldGVseSBkaWZmZXJlbnQgY2hpcC4NCj4gDQo+IFN0b3AgdG9wIHBv
c3RpbmcuDQoNClNvcnJ5IGZvciB0b3AgcG9zdGluZw0KDQpXaWxsIHRyeSB0byBnZXQgdGhlIHNw
YW5zaW9uIGZsYXNoIHBhcnQgYW5kIHRyeSB0aGUgYmVsb3cgdGVzdHMuDQpBdCB0aGlzIHBvaW50
IHRyaWVkIHRlc3Rpbmcgb24gZGlmZmVyZW50IGJvYXJkIHdpdGggZGlmZmVyZW50IGZsYXNoIHBh
cnQuDQoNClp5bnE+IHNmIHByb2JlIDAgMCAwDQpTRjogRGV0ZWN0ZWQgbXg2NmwxZzQ1ZyB3aXRo
IHBhZ2Ugc2l6ZSAyNTYgQnl0ZXMsIGVyYXNlIHNpemUgNjQgS2lCLCB0b3RhbCAxMjggTWlCDQpa
eW5xPiBzZiB1cGRhdGUgMHg0MDAwMDAwIDAgMHgxNjAwMDANCmRldmljZSAwIG9mZnNldCAweDAs
IHNpemUgMHgxNjAwMDANCjE0NDE3OTIgYnl0ZXMgd3JpdHRlbiwgMCBieXRlcyBza2lwcGVkIGlu
IDUuNzM1cywgc3BlZWQgMjU3NDM1IEIvcw0KDQpaeW5xPiBzZiBlcmFzZSAweDAgMHg0MDAwMDAw
O213LmIgMHg4MDAwIGFhYmJjY2RkIDB4NDAwMDAwMDtzZiB3cml0ZSAweDgwMDAgMHgwIDB4NDAw
MDAwMDttdy5iIDB4ODAwODAwMCAweDAgMHg0MDAwMDAwO3NmIHJlYWQgMHg4MDA4MDAwIDB4MCAw
eDQwMDAwMDA7Y21wLmIgMHg4MDAwIDB4ODAwODAwMCAweDQwMDAwMDANClNGOiA2NzEwODg2NCBi
eXRlcyBAIDB4MCBFcmFzZWQ6IE9LDQpkZXZpY2UgMCBvZmZzZXQgMHgwLCBzaXplIDB4NDAwMDAw
MA0KU0Y6IDY3MTA4ODY0IGJ5dGVzIEAgMHgwIFdyaXR0ZW46IE9LDQpkZXZpY2UgMCBvZmZzZXQg
MHgwLCBzaXplIDB4NDAwMDAwMA0KU0Y6IDY3MTA4ODY0IGJ5dGVzIEAgMHgwIFJlYWQ6IE9LDQpU
b3RhbCBvZiA2NzEwODg2NCBieXRlKHMpIHdlcmUgdGhlIHNhbWUNCg0KVGhhbmtzDQpWZW5rYXRl
c2gNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290
LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L3Vib290LXN0bTMyCg==
