Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cK8bGtoBxWlZ5gQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Thu, 26 Mar 2026 10:52:26 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 073E6332AE4
	for <lists+uboot-stm32@lfdr.de>; Thu, 26 Mar 2026 10:52:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC0A5C8F279;
	Thu, 26 Mar 2026 09:52:25 +0000 (UTC)
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6D03C87EC4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Mar 2026 05:15:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 72AB81122C9; Wed, 25 Mar 2026 06:15:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
 s=dkim; t=1774415749;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=MOn1jMj8un72XbO7XQ4ykPHaiQh9RJHTF3LV7AhpioE=;
 b=Y+7uP5QpRmypY3Hazmgz5r2r0F/Hm4/StUULEpN7kA3qvnX0qCpM+8ffj//+vpDttFDEki
 fMvlXeVEKsy0cEeZF7Y48gtavFX8h/drIko5o9yOnSKxewboD6/9UWITsc8V+e7CtwLDLc
 1zQN77tWGtdgtn90KeCAx1Zff8NE8DwZVDpr9ysXRSnHpr69/z2cCRi6ijKujDB6I4aCtr
 17ajaLEIKOCOgG6KPX6JgJrRdeVJlUM2SUQJpNVw7xSRSFTsFiDjf1X8EihWjB5c0XOdjR
 1uU9EqDJQ5WuWQ+L5BHGElgB/0gbKAvJFeoqRemOV02CDe1rGBwYSJ9PXwmhcQ==
