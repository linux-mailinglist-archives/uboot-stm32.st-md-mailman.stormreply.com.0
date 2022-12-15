Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABC764DDEA
	for <lists+uboot-stm32@lfdr.de>; Thu, 15 Dec 2022 16:38:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA311C64109;
	Thu, 15 Dec 2022 15:37:59 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2053.outbound.protection.outlook.com [40.107.7.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44B08C6334A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Dec 2022 15:37:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SKavB3iol4UPN2bL7yA6DrXdhvC42VF1+sMMQ/aeculjYbFrDTi3u6U5ztJ/vwsyitgzTtg/kDrVNkFJSm2Nq/uIYfv+ljeLu760s0M31WtWTmK95Q/i2ytFSF+1U+exxjzYh50i/EFw7IXBt3+8pDnzVWJs92Z08+B/F2EUuwHc4QfypUoKGFFzTi0RmWF7pZsgsTmNMVdgW34kutV0+0mBVZYgL4qDd5tQzCgWe2anzluxOOOBixXbMHMOiO8beg3CWYw7ynb7LgcmPpm/aqPLGxATpOCr0devjNFPoHzOtIu4X0NFqHzFeFTuKA9ZPTt27URGnCaan7UVlmngUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=avpIlN3IUD8XZflnHD+K7c7mkngLWcu8Psx4L35kpSg=;
 b=RZb40Pz25DvsH5C0hX66DB9y5YEB6pS6pxf9/tgRep2M4s8Wd7tG8GEoYQaNz45O4/vq5p/00NlrbZNb4BOVn5qcK5lLoi1b2GE3BKekd/hp4zI08oyJgLyxvUy11L0aOlRMZOOvghFP1izKQDcR0fo8N5zvsKURoKLEeq74UgTUgs9s4i/t2UNOWAwHvvE9wh/LSmS43xdS+QvjxqO7b7b9Ugtg41P6+oXff3SErAsE9i2/j9GcRZwl4Ya735NLbFJ/kW1Ny3A5D1ies6PdL+zVo4NvRMNsZ0IM2EFO/2BpHbmPU8Y3ObwlHKAYtWhoulJvHQBakvFU1riR0rIXIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avpIlN3IUD8XZflnHD+K7c7mkngLWcu8Psx4L35kpSg=;
 b=SKIIzVXKvkI5tKR22kE5Gq1fgdSvQcJ826f7b+eddx82Zt6EIszB1KwaCYGiAITstz7qLguGcx9bMLWB34blCoyM20lKmcd6E7DwqizBHK2A+aNkkJ1gXK+M/YKsac7XMaxBKyDhxWz0dTlMPaBL75Ja49neBH9VeanRpLSsAbG62sBI9Tb9oe9FQdbdFGb9TNtE6W92EJUSqTLGG2EsrJvP/1bCSddqMGbn0aBDOoikfsoKhcOv8hCQzXce/f7+DhParsoH2DoPg6e2iOqrv2Wq9jczych2MbtleYADiACmXu5mpkgev0ZwBkdVeQTVo5HLI2Hqw1y85Qe8GRSq9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by PAWPR03MB9057.eurprd03.prod.outlook.com (2603:10a6:102:33a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Thu, 15 Dec
 2022 15:37:56 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2b95:1fe4:5d8f:22fb]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2b95:1fe4:5d8f:22fb%6]) with mapi id 15.20.5880.019; Thu, 15 Dec 2022
 15:37:56 +0000
Message-ID: <c01dbb6d-7ff4-129d-c10a-81614ba87170@seco.com>
Date: Thu, 15 Dec 2022 10:37:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20221215101547.1.Ic4654626494193d6dd4788d14fda0aae447783a5@changeid>
 <0f4ca954-e36f-3dff-916d-f6ecbbbc782f@denx.de>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <0f4ca954-e36f-3dff-916d-f6ecbbbc782f@denx.de>
