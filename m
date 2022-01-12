Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B61C48C1C3
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Jan 2022 10:57:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23D0FC60461;
	Wed, 12 Jan 2022 09:57:22 +0000 (UTC)
Received: from CHE01-ZR0-obe.outbound.protection.outlook.com
 (mail-zr0che01on2132.outbound.protection.outlook.com [40.107.24.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7041C5C82A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jan 2022 09:29:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gt9+WjGF4nthOi9IaDHOp/9dPcdKm/KwEr8KpH4+QoYRCznM4MQ+qqfH3SwEzg4yhsPHXe9gydf+3efXKpI2sBwE3IQpTJU373MnDTGU+ZsVp6UsEZv0HAu15zgF9/k32FxVfW5GDBpg99Tgv5JMc+7m2JaqKg+fbi7CyLye96Jg6/gDP1ZsNsttgc6NW2zkDK8uZg56Sl2hA9VE3qplZe9oyriodgsA9x9Ijy/hZr9QSFwB77rHm2K0L436VAGeN8dd8hAeZNYHSEOV8F3QzjcdkG/vhCQsKH/AmomCloBino310f8KgYw6nNJzxWawUJreM7QxJLVQnGqeWqTFug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nvtv9shYZrskKYIk4miu3TFZaEX6kHV5XipbPF+ddzM=;
 b=BQ4P9DxTInCtwBbEdU1bxKrYfdT76j4TN0uEmwx/mxFWuwZy51Y81GOhrRlkpFPUJF2WEQWNby8/r+gL86h6XMZhHf6McZL0J1sv1X0hEXcfJSNqzxTaetSzYqfcrWLWy5GGUiPkgUPSaGXTtHuzG0yyBCfihR3LMX3g42oMHjwvzPUoLgtMkVRmcvBLhcicpuqGx9FlbPJjODK4SJdzpkfb+ZPMz7tDjsXL9ek0xhcR3Nqk9pfaBkpyuHgKE2/ukHQm8cMLLpaq61FWtaKkvXNXXOpNBwk6SjueE5QxZz+TYu+P6hGG5860VJ4qm+z2s6jDX4wM2jsbvjxMrp2udg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nvtv9shYZrskKYIk4miu3TFZaEX6kHV5XipbPF+ddzM=;
 b=XqZK5pJeMKbvX7A7wwMxJbiNVJX2+gmCifigcQktUR7uNlGkIeTPg9SSnqa0/YMhALeAUfSf1/9zYDQrrXINa6rX9Xd+rNPFqYovHnSEhM3B1PPNtCC+B9D/novB/OjFuFnnUHKi0XyI3408G3+Nwrmw99Q8D2WLAnSJ6Kjw/7U=
Received: from ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:3b::9) by
 ZR0P278MB0554.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:39::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4867.9; Wed, 12 Jan 2022 09:29:57 +0000
Received: from ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM
 ([fe80::7067:aadd:1aa2:85ee]) by ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM
 ([fe80::7067:aadd:1aa2:85ee%8]) with mapi id 15.20.4888.010; Wed, 12 Jan 2022
 09:29:57 +0000
From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 "patrick.delaunay@foss.st.com" <patrick.delaunay@foss.st.com>
Thread-Topic: [PATCH 0/3] sandox: test: activate tests for the command LOG
Thread-Index: AQHYB5b2uqSNlMLVl0+eoHYlHaww/w==
Date: Wed, 12 Jan 2022 09:29:57 +0000
Message-ID: <852bbfb816e1c6cde3364563e479766c46c0b9ce.camel@toradex.com>
References: <20220111162713.632395-1-patrick.delaunay@foss.st.com>
In-Reply-To: <20220111162713.632395-1-patrick.delaunay@foss.st.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toradex.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c80295b4-f620-4daa-448a-08d9d5ae193f
x-ms-traffictypediagnostic: ZR0P278MB0554:EE_
x-microsoft-antispam-prvs: <ZR0P278MB05548BE562944AE8F073FD5FFB529@ZR0P278MB0554.CHEP278.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SjCF+VX5L8sFMaTGZxY4fC4t0WUvWnaw32G4RodVpL+BgDoRGyRUo6cxhN9ZtDOCOksu/jda+TmmOrRDwOfjET8V3zmwcPjDYTGYx74jVC7drGZtMcLJMFA8F/lYniwNtV+DKHw2sQW6M3CANemUkB9VcSOuRIud5k6iByjOaKT3Yg1oC6TtmatecHkj1Icq/p5QoVfgUx1czHdlIn79ERu5++j7jICmCSmusvbysE+PCnsIXB2YaTb9Imy+DI9U/xMdxqMRganUQnnU1PJsKuKO5nyDnkS9hFJ9VkPuOj+4hAEPoe9zaTEYv9q+MjXh/KnWgCp5vopGOPUSzPz1UsmcFSphZVtHJeOwejp0gU1DXntlv281ueVEXqCV/WDQEni1f8jBBxVPuM5KW/cO/h1ZZEK6uTyimagfeVHKsgcj3XEPnshX1cup5Om8HWZhIssA+3FMYD5Wfzr/+9xSX32U5pcH1pCKIOe94aIglK0ykTrOzE2jz1zUvN0u8ZhbHPNnM2NLyfLXZwhQMiGFJ+2L/E+qx8enGS107lggxf2IqWUwhx45SlQD6uok350n8SKIt00u0XB9+PsuV9z/crg94o7lowheVor+3e0DYsa4WnMtrGQJOGxdtkqanS+Vm1/iYPz7efJlqAyVsnd9MCbx3egKL6V9MP44GPgHN6q0b16YVwVHZaSeCZT1rwG6V8oQ8cT3JGfMZhihxR5ECA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(396003)(136003)(346002)(376002)(366004)(36756003)(4326008)(6512007)(66556008)(66946007)(71200400001)(76116006)(38070700005)(6506007)(54906003)(110136005)(316002)(66446008)(6486002)(64756008)(66476007)(5660300002)(8676002)(8936002)(86362001)(2906002)(26005)(122000001)(4744005)(508600001)(186003)(38100700002)(83380400001)(44832011)(2616005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OTdYem1SNzhhYjJsZlBtak5qVjdURitocTFrbzBORlJIbDRzdGlkTXBodVI4?=
 =?utf-8?B?bEt5dWpveDV1TG56YVhCakNVVnFDaEJTc3BkcXNoVThNamZqbjByVUsvaEtM?=
 =?utf-8?B?SE5iYWorTldkTnVOS3BpNTQwZzVuNkc0T0JQUWtrQXlWQ2R0dEcwZ1gxbE1K?=
 =?utf-8?B?ZThoYzVIM3pGekFtOEVZdVZCNmdQMXhJdWoyc3czSk9lRER5NUhvMnpubG1k?=
 =?utf-8?B?aUxvbVp4QldFc1BJTFUyS0F5L3VmT2gybFBTMU5TZjBZd3Bvdld3ejB5Sm1P?=
 =?utf-8?B?S2o2a0VzVzFPaVFFbVFHSFFrbU9xcWhNMVdJY2dVOVp3ZXJIQjN4d0xYdUlz?=
 =?utf-8?B?L3hPWCt1MjF4RnliQmFOS0ViRWFJcGZvOGtaU3hQdnRweDFhTFR2UEhMV0VH?=
 =?utf-8?B?YWJ5QUZhMC9FZjVwb0JqM28vdVdRMEVaeEJGZWpWK0krUGF0Z010M0pLcFVu?=
 =?utf-8?B?WEU1cnljbDAweEczS3RXSW5iRzJMQ2thajUwbldUbTdaM09IMzBpcDI5QU4w?=
 =?utf-8?B?a3RYeGtNSUFsTm1jaW5wa0Z3blVjZDBDNGFnaEhuV3lOaUxSYkdyVzd6cC9j?=
 =?utf-8?B?S1lKK3l4WXpweEt3alphdC9XQm1obzJ6MDlqZXgrZEFLOGZma0VBNWNwNXFG?=
 =?utf-8?B?LytscFI5ZlB1alM1VThndDdXSGVYaG10U2ZIdkpHZzNjRnNDOXVKbnN2cnV6?=
 =?utf-8?B?OHRqTFdSckFnbm9tUTA4N2NyYXNHRm8vVDlCVlpyNWhCNC9BZWN4VmtRSnZ6?=
 =?utf-8?B?TFlEQlVQYS9iYUJtTEthdEU3Z1Y2V3BIbGROSDI3b1U4SEhTTXFRZXZLSlFj?=
 =?utf-8?B?clhQN0lNdURuWHVoMXlVZU9NNkpjbDdsbTR4eXdMdFhkc1NjZEVoaWQyU0pR?=
 =?utf-8?B?ejZyczBQMys5em5vbVNGT09qdHVxbm1MVXlWeDFLbGtOQ01BRnpCMGFZY2ZX?=
 =?utf-8?B?MGNuVkZUclpkVTRmdzJKTkdta1pOc0d0THdOTUFUK28xeTFXdVBjcllmYnln?=
 =?utf-8?B?T0xURktjMXdFUUpaMWFYalY2L1FNMjBwVitGS054c29tNUdKZ1U2Yk0yaVlr?=
 =?utf-8?B?WVAreitDTlVqb3Fqc2dOd1ZhSXlKZGhwOXdKMUNwK0w5T0dBTENlMWlVbTRo?=
 =?utf-8?B?QTRHQis3b3dLeEJ1bEtKWXpicGFWSjgxMjVXVW9jU3ZMKzI4UjNjQlBBdmxH?=
 =?utf-8?B?SnYzTDFjN0hwOTBwdHpFZzhiU3R4c0wzeGg4eWFxZjhZbmVuSFZaSDVhWXF3?=
 =?utf-8?B?MUx1bEk2N092aHVQaG5vZzcxK3M0WndWZFN5L0JiOVBsM2RkOXI2ZXZjcExY?=
 =?utf-8?B?dEc0YmxwbFQweDdHUE9NZ2Z4TWtaaGJLOVRTYWMyM1B2ZWp4OTFXbk1qa3Vv?=
 =?utf-8?B?VDZSRURKREZDa0NUd3g1VXdWTzlOUVFvVUpGZzVnMDVXcHlvOUtYRXg5eWFW?=
 =?utf-8?B?cEFxMG1rSENVM1RWb0pMcEJrSkovS05yK2IrRGNFWCtFaVAwSjJvQWI4Y29t?=
 =?utf-8?B?OUtDTm54NzhRb002UFQxTDMveGNpblhlODhEN0F5azlQM0MvRGVjY2FWS2ox?=
 =?utf-8?B?b2VPQjNlWDBuMGp1VXZIN2txdlAzSkw2NDZHby91VzFPQWt3NnpXRTlpbHk3?=
 =?utf-8?B?RW9aOFFRczgvTDJWTlBSZGYwRzZTVDFtQlM1UGJrd0dqOVVUUmRSK1RyL3FS?=
 =?utf-8?B?MHZwM1lYd0ZYcWd4UTJWTUhrUDFPbzE2MWhncnhtQ01kUkpvVXpTeW9vdDZu?=
 =?utf-8?B?dXNVYWx5VktpYitiMGd0TUUvL0dIMGhvUlQzS2ZTcjd3MXBNTlZOSGI1OWU0?=
 =?utf-8?B?a3J1dVo2QVpNUWxqc0p3eU1UNGxJS3ZxU0dpNytkWEcxL0g1NUI1bXQwdmZX?=
 =?utf-8?B?bWhTakhxdUF3UjJ6MzhETm8rVDVkR3h1UlJQUVNOa2tyWm9ZbDJtMDFxUzBy?=
 =?utf-8?B?QnNETWZ0MlRXMVh4eW5XSUhXazIzL0R6NVBQWHRoL01wUGc2anNaZHordDhK?=
 =?utf-8?B?RVdZZ1FDdndCWkk3V2xoR0VXelFtT3JuVFVaeWl5OEEvMk10V0ZUL2xPYi94?=
 =?utf-8?B?dUhnMC85OHNKM3cvTWV6UTNabEQ0dUc0NjJVTHV6QTN5dVN4MEZOYWw2RWtM?=
 =?utf-8?B?U2s4OCsxeTF5U0xQekIzTzN2NlFVUFBFaUR0QngyWWZpV3BlVzZ0dUEvVUls?=
 =?utf-8?B?VHZiazQ3Rmo0STVBd2FmcWJWN25td00zYlFxaEh5aUxiZjFVZmxncnkzd3V2?=
 =?utf-8?Q?e3i4AAMocaRi4VKsC6pDUkRQURa/Pq2VU2ESsqH7I4=3D?=
Content-ID: <1B9F25188370E048B8B45543371863C1@CHEP278.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c80295b4-f620-4daa-448a-08d9d5ae193f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2022 09:29:57.3769 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5PjXos0pKIuWISkE6SsqYiY6JasFSnPy44/MnIgfKuu1fX1bPX72r/2Klkf9K9wZPcd2Bo/WJrZiZHgqwWuJMo+hBdfOKpp+yz0rRMEAgAs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB0554
X-Mailman-Approved-At: Wed, 12 Jan 2022 09:57:21 +0000
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "sjg@chromium.org" <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 0/3] sandox: test: activate tests for the
	command LOG
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

T24gVHVlLCAyMDIyLTAxLTExIGF0IDE3OjI3ICswMTAwLCBQYXRyaWNrIERlbGF1bmF5IHdyb3Rl
Og0KPiANCj4gVGhpcyBwYXRjaGVzIGFjdGl2YXRlIHRoZSBjb21tYW5kIExPRyBhbmQgdGhlIGFz
c29jaWF0ZWQgdGVzdHMNCj4gaW4gc2FuZGJveCB3aXRoIENPTkZJR19DTURfTE9HPXkgYW5kIHNv
bHZlIHRoZSBhc3NvY2lhdGVkIGlzc3Vlcw0KPiB3aGVuIHRoZXNlIHRlc3RzIGFyZSBleGVjdXRl
ZC4NCj4gDQo+IFBhdHJpY2sNCj4gDQo+IA0KPiBQYXRyaWNrIERlbGF1bmF5ICgzKToNCj4gwqAg
ZG06IGZpeCB1cCBkb2N1bWVudGF0aW9uIGZvciB1Y2xhc3NfZ2V0X2J5X25hbWVfbGVuDQo+IMKg
IGRtOiBjb21wYXJlIGZ1bGwgbmFtZSBpbiB1Y2xhc3NfZ2V0X2J5X25hbWUNCj4gwqAgc2FuZG94
OiB0ZXN0OiBhY3RpdmF0ZSB0ZXN0cyBmb3IgdGhlIGNvbW1hbmQgTE9HDQoNClByb2JhYmx5IHNo
b3VsZCByZWFkIHNhbmRib3guIFNhbWUgZm9yIHRoaXMgY292ZXItbGV0dGVyJ3Mgc3ViamVjdCA7
LXAuDQoNCj4gwqBjb25maWdzL3NhbmRib3hfZGVmY29uZmlnIHzCoCAyICstDQo+IMKgZHJpdmVy
cy9jb3JlL3VjbGFzcy5jwqDCoMKgwqAgfCAxMSArKysrKysrKysrLQ0KPiDCoGluY2x1ZGUvZG0v
dWNsYXNzLmjCoMKgwqDCoMKgwqAgfMKgIDQgKystLQ0KPiDCoHRlc3QvcHkvdGVzdHMvdGVzdF9s
b2cucHkgfMKgIDggKysrKy0tLS0NCj4gwqA0IGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMo
KyksIDggZGVsZXRpb25zKC0pDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