Message-ID: <9b848de9-33c4-5eb1-38dc-22bf3e57847b@nabladev.com>
Date: Wed, 25 Mar 2026 06:15:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: Tom Rini <trini@konsulko.com>, u-boot@lists.denx.de
References: <20260323225537.896180-1-trini@konsulko.com>
From: Heiko Schocher <hs@nabladev.com>
In-Reply-To: <20260323225537.896180-1-trini@konsulko.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Approved-At: Thu, 26 Mar 2026 09:52:24 +0000
Cc: Peng Fan <peng.fan@nxp.com>, Casey Connolly <casey.connolly@linaro.org>,
 Stefan Roese <stefan.roese@mailbox.org>,
 Kever Yang <kever.yang@rock-chips.com>,
 Masahisa Kojima <kojima.masahisa@socionext.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot-qcom@groups.io,
 Jerome Forissier <jerome.forissier@arm.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>, u-boot-amlogic@groups.io,
 Jaehoon Chung <jh80.chung@samsung.com>, Peter Robinson <pbrobinson@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Tien Fong Chee <tien.fong.chee@altera.com>,
 =?UTF-8?Q?=c5=81ukasz_Majewski?= <lukma@nabladev.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Matthias Brugger <mbrugger@suse.com>, Simon Glass <sjg@chromium.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, linux@analog.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 Anatolij Gustschin <ag.dev.uboot@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] global: Correct duplicate U_BOOT_DRIVER
	entry names
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
X-Spamd-Result: default: False [6.09 / 15.00];
	DMARC_POLICY_REJECT(2.00)[nabladev.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	DATE_IN_PAST(1.00)[28];
	R_DKIM_REJECT(1.00)[nabladev.com:s=dkim];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:trini@konsulko.com,m:u-boot@lists.denx.de,m:peng.fan@nxp.com,m:casey.connolly@linaro.org,m:stefan.roese@mailbox.org,m:kever.yang@rock-chips.com,m:kojima.masahisa@socionext.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot-qcom@groups.io,m:jerome.forissier@arm.com,m:simon.k.r.goldschmidt@gmail.com,m:u-boot-amlogic@groups.io,m:jh80.chung@samsung.com,m:pbrobinson@gmail.com,m:treding@nvidia.com,m:marek.vasut+renesas@mailbox.org,m:tien.fong.chee@altera.com,m:lukma@nabladev.com,m:philipp.tomsich@vrull.eu,m:neil.armstrong@linaro.org,m:mbrugger@suse.com,m:sjg@chromium.org,m:clamor95@gmail.com,m:linux@analog.com,m:patrick.delaunay@foss.st.com,m:bmeng.cn@gmail.com,m:ag.dev.uboot@gmail.com,m:simonkrgoldschmidt@gmail.com,m:marek.vasut@mailbox.org,m:bmengcn@gmail.com,m:agdevuboot@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hs@nabladev.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[27];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[nxp.com,linaro.org,mailbox.org,rock-chips.com,socionext.com,st-md-mailman.stormreply.com,groups.io,arm.com,gmail.com,samsung.com,nvidia.com,altera.com,nabladev.com,vrull.eu,suse.com,chromium.org,analog.com,foss.st.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hs@nabladev.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[nabladev.com:-];
	NEURAL_HAM(-0.00)[-0.410];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 073E6332AE4
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

SGVsbG8gVG9tLAoKT24gMjMuMDMuMjYgMjM6NTUsIFRvbSBSaW5pIHdyb3RlOgo+IFRoZSBVX0JP
T1RfRFJJVkVSIG1hY3JvIGNyZWF0ZXMgYSBsaXN0IG9mIGRyaXZlcnMgdXNlZCBhdCBsaW5rIHRp
bWUsIGFuZAo+IGFsbCBlbnRyaWVzIGhlcmUgbXVzdCBiZSB1bmlxdWUuIFRoaXMgaW4gdHVybiBt
ZWFucyB0aGF0IGFsbCBlbnRyaWVzIGluCj4gdGhlIGNvZGUgc2hvdWxkIGFsc28gYmUgdW5pcXVl
IGluIG9yZGVyIHRvIG5vdCBsZWFkIHRvIGJ1aWxkIGZhaWx1cmVzCj4gbGF0ZXIgd2l0aCB1bmV4
cGVjdGVkIGJ1aWxkIGNvbWJpbmF0aW9ucy4gVHlwaWNhbGx5LCB0aGUgcHJvYmxlbSB3ZSBoYXZl
Cj4gaGVyZSBpcyB3aGVuIGEgZHJpdmVyIGlzIG9idmlvdXNseSBiYXNlZCBvbiBhbm90aGVyIGRy
aXZlciBhbmQgZGlkbid0Cj4gdXBkYXRlIHRoaXMgcGFydGljdWxhciBmaWVsZCBhbmQgc28gd2hp
bGUgdGhlIG5hbWUgZmllbGQgcmVmbGVjdHMKPiBzb21ldGhpbmcgdW5pcXVlIHRoZSBsaW5rZXIg
ZW50cnkgaXRzZWxmIGlzIG5vdC4gSW4gYSBmZXcgcGxhY2VzIHRoaXMKPiBwcm92aWRlcyBhIG1v
cmUgc3VpdGFibGUgc3RyaW5nIG5hbWUgYXMgd2VsbCwgaG93ZXZlci4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBUb20gUmluaSA8dHJpbmlAa29uc3Vsa28uY29tPgo+IC0tLQo+IENjOiBBbmF0b2xpaiBH
dXN0c2NoaW4gPGFnLmRldi51Ym9vdEBnbWFpbC5jb20+Cj4gQ2M6IEJpbiBNZW5nIDxibWVuZy5j
bkBnbWFpbC5jb20+Cj4gQ2M6IENhc2V5IENvbm5vbGx5IDxjYXNleS5jb25ub2xseUBsaW5hcm8u
b3JnPgo+IENjOiBIZWlrbyBTY2hvY2hlciA8aHNAbmFibGFkZXYuY29tPgo+IENjOiBKYWVob29u
IENodW5nIDxqaDgwLmNodW5nQHNhbXN1bmcuY29tPgo+IENjOiBKZXJvbWUgRm9yaXNzaWVyIDxq
ZXJvbWUuZm9yaXNzaWVyQGFybS5jb20+Cj4gQ2M6IEtldmVyIFlhbmcgPGtldmVyLnlhbmdAcm9j
ay1jaGlwcy5jb20+Cj4gQ2M6IMWBdWthc3ogTWFqZXdza2kgPGx1a21hQG5hYmxhZGV2LmNvbT4K
PiBDYzogTWFyZWsgVmFzdXQgPG1hcmVrLnZhc3V0K3JlbmVzYXNAbWFpbGJveC5vcmc+Cj4gQ2M6
IE1hc2FoaXNhIEtvamltYSA8a29qaW1hLm1hc2FoaXNhQHNvY2lvbmV4dC5jb20+Cj4gQ2M6IE1h
dHRoaWFzIEJydWdnZXIgPG1icnVnZ2VyQHN1c2UuY29tPgo+IENjOiBOZWlsIEFybXN0cm9uZyA8
bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz4KPiBDYzogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNl
LmNob3RhcmRAZm9zcy5zdC5jb20+Cj4gQ2M6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVs
YXVuYXlAZm9zcy5zdC5jb20+Cj4gQ2M6IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPgo+IENj
OiBQZXRlciBSb2JpbnNvbiA8cGJyb2JpbnNvbkBnbWFpbC5jb20+Cj4gQ2M6IFBoaWxpcHAgVG9t
c2ljaCA8cGhpbGlwcC50b21zaWNoQHZydWxsLmV1Pgo+IENjOiBTaW1vbiBHbGFzcyA8c2pnQGNo
cm9taXVtLm9yZz4KPiBDYzogU2ltb24gR29sZHNjaG1pZHQgPHNpbW9uLmsuci5nb2xkc2NobWlk
dEBnbWFpbC5jb20+Cj4gQ2M6IFN0ZWZhbiBSb2VzZSA8c3RlZmFuLnJvZXNlQG1haWxib3gub3Jn
Pgo+IENjOiBTdnlhdG9zbGF2IFJ5aGVsIDxjbGFtb3I5NUBnbWFpbC5jb20+Cj4gQ2M6IFRoaWVy
cnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Cj4gQ2M6IFRpZW4gRm9uZyBDaGVlIDx0aWVu
LmZvbmcuY2hlZUBhbHRlcmEuY29tPgo+IENjOiB1LWJvb3QtYW1sb2dpY0Bncm91cHMuaW8KPiBD
YzogdWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQo+IENjOiB1LWJvb3Qt
cWNvbUBncm91cHMuaW8KPiBDYzogbGludXhAYW5hbG9nLmNvbQo+IC0tLQo+ICAgYXJjaC94ODYv
Y3B1L2Jyb2Fkd2VsbC9zZHJhbS5jICAgICAgICAgICAgIHwgMiArLQo+ICAgYXJjaC94ODYvY3B1
L2l2eWJyaWRnZS9lYXJseV9tZS5jICAgICAgICAgIHwgMiArLQo+ICAgYm9hcmQvbGllYmhlcnIv
YnR0L2J0dC5jICAgICAgICAgICAgICAgICAgIHwgMiArLQo+ICAgYm9hcmQvbGllYmhlcnIveGVh
L3hlYS5jICAgICAgICAgICAgICAgICAgIHwgMiArLQo+ICAgZHJpdmVycy9ibG9jay9lZmlfYmxr
LmMgICAgICAgICAgICAgICAgICAgIHwgMiArLQo+ICAgZHJpdmVycy9jbGsvYXQ5MS9jb21wYXQu
YyAgICAgICAgICAgICAgICAgIHwgNCArKy0tCj4gICBkcml2ZXJzL2Nsay9hdDkxL3Nja2MuYyAg
ICAgICAgICAgICAgICAgICAgfCAyICstCj4gICBkcml2ZXJzL2Nsay9tZXNvbi9hMS5jICAgICAg
ICAgICAgICAgICAgICAgfCAyICstCj4gICBkcml2ZXJzL2Nsay9tZXNvbi9neGJiLmMgICAgICAg
ICAgICAgICAgICAgfCAyICstCj4gICBkcml2ZXJzL2Nsay9udXZvdG9uL2Nsa19ucGNtN3h4LmMg
ICAgICAgICAgfCAyICstCj4gICBkcml2ZXJzL2Nsay9udXZvdG9uL2Nsa19ucGNtOHh4LmMgICAg
ICAgICAgfCAyICstCj4gICBkcml2ZXJzL2Nsay9zdG0zMi9jbGstc3RtMzJtcDEzLmMgICAgICAg
ICAgfCAyICstCj4gICBkcml2ZXJzL2RtYS90aS9rMy11ZG1hLmMgICAgICAgICAgICAgICAgICAg
fCAyICstCj4gICBkcml2ZXJzL2kyYy90ZWdyYTE4Nl9icG1wX2kyYy5jICAgICAgICAgICAgfCAy
ICstCj4gICBkcml2ZXJzL21tYy9iY20yODM1X3NkaGNpLmMgICAgICAgICAgICAgICAgfCAyICst
Cj4gICBkcml2ZXJzL21tYy9mc2xfZXNkaGNfaW14LmMgICAgICAgICAgICAgICAgfCAyICstCj4g
ICBkcml2ZXJzL21tYy9yb2NrY2hpcF9zZGhjaS5jICAgICAgICAgICAgICAgfCAyICstCj4gICBk
cml2ZXJzL25ldC9jYWx4ZWRheGdtYWMuYyAgICAgICAgICAgICAgICAgfCAyICstCj4gICBkcml2
ZXJzL25ldC9kd2NfZXRoX3hnbWFjLmMgICAgICAgICAgICAgICAgfCAyICstCj4gICBkcml2ZXJz
L25ldC9xZS9kbV9xZV91ZWNfcGh5LmMgICAgICAgICAgICAgfCAyICstCj4gICBkcml2ZXJzL25l
dC9zbmlfbmV0c2VjLmMgICAgICAgICAgICAgICAgICAgfCAyICstCj4gICBkcml2ZXJzL3BpbmN0
cmwvbWVzb24vcGluY3RybC1tZXNvbi1nMTJhLmMgfCAyICstCj4gICBkcml2ZXJzL3BpbmN0cmwv
dGVncmEvcGluY3RybC10ZWdyYTIwLmMgICAgfCA0ICsrLS0KPiAgIGRyaXZlcnMvcmVzZXQvc3Rt
MzIvc3RtMzItcmVzZXQtbXAxLmMgICAgICB8IDIgKy0KPiAgIGRyaXZlcnMvc3BpL2tpcmt3b29k
X3NwaS5jICAgICAgICAgICAgICAgICB8IDQgKystLQo+ICAgZHJpdmVycy9zcGkvbXZlYnVfYTM3
MDBfc3BpLmMgICAgICAgICAgICAgIHwgNCArKy0tCj4gICBkcml2ZXJzL3N5c3Jlc2V0L3N5c3Jl
c2V0X3NvY2ZwZ2Ffc29jNjQuYyAgfCAyICstCj4gICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtbWVz
b24tZzEyYS5jICAgICAgICAgfCAyICstCj4gICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtbWVzb24t
Z3hsLmMgICAgICAgICAgfCAyICstCj4gICBkcml2ZXJzL3VzYi9ob3N0L2VoY2ktZXh5bm9zLmMg
ICAgICAgICAgICAgfCAyICstCj4gICBkcml2ZXJzL3VzYi9ob3N0L2VoY2ktbXNtLmMgICAgICAg
ICAgICAgICAgfCAyICstCj4gICBkcml2ZXJzL3VzYi9ob3N0L2VoY2ktdGVncmEuYyAgICAgICAg
ICAgICAgfCAyICstCj4gICBkcml2ZXJzL3VzYi9ob3N0L2VoY2ktdmYuYyAgICAgICAgICAgICAg
ICAgfCAyICstCj4gICBkcml2ZXJzL3VzYi9ob3N0L29oY2ktZGE4eHguYyAgICAgICAgICAgICAg
fCAyICstCj4gICBkcml2ZXJzL3VzYi9tdXNiLW5ldy9waWMzMi5jICAgICAgICAgICAgICAgfCAy
ICstCj4gICBkcml2ZXJzL3VzYi9tdXNiLW5ldy9zYzV4eC5jICAgICAgICAgICAgICAgfCAyICst
Cj4gICBkcml2ZXJzL3VzYi9tdXNiLW5ldy9zdW54aS5jICAgICAgICAgICAgICAgfCAyICstCj4g
ICBkcml2ZXJzL3ZpZGVvL3JvY2tjaGlwL3JrMzI4OF9taXBpLmMgICAgICAgfCA0ICsrLS0KPiAg
IGRyaXZlcnMvdmlkZW8vcm9ja2NoaXAvcmszMzk5X21pcGkuYyAgICAgICB8IDQgKystLQo+ICAg
ZHJpdmVycy93YXRjaGRvZy9hcm1fc21jX3dkdC5jICAgICAgICAgICAgIHwgMiArLQo+ICAgNDAg
ZmlsZXMgY2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygrKSwgNDYgZGVsZXRpb25zKC0pCgpSZXZpZXdl
ZC1ieTogSGVpa28gU2Nob2NoZXIgPGhzQG5hYmxhZGV2LmNvbT4KCmJ5ZSwKSGVpa28KLS0gCk5h
YmxhIFNvZnR3YXJlIEVuZ2luZWVyaW5nCkhSQiA0MDUyMiBBdWdzYnVyZwpQaG9uZTogKzQ5IDgy
MSA0NTU5MjU5NgpFLU1haWw6IG9mZmljZUBuYWJsYWRldi5jb20KR2VzY2jDpGZ0c2bDvGhyZXIg
OiBTdGVmYW5vIEJhYmljCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