X-ClientProxiedBy: BL0PR02CA0040.namprd02.prod.outlook.com
 (2603:10b6:207:3d::17) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR03MB8847:EE_|PAWPR03MB9057:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c140b25-0c4e-40c8-6c82-08dadeb2559f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PlQjRPfQpDuN6c7LHWdNsVnQfjG5GSyDm7i/7aVj9qCXwu8yLR+R1ZRMN3phy65MqnCg3SgMpYaU6F4ZqE8I8+yxTX1ANUtY6TjjQYpQLh0jOV4D/GiCE38zQd1KAHRlFJfBRU8n2wTeH+1KvFZmDvPVzgnjvOSoiOR6UO3njHxLcgoHxeTmhE3eXzxzeHVXYAtkQKf7qHes+OIAslW3c5MDEGLRRW8/pZFFrcLibf+sbu1JTN1NYkI/26+eVyz5xMwQ5o9QGXVu1PH/wuZgaAfRbjQd2Sw4ojnhIz999eY0ORdFTCvsiO5o3g65d34MbaHNeNMQf6TaNIs94JjlcWtwedk/2UdAUa+3tSZu696Wgf+VUkiho9ZNUWnv586wGeV8IpC4FcohH9AFookfPjaTAT0GA0NgzK031Zib4cDdsH975xBtdgheDgXcdcyNJwHHREL0OnhrxUlIgtTItWY9UwhT/Jt34sdNrqZaaa/fcuThRvG45Xqv9JJZpu2H2lUs1iIT9dbMH5ba8UBntu3Mh/WUF9W1j+sfot00oJ7hVX4l9bjqkalQghOHxxMkd9jxzZI1ywwSIB2CVtaecpPzUWB31pRvJOF0TEVxZ1r/CwrmgzjZvnVk0w7YHKCBfB0avNdBfEP3EtwNaZ0FawajJygJ4FI1IWOV+51f2811119oQWK7gssmk3dwZj6kMv7eV569bk9RiUduASaRW4X07jOD+tBXCL1GhJ9xFnG7CNdSApn18gU0t0X7BY3mL38mXfbh9SID6pCEuT2xeA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR03MB8847.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(136003)(346002)(396003)(366004)(39850400004)(451199015)(36756003)(86362001)(31696002)(186003)(316002)(54906003)(110136005)(478600001)(6486002)(52116002)(44832011)(7416002)(6666004)(2906002)(8936002)(8676002)(66556008)(66476007)(4326008)(66946007)(41300700001)(5660300002)(38100700002)(38350700002)(53546011)(6512007)(26005)(6506007)(83380400001)(31686004)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXVpZ2xWZ0FTWHVBbjhMTDRSYk5GME1UbTBOVEc5SVVwUWU3NXA5NERiVkI5?=
 =?utf-8?B?V2I2c1hvN3ZaUnJ6T0JFSnhGNC8wM2s3dGFmcVNGcUlGanJMVFRFT1RGZUU1?=
 =?utf-8?B?b2tMUDNwZGRHNWtHL05xRFMrNFdwUEZqMUwzL2dPZmE5eTloYXN1UTJqa0Rq?=
 =?utf-8?B?RWF6bmhFK1F6aEh6MFBXKzFHOGFmVXh6dWt5VVN0R054K0hUWVp2emc4T0tK?=
 =?utf-8?B?UUxxVmN2c2pVK282ZjVqWmxOUkZPV3BKaFFUYmN5bTE4WGlFNlNRY2Q2dzlK?=
 =?utf-8?B?UnhNdERLSmJGbzRRRlpqRWpvbThzWkFlSk9VRURqL1diYkNleENmbFNhb3gr?=
 =?utf-8?B?bDRXTEhYM0RIcVZZd3FFcDVNck1maTFkd0FyaE4rMUREZEFoK3FmdHdKcUFE?=
 =?utf-8?B?U1BYeWRXK3lOem8rU1ZwdjNyTVkvdGFGdkNkSHJjWGxYRXZmZGVDSVY1bHkw?=
 =?utf-8?B?VVZaMk91bWZqOUQvbS9PckFhTzJ5NG1TNjA2ZFZsQi85dExzTVoxSkhJNGpI?=
 =?utf-8?B?RHhLTUJyazJUd1hpUU40YjI3Sm9uUGhRNzEvemdycGxZOU44ZVdQMWFKOG5l?=
 =?utf-8?B?Qm1KWVRCQWJ0cmtwUGtLb0c2QWFhYjN0Z0FvV0MvWGxDYmF1SytQV2p6Sy9M?=
 =?utf-8?B?NEl4dTBrcENnRHhQU25pTXI4Ui95eTdMNjJxQUNXVUp1WitqSjdqa3ltRWRa?=
 =?utf-8?B?TndzUlMxTVN3VkZQZ0hQUEVLdE9OT2lCKzhjc3diSmZ0NWlaeFk0RUhsaWFI?=
 =?utf-8?B?aFVoNXd4TDJUVmtHRTV6NjVtTktWc2Nlc3c5dDRLYS8vT3pKMWZHOXJFaHlF?=
 =?utf-8?B?c0dOYWwxUVJ4ajBWSTFYd1Vjc2ZCelNYT3RyWVQ3Z3BsbXNia0tjbFczcHRk?=
 =?utf-8?B?VXZWbTNJbXhsNmVVRUpjZVY3S0wrUWZ1cWQ0VXZUYXIrRFhQbXl0R3lNRk15?=
 =?utf-8?B?L0NORGR3anBtQkhiMnlnOWZWR2pPdml2WjhqdXpFNVpSbWJKWDNUYkE2M3ZV?=
 =?utf-8?B?UzJXU3Z1U1VLUWltQnpqWTZYamRlUGYvcndQQ2dqUlNZczNVa3hxVmY2OTVu?=
 =?utf-8?B?b3pWUi94dmZEank1eXRRVy9hUFd6MnFicHlJYUFwRDFqZG81Si9vaS9hRmdv?=
 =?utf-8?B?UXRHdW9pT3ZKQlZzd3hCdUVjWDA1SUNwVXRHcW9WZ0RBaGJuKzZJSXJaWmx0?=
 =?utf-8?B?ZHI0dWNzSlQ0SitCd3dsSVJBUTc4U2U2c2dCaHRUNDQ2LzhxYXhOb1U2TUtD?=
 =?utf-8?B?RlNtazFvWFVsZG52azZpVmpUekJ3ZTNLa0FIUG9lV1hiNU9YNW1MelQyb3ZN?=
 =?utf-8?B?VXJ0VytmaGRiaGc0ZGFRUTluZHd3Vm1nL0tIbjVQZThDcFBhdTJMeUZibGNs?=
 =?utf-8?B?RmxtazZxNk9iVlIyT0RLLzF6V3Z3TE9Wd2Z4elkwbC9lRHZGTkFJWTRUM1Ay?=
 =?utf-8?B?QmszZHpHTHdRblJaNUM5RlJrRkp3RXB3S0gwZXcyRDdXN3QzdUFpS3lCWWhV?=
 =?utf-8?B?ZGJWVExzdlFDYktlSThCNGlCaXZyMWlMYmpmRjVXTTdEQ04xTlhpZ2ZVNHhG?=
 =?utf-8?B?azRZclF2c0NQckNvV2VVcTg5VDZYUTNZaVQrRlhRc29Ba2t0aEJBVkpCVnhl?=
 =?utf-8?B?aDFSdHBqNUFRMGtyUUFzM0JSRkpJdUp5bXlBOVNFR3dQMWlDclprL3d6dm5r?=
 =?utf-8?B?QXBhYWw3RUg3U2VOc3dic3FZS3BHTVF1REtOa3l5Z3hvYmFEM0lpdmhMSDJU?=
 =?utf-8?B?bWkvSU05T0ZnNFRDWHJiWU9rRk83OHZud2FkSzYrYTZCeWtSYUg0cWVWTUFt?=
 =?utf-8?B?WXBpOTVuODdYdWptRlNWMGpiS2M2YXp2a3hacHFJM1A1QWN6RW1hM3JqNy9W?=
 =?utf-8?B?akdPUmMxUFZ4MkZGZm1RZVRwSEVaQ201WUV6NVRhYWllVEVLZTAxWXE3eWdV?=
 =?utf-8?B?RU9RZXZQQUJkNDNrb3YxT2Rybyt2NVFoR2lVM3ZOUWdGd05Qblp4YXpNQ0xI?=
 =?utf-8?B?UGgrVitBL2plWTZraldzcXVYSDNCNWJncDI4SWU5bUtaQVVkUHVHZUFYMVc3?=
 =?utf-8?B?bFRIZzdodXJxUjVtczVlMWs4dE90a2lQclVXNXVZbHVmRHNsb3ZqWVh5MGJQ?=
 =?utf-8?B?SjMvSTlxSnd1ZGR3U2IxeUFSUnZsb1MzRTVjVWZLWGYyTjBCRExZTW9pdkc2?=
 =?utf-8?B?NEE9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c140b25-0c4e-40c8-6c82-08dadeb2559f
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB8847.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 15:37:56.7173 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /bL/CJ/WunSI/uNMWqCscqm/tLqbLgzo4RgLBcFd9wCWL1UL62vhsvXXEUw2eU0exAURwQ8TQDsUufW4Cxz58Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9057
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Lukasz Majewski <lukma@denx.de>, Sean Anderson <seanga2@gmail.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Ramon Fried <rfried.dev@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Simon Glass <sjg@chromium.org>,
 Roman Stratiienko <r.stratiienko@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] fastboot: remove #ifdef CONFIG when it is
	possible
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

