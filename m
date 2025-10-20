Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F180BEF301
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 Oct 2025 05:29:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4FEC0C57B7B;
	Mon, 20 Oct 2025 03:29:34 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013039.outbound.protection.outlook.com [52.101.72.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 517B4C57B79
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Oct 2025 03:29:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KNrOvbnqdff1jJ+Kl4DkXOcCRhU0H8HGaNVKd9UjzdvvuRdQ+x6269B531iqFsCaEOuq1tyib8YylkYNUxLr6w4JxlYVN8MYCWyF/MtXksE0m2pjC5INAlyaDbZOSxNTI0DN8V4JZi7G0hKW+k0wYz2OEWraitMIPFpfYQ46YHKrROy3ZflPnX8eW7GJFED6Q8kL6B3vfo2CK+85BO3e+ReNLb2+Pu3h5P78RBLS7BjgksflZNEbyqNoQ2P+vAQLmAE8zsrqjDzj0HfPrVFaLpamAGjLE0/TExbln9pB1kvmR6rbxRQ8px4q9AdwAaC+MBm5KU27iE868VclyWUsBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bEUZP8UaSAwRspswQmQKWtWcxWzsv7nJczB6Le9wSiA=;
 b=CNDC2PAJtaP9Lfc94pE9yGtojhjV6rajbL/4rc+lwf6RGGSO6jUYFQK6MxsPwpDHwaxUT+1nEkwv0rAeHKMKhJPZ9guUqJUiYDKEbACJWr4Af844X2AzoO3TSZR9YoSOMBNvGBls1TvUO/LnaNxZXYsAebZIpJEFl9NHiItBAx06HeBgmzSCf9PbXdV4wZ5wxNjFz0Txlo1yn32Sx/PT1ci1NNQl8c86Gl+m8bJM6sid2FzzoP33m5xd41y3xNBn+qYcpknJ7qeyBGD8j4DuOr0GM3WXJqayvmJWqAXugBLVCNnYc1RXw+lx43oHbS36ayOU3japrN1z0laBlnna5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bEUZP8UaSAwRspswQmQKWtWcxWzsv7nJczB6Le9wSiA=;
 b=UdhO1dDAFohBL+YJ92N2cwfnqV2Bpxk9/vafexUtNSbNc/CnrQDzuC6ShExzZ6O3kNQpDk7X2wSNUavoDRxBAae0iUy+Su74NFY4tVO2STbuq9TaJTQoVzp05S6oBj1C3zY8Sfv/YhH2Jt4uYqeOS9wnyrMU2dF1GtNSPsHWp1tYSi/34Tru2ir4tkLQlt0LK/ChYTHZ3LGQPMgC71CP1tiCO+zAU9qq0GGcAQryNpg1OKGM0ugEmFwzumL0h6unH1kxEJKhJSb6+v8G9wgP7fQNCskAlgmIonHnJaPAv88GjZ/rv73Psbo3NqzVr7aGdXil4gEHaQdDq3aFV6mfqg==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB9156.eurprd04.prod.outlook.com (2603:10a6:102:22f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 03:29:30 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 03:29:30 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Fabio Estevam <festevam@gmail.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Thread-Topic: [PATCH v2 00/10] remoteproc: Add support for i.MX8M[M/N/P/Q] and
 i.MX93
Thread-Index: AQHcPXnzcXnn/lry7UuR6erj7TNtmrTIW6cAgAIMUfA=
Date: Mon, 20 Oct 2025 03:29:30 +0000
Message-ID: <PAXPR04MB8459FE522421FA7A197CEA3488F5A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20251015-imx-rproc-v2-0-26c6b3d16c35@nxp.com>
 <CAOMZO5B8cT0NPSAtu7pxODiy_=8PD_aYWW1U7+fs_xLJP8cKbQ@mail.gmail.com>
In-Reply-To: <CAOMZO5B8cT0NPSAtu7pxODiy_=8PD_aYWW1U7+fs_xLJP8cKbQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|PAXPR04MB9156:EE_
x-ms-office365-filtering-correlation-id: a3f9d56e-7f76-4b31-0203-08de0f88e17b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|19092799006|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?aXBJMVhSZmlNZTFSdzIxSS94Yk5LOHYzYzJJV004SmJZWnE4eUpXaVZscWpj?=
 =?utf-8?B?SnBucWVsZWVMTDFvd21JWnY3VmY0ZjlXMThOVGZ2K0pFcXFkMEhLK3dVbTE5?=
 =?utf-8?B?SFRRcmozbi9oQnJucVhWdDFJdTVhQkltdFlwTFdCU3VqREx5Y05nZmJFTTUy?=
 =?utf-8?B?cW5LeEdmcUM5dXZnQzVLdFY0RW5CNS9ZaTVOSnZ1TnJrTk1OMnppNlZLTW11?=
 =?utf-8?B?WVNGQlc5SWdhaDdpT2dCU0djQzdGYnVKY081NjB2UzNaSXRybDBFTU5ZM1dF?=
 =?utf-8?B?RSsvQjZ5VHNUWmVnYm5NZ3hmQlliV0lKTUxqZWRRL25KQ2NNd2w1MzFjcFIx?=
 =?utf-8?B?MlVSdnFFNEdsTU5zbFlicXRuazFWSGtuVitvM0dBcTFselRjS245SVhMeGFG?=
 =?utf-8?B?U0l5Yi9RQlpKaE1aMUpocDAzQUdxM0tKRnFmSTljQlhtNkc0SllOdzlFcTU2?=
 =?utf-8?B?SGZnclNvOG9nRVNUVmNNbHgrYWtESlE5aVY5MlFiOTFCN2FHOGx5ODY3UGR6?=
 =?utf-8?B?eHZwT1VyZ01uOXZMcVppQW1qUXYrbFQ1eGh0ZEptdmxFbEVHSDc2a1dRUDhD?=
 =?utf-8?B?RjM1Z29kNUtZcXlmNVdOMjVkRU5jU1lFd09pOEV2Y1NlMmxLMkhEZ3hmT2to?=
 =?utf-8?B?QXZoMjNvcmI5eTRrKzcwZWd2ZHovejVpVlFHRDlnYm9ZTC93Z3dwRHZKaTZj?=
 =?utf-8?B?WWMwQ0dWeG4yRmZ3dUwrKzBESlg5K2llSWJNTmEydThId3NlMXorNEZEOGN4?=
 =?utf-8?B?UTRPREJxY1VNTlJ6TU41SWhUZ3NkMGZDUkU0UVVIRG5nMVZlc0xrVU55ZzI5?=
 =?utf-8?B?NzR0a2ZWb0FFbFpxSHhaSEVic1Nac0lKZlZyZFJNSC9ycTJ6ZTBNd0dRNkhl?=
 =?utf-8?B?Si8wOUw3TkozcUJRK3M5N1pxWEpEamV4aG04NnBMT1pydWNSTm5EbU02SGU0?=
 =?utf-8?B?NUZvRlVqN05kSGJkWnJRMm9qckV5YytSRGN3ejh6aEY4RnZIZ1RKMXNJSkJS?=
 =?utf-8?B?aC9FVW4wQjBUajBCR1YyVUJSdjlYN1hNblFJa3ZjU2tXcGpESU5kalZJeTVs?=
 =?utf-8?B?aUVTaEk3cldFL2ZxeVZBc3ZBWng3RTcvRXJxaXVXQ21iQmlrYkNUNjBpNjNU?=
 =?utf-8?B?TmRETGlmTm5rNnNRVFpQNzE4S1Fmd2NxLy9qcUtGbzNIRy8zNzhUSlE4bjgr?=
 =?utf-8?B?RnRkNVpReHA4cHJJTDhMN2xlWXQvRS9OcFpGQjNvbXJvNnlHNVFEaTVhdlFN?=
 =?utf-8?B?bUswV0dVWkIvREhIQitmbzhJdUVqZ1dpQlZId09MdzBKZkdUdFFFcHFlYzRs?=
 =?utf-8?B?ZVZIa1VpVzVubHlRNzVZdWxMbFVMbWlpcmNwQ1psN3hkNzRqZkR6aHk0NFhx?=
 =?utf-8?B?TlZmTEZnQ3k1cTI1RTh3a0txUW4xYXFTbVNlUWhWdVJYUXVkaGhaaEF1MjY2?=
 =?utf-8?B?Tit3c0xaUXFjOGR4bERISjVVQmJhWERPTmtPNml3TkxkMnJ6eGJnRW5yQ2Q0?=
 =?utf-8?B?Zk1VUG5uZVJIRlN3Z2FZdnIweHNsK3VYUEUxdTRsOEt1UkwxV0VZbmZpenhu?=
 =?utf-8?B?K3dZaTJXY3o3Y0dPdkYzU3c1UkIwSTlMY08xTUM1MWlYT1FxeUsrdk0wOHZU?=
 =?utf-8?B?S3pMSk5VTnFieUJZbmQyb0VsNEZ5SDZOaFN2c2RUVW9XVnJyR3RVWE9CejRT?=
 =?utf-8?B?T2hxTnRBNlJ2c096U2prM29PYU55NVhvM3FWZXJwK2xwcXZ5UGJNVGMrMG5T?=
 =?utf-8?B?dEc1c3F5K2s1Q3ZUbzZ1MVVwVTNPTkk0OW9nc0x4V3YwdlJXTEdIeHZOSHE3?=
 =?utf-8?B?Q3dVYWdRMTVxM290eVZhSmVPMUFMcjJHUnJKcm5Cc2Y4bUswMjlEN0psU3pB?=
 =?utf-8?B?MWI4a3IvZitjZVhwTlU4cVltQ1FSa0hEV2lKQ21kOWd6eElweTZhTlBGOS9P?=
 =?utf-8?B?akM2eTZXOVR2ckdyMUR2UXNMSDRhdlhsRkNERVQ4S203SnorR2pRY0pMWmdD?=
 =?utf-8?B?aHZ3enV1em44NFBUenpKOUkza09SeVJaNThyaXpLaHNvdXJTd3RkMDVJL2Y5?=
 =?utf-8?Q?a1+wjv?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(19092799006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aDdQWDFJNDhXVGZOcXZ5TWhqdjlSdUlIZUUvRXlITlk3RzBYOHFlL2VTbzNY?=
 =?utf-8?B?bXNuV3NKWmJUMm9wNjdMNE5MTDNsYytvdHdsaktKRjYwY3FWRHlUemhsbjR2?=
 =?utf-8?B?WXplaC9KcWFWRkgwNGNOUXR5Mmh0aHJOVE03R0Z5WWZTcTZvcGczaVJ3Qkwy?=
 =?utf-8?B?ZEpqWGh4QXJtVkhYZERNWitwY0pMK2Z2bXp2TVIyN09XV2tYSWIvQ2VZOUFv?=
 =?utf-8?B?K1c5b3JyNnJTT3g0TEYzUi85bElkYUtBODhCWERKQUhpc1NEQkFuRFVMamdY?=
 =?utf-8?B?YzVqdkwrblcvQllzRmxHd0VwWDZXU0kyY0FTMEVCOW5VRm1ObEdlTmRsV2ha?=
 =?utf-8?B?Vnlja1l6UldYWWxyRldLbFRsT0dlV1FzM3ljTW4wU2pUeVB2K0R0SHVCcXpx?=
 =?utf-8?B?MmR0Rks2eEdrSlVlbHpoSDUwSEpaek1HYXFLRmFZOENRaWdTUi9RcVNUeTk2?=
 =?utf-8?B?V21Wcm1RQ05NaXhlRHVTUHBOSk5KNDBxNVB3Nkt3NVA2dmJ6dzkybDBQVkQy?=
 =?utf-8?B?WFZybHFEeVpjTXQyemQvMWxaYm10VHVYMDJWV3c5Q2tWeXA5MG94RFk0VDls?=
 =?utf-8?B?ckljQVJERU5tbXhnY1Q2eGdTUUd4WU9lSW13ZkJWUFJ2QVlQeGJyTkRyM2tY?=
 =?utf-8?B?L1l4dVBDa2hyZE1CYWVaeEpaTnV6SFFQRHpmc3BNZUY1QmxtZ2krNy9oVkZn?=
 =?utf-8?B?R1ZIRXFMTkkxMnNMSUlTbFN1ZS9DdlIvUkNwc1QxVU5XbFJCRC9ZKythNTR1?=
 =?utf-8?B?WVBqcWdPU0xjUy9GODdGWTZQQ0hUckVHNXlCNERTVzRuWFN6QUZNR0lJL2Vj?=
 =?utf-8?B?RzJTQXpza29iSlpPdmFwRUNMeWkxdHdVSVFBKzNuUU1UdXBsYUVvSlhKUHk4?=
 =?utf-8?B?V1plaFVOMFhKS1NLZCtHek53ellWM1VmWGF2V2FrWjIybGh6QXVEYlZWM3Vx?=
 =?utf-8?B?a1N5RzBPREVTL21NWHR5UkI1SW5qVjB2NWRLVkJHK1Q4aDdFUjRvemhhNWFM?=
 =?utf-8?B?cHROcmhoMENXbWFWdkhWMmR5Q3g1cG8wZHdpY1hNeGdvSDBnOVlRRzA2QXBR?=
 =?utf-8?B?V09nU0RsK3Z4NWJyY3ByMlg5ejJHTWJNRE15cUc5Q2w1dmdUc3FLa3V1TDAw?=
 =?utf-8?B?cGFrVTBkbmNLaUlGK1F5UFBhV29OR2JiSDI1YjAvZmtXQmNXZFhyK0trZVE3?=
 =?utf-8?B?WEliOGFSMHZOM29FMTZOUWRHbzZzd1lwQ3VHcXlaZGxvQ0wxUG9lZ29XQWdY?=
 =?utf-8?B?MERXTVpIYVUzSFhlVjZDOG5rcTViQTFkd0ZEYUwxT0VLY2ladncvdGRKZXU4?=
 =?utf-8?B?cXU1dkIrVDduOThDVnZuL3dkY2RndTBhaGpubFMzNnkwZVZMTnptOE5Pc2ZW?=
 =?utf-8?B?MlgreUIyejdBT2xUdS9tV1EwUzZaQW1MWGR4SUdOSGVVaVM2V0szNFBqNitL?=
 =?utf-8?B?R0g1UDh1QmRGc1lONzFHbFNRMm9LdDVUbnNGYkUwdjQzZ25FMHFBczBYYm9E?=
 =?utf-8?B?c2VxQXdwVVNFdnBIa0VJRjZSUjlBcFArYm5MS09rUXkxRlRHa3dTeDFKYllz?=
 =?utf-8?B?T1JxNFNpMkFFbFMraW9HUm1sb3BCV2FVZWZEVGVPNlBTWUdjdUNDQ0lDOFRs?=
 =?utf-8?B?ZUNmcWNGQThNQVk4L0dKV1pJenVRNlVaYWNUQmFjdy91VlRTVWRjMHYvMk9M?=
 =?utf-8?B?TXRQK2todTFubEhjY3VkSjhiV3FkQzg4YWViSTJTTVNTbXM1RHh3T1N2T1k4?=
 =?utf-8?B?VDRBZzFmRzl0V3dBY3lvY2t2S1RJc1F3UzNIZCttV3pxek1hSys2eURtbVRk?=
 =?utf-8?B?SmMzNEFFRlNLUHYvbDBFKzZKdSs3MzVsaUw1MjJ5TFJiZFNvVjdJYTMwZjF1?=
 =?utf-8?B?OWZXRUhEdUg0SSt1eU0zMlREK05lSzJHWURqWE9Db3FFc215RU1oME5TUzJr?=
 =?utf-8?B?bG5jT1dMRUEveERLRUN4NnJndVNJT21mSUtBVW1NOHRJUGJhaTlIQVkxT2JS?=
 =?utf-8?B?b1I0Qjdxc2dZa2FjczhxTXRrdFNDbE11UVhvalpUalBxNURQeUo2c2lhR2VF?=
 =?utf-8?B?WksrSHlaR3lLWkRIRWsybWJtRStTWFJ5OGZhTHMwekQ0cE5iOVZrZC9jelY2?=
 =?utf-8?Q?BEH0=3D?=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3f9d56e-7f76-4b31-0203-08de0f88e17b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2025 03:29:30.5646 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JTxIWhCoAU3UWIg2DdrILKGk6Ezq8yOUvWIXYYVQa9qdEI7MzTiQzSjegs4AhBhE+bOuUGCM/9dBSohOmnRUsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9156
Cc: Tom Rini <trini@konsulko.com>, Ye Li <ye.li@nxp.com>,
 Udit Kumar <u-kumar1@ti.com>, Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Oliver Gaskell <Oliver.Gaskell@analog.com>, Andrew Davis <afd@ti.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>, Beleswar Padhi <b-padhi@ti.com>,
 Judith Mendez <jm@ti.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 dl-uboot-imx <uboot-imx@nxp.com>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>, Hari Nagalla <hnagalla@ti.com>,
 Ryan Eatmon <reatmon@ti.com>, Stefano Babic <sbabic@nabladev.com>
Subject: Re: [Uboot-stm32] [PATCH v2 00/10] remoteproc: Add support for
 i.MX8M[M/N/P/Q] and i.MX93
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

Hi Fabio,

> Subject: Re: [PATCH v2 00/10] remoteproc: Add support for
> i.MX8M[M/N/P/Q] and i.MX93
> 
> Please add documentation that explains how remoteproc can be used
> on NXP i.MX8M and i.MX93 platforms.

I posted out a standalone patch to avoid resend the whole patchset.
Passed build with "make htmldocs"

https://lore.kernel.org/u-boot/20251020-rproc-doc-v1-1-61fbaec7c40c@nxp.com/T/#u

Please see whether this is ok.

Thanks,
Peng.

> 
> Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
