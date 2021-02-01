Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B944130B83D
	for <lists+uboot-stm32@lfdr.de>; Tue,  2 Feb 2021 08:03:40 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5DA5EC57184;
	Tue,  2 Feb 2021 07:03:40 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2080.outbound.protection.outlook.com [40.107.22.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 189FFC32E90
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Feb 2021 15:55:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U0n/p1wXmgRErxQ4f4libWbBsvYYb53ctFB472mPsVkodsoUlAU+YO2A3O8ISIFe2SLduji8upZ70NnWklQbIqwXzWbKH6VoPGs6sHgR1PBhJJ1NJclSraC5Y6bZz+6i0NuBEdZOQUPGE5xGGH2Q0YR44Sc2qb23hZxmnps2p/UFUoLuQH1ncznp77NxvvCvyxJCLXrZNlGSZTWb9xf85qPsAuP/FTPlQEk6Gc703WusbsJCHJYtDKb+lJ76s9eqq5afM1k7kbAohm3z0ZUOJ9oIM+PYSQhM+3pN5uylQIyLHQ2eLlyQLwdAAIy0+GdsNI9PyOXBzb50kpdAIaMAsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OvGF2K68Z4sZxosFrTaYPNdon4LIukaYxKfS8V/rBBc=;
 b=U0JUM0PPrCUHTWRGPkOz4HhBNetrLbBy3A2w/wKFS0tsdj0bhU8iMhgTBTwP9JpwL8WJzSBKiyB4a30GX0yYpt/GAvAwlxM/4XAIgzB4XgAF1fX94oUT89DIGulIHpKECU4lJQcbKSmEk1lYCNg8KhuJMXPIx0f4rg4eh/NCFdoYG4Uhk9OoCvhE4aCRfUsm1Ox0DWBhXOj10EY7PQrRllI8IVPwnkwKhWXb5wrZhPk80PBXzE2k58JgjbfCdMMlcr6jfG38Xlb1fio+4mI5k+g7hSz48GxswMPBPbvbSflrrna8NxsFC0YcUIaAoV5T2qmCa8zf1AVCe/aqJYrYnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=secospa.onmicrosoft.com; s=selector2-secospa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OvGF2K68Z4sZxosFrTaYPNdon4LIukaYxKfS8V/rBBc=;
 b=RHQC/foM4ge4ew/d6+27vbh2ZbBY/d8PAzJRlah62AqGWwfyyyW/25nBa2+BQvWMRss2QczBwiOjrSlRxvnwjLirN5l3442NZi1k84XdufAf4G3x2QTbg1aI1Be5Q68OhJDe8jeLLnlvLrSkOcsjq/Rcbv+MjB7hOrZGOkS4Dqk=
Authentication-Results: st-md-mailman.stormreply.com; dkim=none (message not
 signed) header.d=none;st-md-mailman.stormreply.com; dmarc=none action=none
 header.from=seco.com;
Received: from AM9PR03MB7251.eurprd03.prod.outlook.com (2603:10a6:20b:26e::16)
 by AM9PR03MB7251.eurprd03.prod.outlook.com (2603:10a6:20b:26e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.24; Mon, 1 Feb
 2021 15:55:51 +0000
Received: from AM9PR03MB7251.eurprd03.prod.outlook.com
 ([fe80::a8f2:7dd:46e5:8526]) by AM9PR03MB7251.eurprd03.prod.outlook.com
 ([fe80::a8f2:7dd:46e5:8526%6]) with mapi id 15.20.3805.025; Mon, 1 Feb 2021
 15:55:51 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: u-boot@lists.denx.de
References: <20210127134649.27380-1-patrick.delaunay@foss.st.com>
 <f4e0d75e-18b1-dee4-3355-b05a572010c2@seco.com>
Message-ID: <5bed1ea7-2a79-daf4-0213-21994a63e1ca@seco.com>
Date: Mon, 1 Feb 2021 10:55:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
In-Reply-To: <f4e0d75e-18b1-dee4-3355-b05a572010c2@seco.com>
Content-Language: en-US
X-Originating-IP: [108.51.35.162]
X-ClientProxiedBy: BL1PR13CA0299.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::34) To AM9PR03MB7251.eurprd03.prod.outlook.com
 (2603:10a6:20b:26e::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.201] (108.51.35.162) by
 BL1PR13CA0299.namprd13.prod.outlook.com (2603:10b6:208:2bc::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.8 via Frontend
 Transport; Mon, 1 Feb 2021 15:55:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d62deb1a-ff4c-4481-2bca-08d8c6c9d968
X-MS-TrafficTypeDiagnostic: AM9PR03MB7251:
X-Microsoft-Antispam-PRVS: <AM9PR03MB7251C6D3A6482741DE5B0CB596B69@AM9PR03MB7251.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pEVv1hbNTz/FuAUA91q1suEHVENf/3ZoZkbv76r02wdXkQHJcxwZneHYNgePGEHOnKpeLfXZPJc7N+NjFapVpAaLlURN2/OpcxNHGC8Z0MbdwnV55suoR2ylTxx58AuzK2msqCD96mdNlsgRj1Q9uKg2yqx0w366s8F5deICl3UbOupLuiLivjHQVoljbawbgjVD2c/ZvefaW2OHidh2AyR6qRBe80Ir3nV/18ngOgnrY2s44LsDLGSAlMeRRImxlI94uDYpnneTFoSAvBdTOZAsFT8v0AuCydkGC3eIJR0UbY5sZk3sZmWzlZtKeLlOZt2LW6w9yAdWxucyMXMct6cKAOIpMB3W/05YjRhRS+zkgoKlybrJzDg5Biz4AXNf+YICf2kYublh41T42xQwUwO3GU1qMlwL8LxBac7ANYNy4P1Q9HYCCAPBxztvn0xofRtZEm8P9EWPLVqV3nNArsdrdB50a8oBJK7hCL+4890W0eMchAEcIHu8UZDcBYcQhIAsPqSKYqbzmKiZYKVa9wYdZSCLxPhZGo4ND3gTN90eq5qI34BZNa7WR10Pv7FiDIlP57Ll5yB1Ta0vr2PYxU2n9uFOMBtZTTbeOI3elCZk3T8evEdNP07T6lZIcbL9UpV/LHEA38xUlm/d5N5F5frUz4/F4Ta+zeCywJu1QQLpC3QKX74qEyadqIxYKqM4jAFVh4YuvHU/N7A8PNUbgg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR03MB7251.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(396003)(376002)(39850400004)(136003)(16576012)(316002)(4326008)(53546011)(66946007)(31686004)(2906002)(7416002)(31696002)(8936002)(36756003)(6666004)(66556008)(66476007)(83380400001)(54906003)(6916009)(26005)(16526019)(186003)(44832011)(966005)(8676002)(478600001)(2616005)(956004)(5660300002)(86362001)(6486002)(52116002)(45980500001)(43740500002)(139555002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VWh2M01adExOYUJBNHRNRGlOT04vTHhhVGoxRG9yWks0TjZRTkFlaHNHNHc3?=
 =?utf-8?B?di91V0dhZmlIbldvbEdVaDBHcDg2dm9xNFJ2ZFpmd3g3dGRGWi9FbW4rMTMr?=
 =?utf-8?B?d0h4RVBwRjRTQnFZMGpXeVlmU2xBeHhIRHFFeXdoMzJac2ZHVEZ4am5ZUDNP?=
 =?utf-8?B?eTNmMDZOS3VVWjl5SjFhT1dGalU4cndEMVN2MzRUV3hrNE5MS1FOMzFXRktw?=
 =?utf-8?B?SHRzY0hza1M0T3hoZytxOEUrYWdWMUNjbWVYaXAzcWhMTEJOSHowc29sZ0pT?=
 =?utf-8?B?ZWlwSWIxYWpqSkdyZG5Mc1dmZkIyQ3p4TkNKbzJ1L1Y3eDNMUmtReUkxaW5P?=
 =?utf-8?B?MGgyeWJwbDlBQWhGYk5RUmVkQzRUTUJWSzhxb0xSclhHaGE5WDMzZWpZVXhU?=
 =?utf-8?B?ZmZsOGx0WDJlZGVaUkliUGxiOVNISFBrZWdJbnRiV25xVVB5cTh5K1Rib2Iv?=
 =?utf-8?B?MGozaGQ2SXByd1liNjVRZWxVcDdOd1d0TGJXMCt1ekp1SWFqMm5jYWJ5M0ps?=
 =?utf-8?B?QXdHL3htU3EyU1BUUWE1NGU5aXo4Uy9SR3ljZTM5cWlaYUwzeUQrTkwzYkFF?=
 =?utf-8?B?VWMySERub090YVBUZlNVS3RDdWFqSnhkZE1iUHBJWlcxQzdlWTROZVJaMlVp?=
 =?utf-8?B?Z2RySzVHWk9EWU45NWg2RHk4bUllSVZqNkFQVGpFVkVYT2xPcnlDUlM3S00z?=
 =?utf-8?B?RUU2SDh6aHZJYWFqb3lJY0VPZmk4Wk1ZWDhYL0xpc3VJbndLb01ObXI0UmFS?=
 =?utf-8?B?QW9HZ3M5blV6bkxZYWxZdDRCWFBvcEY0VWtkaXgvdEU2SFl5SGdlNTl3Yldu?=
 =?utf-8?B?NEx5TVdXRUlGc1NmUXlpZDlMZ0poaWd6dEU2QlA1TGp5R3hmeWQ2cS96dWhV?=
 =?utf-8?B?YW5sYVFuME9TQk9IbEtWSUpOM1p3VzBGZVArUzN4ekpsbkNmcFo3WEZXSC9V?=
 =?utf-8?B?eklVS01EOVgvY25WTGtyRnNLRVlGZGFYTjYrd04wYjVXWWdiZDJTWWVrc1pY?=
 =?utf-8?B?VnlKRFpEQXB5RmlIbkc2ZHFkb3lxRzNZRnNRZ3UxN1Y2YldmS0Y1NGxUK01C?=
 =?utf-8?B?ZmpmSWhKQng2TS90cjdhTGRSdGJZVkkvWDVLNlFiRG1JSVB1cG5KSkdieW51?=
 =?utf-8?B?QzdDRmpibFZmb0lTZzVVeDc2RTZJTFJHNEJneThNRzNJR2swc05QNGxHcEpO?=
 =?utf-8?B?dUtKNmRSQ2FrYklLZlBudTFYbk5uR1NvdjJiMFlOR1JGajhJVDliVnBPSkpt?=
 =?utf-8?B?Wkw5UlczRXZUVUVsQkc0MTh3WktmVlZXUXUyb2crVlJ4dFBlTTVoUGpiSG11?=
 =?utf-8?B?ZUEvVGxNbktoczBwTkRIcEhSQWFiZU1SZ1ZKeURYSVR4a2xqTERIUDdNeFlY?=
 =?utf-8?B?L2U1OE9uajdsbUx5WUFQbEpxdXl3SDI4a0RnL2VSNXlycXhLS1pZbThiZjJm?=
 =?utf-8?Q?2EyYSpns?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d62deb1a-ff4c-4481-2bca-08d8c6c9d968
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7251.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 15:55:51.3065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vE47fWqdLQ+SW0EHoyONm7VdVhtl5SV5uAhh2a3mNTs2VQq8vShUfQ3cBuyOExgIJqrQPspcUmFWphT5B7hzSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7251
X-Mailman-Approved-At: Tue, 02 Feb 2021 07:03:40 +0000
Cc: Peng Fan <peng.fan@nxp.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Simon Glass <sjg@chromium.org>, Lukasz Majewski <lukma@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Fabien Parent <fparent@baylibre.com>,
 Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>,
 Filip Brozovic <fbrozovic@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sam Protsenko <joe.skb7@gmail.com>,
 Roman Stratiienko <r.stratiienko@gmail.com>,
 Mingming lee <mingming.lee@mediatek.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [Uboot-stm32] [PATCH v2 0/4] fastboot: mmc: Add
 CONFIG_FASTBOOT_MMC_USER_SUPPORT
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

TG9va3MgbGlrZSBJIGRpZG4ndCBDQyBwZW9wbGUgcHJvcGVybHkuLi4KCk9uIDEvMjcvMjEgMTE6
MzYgQU0sIFNlYW4gQW5kZXJzb24gd3JvdGU6Cj4gSGkgUGF0cmljaywKPiAKPiBJIGJlbGlldmUg
dGhhdCB0aGUgZmlyc3QgdHdvIHBhdGNoZXMgaW4gdGhpcyBzZXJpZXMgY2FuIGJlIHJlcGxpY2F0
ZWQKPiB3aXRoIFsxXS4gRm9yIGV4YW1wbGUsIGlmIHlvdSBjdXJyZW50bHkgdXNlIEZBU1RCT09U
X01NQ19CT09UX1NVUFBPUlQKPiB3aXRoIEZBU1RCT09UX01NQ19CT09UMV9OQU1FIHNldCB0byAi
bW1jMGJvb3QxIiwgbGVhZGluZyB0byBjb21tYW5kcwo+IGxpa2UKPiAKPiAkIGZhc3Rib290IGVy
YXNlIG1tYzBib290MQo+IAo+IFlvdSBjb3VsZCBpbnN0ZWFkIGRvCj4gCj4gJCBmYXN0Ym9vdCBl
cmFzZSAwLjE6MAo+IAo+IEFuZCB0aGUgZmlyc3QgYmVoYXZpb3IgY291bGQgYmUgZW11bGF0ZWQg
Ynkgc2V0dGluZyB0aGUgZW52aXJvbm1lbnRhbAo+IHZhcmlhYmxlICJmYXN0Ym9vdF9wYXJ0aXRp
b25fYWxpYXNfbW1jMGJvb3QxIiB0byAiMC4xOjAiLgo+IAo+IEkgd291bGQgbGlrZSB0byB3b3Jr
IHRvd2FyZHMgZGVwcmVjYXRpbmcgS2NvbmZpZ3MgZm9yIGFjaGlldmluZyB0aGlzCj4gcGFydGlj
dWxhciB1c2UgY2FzZS4gVGhpcyBpcyBiZWNhdXNlIGV2ZXJ5dGhpbmcgaXMgc2V0IGF0IGNvbXBp
bGUtdGltZSwKPiBidXQgd2UgaGF2ZSBleGlzdGluZyB0b29scyB3aGljaCBtYWtlIHRoaXMgZWFz
eSB0byBkbyBhdCBydW4tdGltZS4KPiBGYXZvcmluZyBydW4tdGltZSBjb25maWd1cmF0aW9uIG1h
a2VzIGl0IGVhc2llciB0byB1c2Ugb25lIFUtQm9vdCBmb3IKPiBkaWZmZXJlbnQgYm9hcmRzLCBh
bmQgYWxzbyBtYWtlcyBpdCBlYXNpZXIgZm9yIHVzZXJzIHRvIG1vZGlmeSBVLUJvb3QuCj4gCj4g
Rm9yIHRoZSBsYXR0ZXIgdHdvIHBhdGNoZXMsIEkgdGhpbmsgdGhlcmUgYXJlIHR3byBleGlzdGlu
ZyBzb2x1dGlvbnMuCj4gRmlyc3QsIHRoZXJlIGlzIHRoZSBwYXRjaCB0byBhZGQgInVjbWQiIHN1
cHBvcnQgdG8gZmFzdGJvb3QuIFRoaXMgYWxsb3dzCj4gcnVubmluZyBhcmJpdHJhcnkgY29tbWFu
ZHMgb24gdGhlIFUtQm9vdCBzaWRlLiBIb3dldmVyLCB0aGlzIG1heSBiZQo+IHVuc3VpdGFibGUg
Zm9yIHN5c3RlbXMgd2hpY2ggbmVlZCB0byBtYWludGFpbiBhIGNoYWluIG9mIHRydXN0IChzaW5j
ZQo+IGFsbG93aW5nIGFyYml0cmFyeSBjb21tYW5kcyB3b3VsZCBhbGxvdyBhcmJpdHJhcnkgc29m
dHdhcmUgdG8gcnVuKS4KPiAKPiBXaXRoIHRoaXMgaW4gbWluZCwgRklUIGltYWdlcyBhbGxvdyBm
b3Igc2NyaXB0IHNlY3Rpb25zLiBGb3IgZXhhbXBsZSwKPiBvbmUgY291bGQgY3JlYXRlIGFuIGlt
YWdlIHRyZWUgc291cmNlIGZpbGUgbGlrZQo+IAo+IC9kdHMtdjEvOwo+IAo+IC8gewo+ICDCoMKg
wqDCoGRlc2NyaXB0aW9uID0gIkNvbmZpZ3VyYXRpb24gc2NyaXB0IjsKPiAgwqDCoMKgwqAjYWRk
cmVzcy1jZWxscyA9IDwxPjsKPiAKPiAgwqDCoMKgwqBpbWFnZXMgewo+ICDCoMKgwqDCoMKgwqDC
oCBkZWZhdWx0ID0gInNjcmlwdC0xIjsKPiAgwqDCoMKgwqDCoMKgwqAgc2NyaXB0LTEgewo+ICDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRhdGEgPSAvaW5jYmluLygibW1jLnNjciIpOwo+ICDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHR5cGUgPSAic2NyaXB0IjsKPiAgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBjb21wcmVzc2lvbiA9ICJub25lIjsKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzaWdu
YXR1cmUgewo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYWxnbyA9ICJzaGExLHJz
YTIwNDgiOwo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAga2V5LW5hbWUtaGludCA9
ICJkZXYiOwo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH07Cj4gIMKgwqDCoMKgwqDCoMKgIH07
Cj4gIMKgwqDCoMKgfTsKPiB9Owo+IAo+IChvciBzb21ldGhpbmcgc2ltaWxhcjsgSSBoYXZlbid0
IHRlc3RlZCB0aGlzKS4gVGhpcyB3b3VsZCBjcmVhdGUgYSBmaXQKPiB3aXRoIGNvbnRhaW5pbmcg
Im1tYy5zY3IiLiBPbiB0aGUgVS1Cb290IHNpZGUsIHJ1bm5pbmcKPiAKPiBmYXN0Ym9vdCAwCj4g
c291cmNlCj4gCj4gV291bGQgc291cmNlIGFueSBzY3JpcHQgY29udGFpbmVkIHdpdGhpbiB0aGUg
RklUIGltYWdlIChpZiBpdCB3YXMKPiBkb3dubG9hZGVkIGUuZy4gd2l0aCAiZmFzdGJvb3QgYm9v
dCBtbWMuaXRiIi4gSSB0aGluayB0aGlzIHByb2Nlc3Mgd291bGQKPiB3b3JrIHdlbGwgZm9yICJy
dW4gb25jZSIgc2NyaXB0cyBsaWtlIHNldHRpbmcgdGhlIG1tYyBib290IHBhcnRpdGlvbnMuCj4g
Cj4gUGxlYXNlIGxldCBtZSBrbm93IGlmIGFueSBvZiB0aGUgYWJvdmUgc3VnZ2VzdGlvbnMgd291
bGQgYWNoaWV2ZSB0aGUKPiBmdW5jdGlvbmFsaXR5IHlvdSBuZWVkLgo+IAo+IC0tU2Vhbgo+IAo+
IFsxXSBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvdWJvb3QvbGlzdC8/c2Vy
aWVzPTIyMzE5OAo+IFsyXSBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvdWJv
b3QvcGF0Y2gvMjAyMTAxMTExMDE5MTkuMjI4NTU1LTEtaHNAZGVueC5kZS8KPiAKPiBPbiAxLzI3
LzIxIDg6NDYgQU0sIFBhdHJpY2sgRGVsYXVuYXkgd3JvdGU6Cj4+Cj4+IEhpLAo+Pgo+PiBJdCBp
cyBhIHJlYmFzZWQgVjIgdmVyc2lvbiBvZiB0aGUgc2VyaWUgWzFdLgo+Pgo+PiBUaGlzIHNlcmll
IGFkZHMgYSBsb3Qgb2YgbmV3ICNpZiBhbmQgZG9lc24ndCByZXNwZWN0IHRoZSBsYXN0Cj4+IFUt
Qm9vdCBjb2RpbmcgcnVsZXMgd2l0aCAxNCB3YXJuaW5ncyBkZXRlY3RlZCBieSBjaGVja3BhdGNo
Ogo+Pgo+PiDCoMKgIHdhcm5pbmc6IFVzZSAnaWYgKElTX0VOQUJMRUQoQ09ORklHLi4uKSknCj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW5zdGVhZCBvZiAnI2lmIG9yICNpZmRlZicgd2hlcmUg
cG9zc2libGUKPj4KPj4gQnV0IEkgY2hvc2UgdG8gY29weSB0aGUgZXhpc3RpbmcgY29kZSBvZiB0
aGUgZmFzdGJvb3QgZmlsZXMKPj4gZmJfY29tbWFuZC5jIHRvIGEgaGF2ZSBhbiBlYXNpZXIgcmV2
aWV3Lgo+Pgo+PiBTbyBJIHByZWZlciBzZW50IGEgcGF0Y2ggKGlmIGl0IGlzIHJlcXVpcmVkKSB0
byByZW1vdmUgYWxsIHRoZQo+PiAjaWZkZWYgaW4gdGhpcyBmaWxlIHdoZW4gdGhlIHNlcmllIHdp
bGwgYmUgYWNjZXB0ZWQuCj4+Cj4+IEkgY2hlY2sgY29tcGlsYXRpb24gb2YgdGhlIGFkZGVkIGZl
YXR1cmVzIG9uIHN0bTMybXAxIHBsYXRmb3JtCj4+IHdpdGggdGhlIHNlcmllIFsyXS4KPj4KPj4g
VGhlIGNvbXBpbGF0aW9uIGZvciBtb2RpZmllZCBib2FyZHMgKHdpdGggYWxyZWFkeSBhY3RpdmF0
ZWQgY29uZmlnCj4+IENPTkZJR19GQVNUQk9PVF9NTUNfQk9PVDFfU1VQUE9SVCkgaXMgdmVyaWZp
ZWQgd2l0aCBidWlsZG1hbjoKPj4KPj4gdG9vbHMvYnVpbGRtYW4vYnVpbGRtYW4gbXQ4NTEyX2Jt
MV9lbW1jIG10ODUxOF9hcDFfZW1tYyBwdW1wa2luCj4+IEJ1aWxkaW5nIGN1cnJlbnQgc291cmNl
IGZvciAzIGJvYXJkcyAoMyB0aHJlYWRzLCA0IGpvYnMgcGVyIHRocmVhZCkKPj4gwqDCoMKgIGFh
cmNoNjQ6wqAgdyvCoMKgIHB1bXBraW4KPj4gKz09PT09PT09PT09PT09PT09PT09PSBXQVJOSU5H
ID09PT09PT09PT09PT09PT09PT09PT0KPj4gK1RoaXMgYm9hcmQgZG9lcyBub3QgdXNlIENPTkZJ
R19ETV9FVEggKERyaXZlciBNb2RlbAo+PiArZm9yIEV0aGVybmV0IGRyaXZlcnMpLiBQbGVhc2Ug
dXBkYXRlIHRoZSBib2FyZCB0byB1c2UKPj4gK0NPTkZJR19ETV9FVEggYmVmb3JlIHRoZSB2MjAy
MC4wNyByZWxlYXNlLiBGYWlsdXJlIHRvCj4+ICt1cGRhdGUgYnkgdGhlIGRlYWRsaW5lIG1heSBy
ZXN1bHQgaW4gYm9hcmQgcmVtb3ZhbC4KPj4gK1NlZSBkb2MvZHJpdmVyLW1vZGVsL21pZ3JhdGlv
bi5yc3QgZm9yIG1vcmUgaW5mby4KPj4gKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT0KPj4gwqDCoMKgIGFhcmNoNjQ6wqAgdyvCoMKgIG10ODUxOF9h
cDFfZW1tYwo+PiArPT09PT09PT09PT09PT09PT09PT09IFdBUk5JTkcgPT09PT09PT09PT09PT09
PT09PT09PQo+PiArVGhpcyBib2FyZCBkb2VzIG5vdCB1c2UgQ09ORklHX0RNX0VUSCAoRHJpdmVy
IE1vZGVsCj4+ICtmb3IgRXRoZXJuZXQgZHJpdmVycykuIFBsZWFzZSB1cGRhdGUgdGhlIGJvYXJk
IHRvIHVzZQo+PiArQ09ORklHX0RNX0VUSCBiZWZvcmUgdGhlIHYyMDIwLjA3IHJlbGVhc2UuIEZh
aWx1cmUgdG8KPj4gK3VwZGF0ZSBieSB0aGUgZGVhZGxpbmUgbWF5IHJlc3VsdCBpbiBib2FyZCBy
ZW1vdmFsLgo+PiArU2VlIGRvYy9kcml2ZXItbW9kZWwvbWlncmF0aW9uLnJzdCBmb3IgbW9yZSBp
bmZvLgo+PiArPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PQo+PiDCoMKgwqAgYWFyY2g2NDrCoCB3K8KgwqAgbXQ4NTEyX2JtMV9lbW1jCj4+ICs9PT09
PT09PT09PT09PT09PT09PT0gV0FSTklORyA9PT09PT09PT09PT09PT09PT09PT09Cj4+ICtUaGlz
IGJvYXJkIGRvZXMgbm90IHVzZSBDT05GSUdfRE1fRVRIIChEcml2ZXIgTW9kZWwKPj4gK2ZvciBF
dGhlcm5ldCBkcml2ZXJzKS4gUGxlYXNlIHVwZGF0ZSB0aGUgYm9hcmQgdG8gdXNlCj4+ICtDT05G
SUdfRE1fRVRIIGJlZm9yZSB0aGUgdjIwMjAuMDcgcmVsZWFzZS4gRmFpbHVyZSB0bwo+PiArdXBk
YXRlIGJ5IHRoZSBkZWFkbGluZSBtYXkgcmVzdWx0IGluIGJvYXJkIHJlbW92YWwuCj4+ICtTZWUg
ZG9jL2RyaXZlci1tb2RlbC9taWdyYXRpb24ucnN0IGZvciBtb3JlIGluZm8uCj4+ICs9PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4+IMKgwqDCoMKg
IDDCoMKgwqAgM8KgwqDCoCAwIC8zwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMDowMDowN8Kg
IDogbXQ4NTEyX2JtMV9lbW1jCj4+IENvbXBsZXRlZDogMyB0b3RhbCBidWlsdCwgZHVyYXRpb24g
MDowMDoyMywgcmF0ZSAwLjEzCj4+Cj4+IFsxXSAiZmFzdGJvb3Q6IG1tYzogQWRkIENPTkZJR19G
QVNUQk9PVF9NTUNfVVNFUl9TVVBQT1JUIgo+PiDCoMKgwqDCoCBodHRwOi8vcGF0Y2h3b3JrLm96
bGFicy5vcmcvcHJvamVjdC91Ym9vdC9saXN0Lz9zZXJpZXM9MjAwNTA5JnN0YXRlPSoKPj4KPj4g
WzJdICJjb25maWdzOiBzdG0zMm1wMTogZW5hYmxlIGZhc3Rib290IHN1cHBvcnQgb2YgZU1NQyBi
b290IHBhcnRpdGlvbiIKPj4gwqDCoMKgwqAgaHR0cDovL3BhdGNod29yay5vemxhYnMub3JnL3By
b2plY3QvdWJvb3QvbGlzdC8/c2VyaWVzPTIwMDUxMAo+Pgo+PiBSZWdhcmRzCj4+Cj4+IFBhdHJp
Y2sKPj4KPj4KPj4gQ2hhbmdlcyBpbiB2MjoKPj4gLSByZWJhc2Ugb24gbWFzdGVyIGJyYW5jaAo+
PiAtIG5ldyBpbXBhY3Qgb24gcHVtcGtpbl9kZWZjb25maWcgYW5kIG10ODUxMl9ibTFfZW1tY19k
ZWZjb25maWcKPj4gLSBuZXcgaW1wYWN0IG9uIHB1bXBraW5fZGVmY29uZmlnIGFuZCBtdDg1MTJf
Ym0xX2VtbWNfZGVmY29uZmlnCj4+Cj4+IFBhdHJpY2sgRGVsYXVuYXkgKDQpOgo+PiDCoMKgIGZh
c3Rib290OiBtbWM6IEFkZCBDT05GSUdfRkFTVEJPT1RfTU1DX1VTRVJfU1VQUE9SVAo+PiDCoMKg
IGZhc3Rib290OiBtbWM6IGV4dGVuZCBmbGFzaC9lcmFzZSBmb3IgYm90aCBlbW1jIGh3cGFydCAx
IGFuZCAyCj4+IMKgwqAgZmFzdGJvb3Q6IGFkZCBjb21tYW5kIHRvIHNlbGVjdCB0aGUgZGVmYXVs
dCBlbW1jIGh3cGFydCBmb3IgYm9vdAo+PiDCoMKgIGZhc3Rib290OiBhZGQgY29tbWFuZCB0byBz
ZWxlY3QgdGhlIGVNTUMgYm9vdCBjb25maWd1cmF0aW9uCj4+Cj4+IMKgIGNvbmZpZ3MvbXQ4NTEy
X2JtMV9lbW1jX2RlZmNvbmZpZyB8wqAgMyArLQo+PiDCoCBjb25maWdzL210ODUxOF9hcDFfZW1t
Y19kZWZjb25maWcgfMKgIDMgKy0KPj4gwqAgY29uZmlncy9wdW1wa2luX2RlZmNvbmZpZ8KgwqDC
oMKgwqDCoMKgwqAgfMKgIDMgKy0KPj4gwqAgZG9jL2FuZHJvaWQvZmFzdGJvb3QucnN0wqDCoMKg
wqDCoMKgwqDCoMKgIHzCoCAzICsrCj4+IMKgIGRyaXZlcnMvZmFzdGJvb3QvS2NvbmZpZ8KgwqDC
oMKgwqDCoMKgwqDCoCB8IDYyICsrKysrKysrKysrKysrKysrKysrLS0tLS0tCj4+IMKgIGRyaXZl
cnMvZmFzdGJvb3QvZmJfY29tbWFuZC5jwqDCoMKgwqAgfCA3MiArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrCj4+IMKgIGRyaXZlcnMvZmFzdGJvb3QvZmJfbW1jLmPCoMKgwqDCoMKgwqDC
oMKgIHwgNTIgKysrKysrKysrKysrKystLS0tLS0tLQo+PiDCoCBpbmNsdWRlL2Zhc3Rib290LmjC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDYgKysrCj4+IMKgIDggZmlsZXMgY2hh
bmdlZCwgMTcxIGluc2VydGlvbnMoKyksIDMzIGRlbGV0aW9ucygtKQo+Pgo+IAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxp
bmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMy
Cg==