T24gMTIvMTUvMjIgMDk6MzAsIE1hcmVrIFZhc3V0IHdyb3RlOgo+IE9uIDEyLzE1LzIyIDEwOjE1
LCBQYXRyaWNrIERlbGF1bmF5IHdyb3RlOgo+PiBNdWNoIG9mIHRoZSBmYXN0Ym9vdCBjb2RlIHBy
ZWRhdGVzIHRoZSBpbnRyb2R1Y3Rpb24gb2YgS2NvbmZpZyBhbmQKPj4gaGFzIHF1aXRlIGEgZmV3
ICNpZmRlZnMgaW4gaXQgd2hpY2ggaXMgdW5uZWNlc3Nhcnkgbm93IHRoYXQgd2UgY2FuIHVzZQo+
PiBJU19FTkFCTEVEKCkgZXQgYWwuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2sgRGVsYXVu
YXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4+IC0tLQo+Pgo+PiDCoCBjbWQvZmFz
dGJvb3QuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDM1ICsrKysrLS0t
LS0tCj4+IMKgIGRyaXZlcnMvZmFzdGJvb3QvZmJfY29tbWFuZC5jwqDCoCB8IDEwNCArKysrKysr
KysrKystLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiDCoCBkcml2ZXJzL2Zhc3Rib290L2ZiX2NvbW1v
bi5jwqDCoMKgIHzCoCAxMSArKy0tCj4+IMKgIGRyaXZlcnMvZmFzdGJvb3QvZmJfZ2V0dmFyLmPC
oMKgwqAgfMKgIDQ5ICsrKysrKy0tLS0tLS0tLQo+PiDCoCBkcml2ZXJzL3VzYi9nYWRnZXQvZl9m
YXN0Ym9vdC5jIHzCoMKgIDcgKy0tCj4+IMKgIGluY2x1ZGUvZmFzdGJvb3QuaMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHzCoCAxMyAtLS0tCj4+IMKgIG5ldC9mYXN0Ym9vdC5jwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA4ICstLQo+PiDCoCA3IGZpbGVzIGNoYW5n
ZWQsIDgyIGluc2VydGlvbnMoKyksIDE0NSBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBh
L2NtZC9mYXN0Ym9vdC5jIGIvY21kL2Zhc3Rib290LmMKPj4gaW5kZXggYjQ5OGU0YjIyYmIzLi5i
OTRkYmQ1NDg4NDMgMTAwNjQ0Cj4+IC0tLSBhL2NtZC9mYXN0Ym9vdC5jCj4+ICsrKyBiL2NtZC9m
YXN0Ym9vdC5jCj4+IEBAIC0xOSw4ICsxOSwxNCBAQAo+PiDCoCBzdGF0aWMgaW50IGRvX2Zhc3Ri
b290X3VkcChpbnQgYXJnYywgY2hhciAqY29uc3QgYXJndltdLAo+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB1aW50cHRyX3QgYnVmX2FkZHIsIHNpemVfdCBidWZfc2l6ZSkKPj4g
wqAgewo+PiAtI2lmIENPTkZJR19JU19FTkFCTEVEKFVEUF9GVU5DVElPTl9GQVNUQk9PVCkKPiAK
PiBVbnJlbGF0ZWQgdG8gdGhpcywgZG9uJ3Qgd2UgbmVlZCB0byBkZWZpbmUgS2NvbmZpZyBlbnRy
aWVzIGZvciAnY29uZmlnIFNQTF9VRFBfRlVOQ1RJT05fRkFTVEJPT1QnIGFuZCAnY29uZmlnIFRQ
TF9VRFBfRlVOQ1RJT05fRkFTVEJPT1QnIGFuZCB0aGUgb3RoZXIgbWFjcm9zIHRlc3RlZCBpbiBm
YXN0Ym9vdCwgc28gaXQgd291bGQgYmUgY29ycmVjdGx5IGNvbmZpZ3VyYWJsZSBpbiBTUEwgPwoK
SXMgZmFzdGJvb3QgZXZlbiBzdXBwb3J0ZWQgaW4gU1BMPyBUaGlzIHNob3VsZCBwcm9iYWJseSBi
ZSBJU19FTkFCTEVELgoKLS1TZWFuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
