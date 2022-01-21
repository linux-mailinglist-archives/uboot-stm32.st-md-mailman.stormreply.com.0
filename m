Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 102BA4961E8
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jan 2022 16:20:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8D25C5F1EB;
	Fri, 21 Jan 2022 15:20:50 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74640C5F1EA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jan 2022 15:20:49 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id s9so13904024oib.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jan 2022 07:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7WE8vQ3Bc9r4U7YCt84ml1T8BCdAnpZOMcGwYGvIhcE=;
 b=DpdDaH8lH3ux0zkHyWcQZ1e92DWSZCa0lil+yCt722QWFlhAOGaOq/ivoPCj0ctq1H
 +SHAVG7WndO5SHEeBHICMYejzw2HxDJsLFR2M+V/nCGeUY2g4Cxb1HuH6wGPxj2GdCJV
 +Ar8Z/noRYvZmOXtko/OcLyQQqUAAiRKIPAAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7WE8vQ3Bc9r4U7YCt84ml1T8BCdAnpZOMcGwYGvIhcE=;
 b=24wd0m0G7eksIWClXnrtoA/2tDQyMMf7tujXPPbEWUuq9IHurQ1NLDsLSf2OJ2b7Ug
 Ie5VvcNfsywoMzwGHFvbSa3DV9J/W8lNPOqqOsgGFKdgWr7P90BS2FLJ9rLD+7m4XONO
 Bjb7BCUlRy/qnYmntAHQkEXsEckGLGGjBCej3L+ITh0aLshlYBfDNg6Ex/PtoERudGNh
 3TFy+jTvkfogFrRtRH7mhQgNpicoNYMZcdkJq9kW4oeXYxXZGAbfwlb5Te7P4r8JXZT6
 b0wWMFJ+1O7MtS8vQTSYxIpSkH73km5/HXs59MDvR6SfuR8xM6enheubYmmr8/ger3VB
 mfzQ==
X-Gm-Message-State: AOAM530DbZKpCHavNHy1BTgcBY6I/q0L2kGPfGTTmScpTyhWdvyMu+/D
 wpxyFa30U/iUEQYxlOjckJQiDQgbOs7ntJeEP0SN8A==
X-Google-Smtp-Source: ABdhPJwe10DGc1koi+HK+qssxyPkpZcmKGRnBvl8nLqp3Un2r//1j/5816xAbRCr+3921pSmCs91j5EkCtiNM7UrjdM=
X-Received: by 2002:a05:6808:b38:: with SMTP id
 t24mr925100oij.25.1642778448009; 
 Fri, 21 Jan 2022 07:20:48 -0800 (PST)
MIME-Version: 1.0
References: <20220112105908.7388-1-patrice.chotard@foss.st.com>
In-Reply-To: <20220112105908.7388-1-patrice.chotard@foss.st.com>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 21 Jan 2022 08:20:35 -0700
Message-ID: <CAPnjgZ0rq==OQPJHgfdd_2q58dH2Z+O_E0+KhnD4Ykk9FSLfmg@mail.gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Vignesh R <vigneshr@ti.com>, Masami Hiramatsu <masami.hiramatsu@linaro.org>,
 Sean Anderson <seanga2@gmail.com>, Joe Hershberger <joe.hershberger@ni.com>,
 Chaitanya Sakinam <chaitanya.sakinam@nxp.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Marek Vasut <marex@denx.de>,
 Lukasz Majewski <lukma@denx.de>, Marek Behun <marek.behun@nic.cz>,
 Ramon Fried <rfried.dev@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Konstantin Porotchkin <kostap@marvell.com>, Biwen Li <biwen.li@nxp.com>,
 Wolfgang Denk <wd@denx.de>, Anji J <anji.jagarlmudi@nxp.com>,
 Jassi Brar <jaswinder.singh@linaro.org>, Igal Liberman <igall@marvell.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Priyanka Jain <priyanka.jain@nxp.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [Uboot-stm32] [PATCH] spi: Add spi_get_bus_and_cs() new use_dt
	param
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

SGkgUGF0cmljZSwKCk9uIFdlZCwgMTIgSmFuIDIwMjIgYXQgMDM6NTksIFBhdHJpY2UgQ2hvdGFy
ZAo8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPiB3cm90ZToKPgo+IEFkZCBzcGlfZmxhc2hf
cHJvYmVfYnVzX2NzKCkgYW5kIHNwaV9nZXRfYnVzX2FuZF9jcygpIG5ldyAidXNlX2R0Igo+IHBh
cmFtIHdoaWNoIGFsbG93cyB0byBzZWxlY3QgU1BJIHNwZWVkIGFuZCBtb2RlIGZyb20gRFQgb3Ig
ZnJvbQo+IGRlZmF1bHQgdmFsdWUgcGFzc2VkIGluIHBhcmFtZXRlcnMuCj4KPiBTaW5jZSBjb21t
aXQgZTJlOTVlNWUyNTQyICgic3BpOiBVcGRhdGUgc3BlZWQvbW9kZSBvbiBjaGFuZ2UiKQo+IHdo
ZW4gY2FsbGluZyAic2YgcHJvYmUiIG9yICJlbnYgc2F2ZSIgb24gU1BJIGZsYXNoLAo+IHNwaV9z
ZXRfc3BlZWRfbW9kZSgpIGlzIGNhbGxlZCB0d2ljZS4KPgo+IHNwaV9nZXRfYnVzX2FuZF9jcygp
Cj4gICAgICAgfC0tPiBzcGlfY2xhaW1fYnVzKCkKPiAgICAgICB8ICAgICAgIHwtLT4gc3BpX3Nl
dF9zcGVlZF9tb2RlKHNwZWVkIGFuZCBtb2RlIGZyb20gRFQpCj4gICAgICAgLi4uCj4gICAgICAg
fC0tPiBzcGlfc2V0X3NwZWVkX21vZGUoZGVmYXVsdCBzcGVlZCBhbmQgbW9kZSB2YWx1ZSkKPgo+
IFRoZSBmaXJzdCBzcGlfc2V0X3NwZWVkX21vZGUoKSBjYWxsIGlzIGRvbmUgd2l0aCBzcGVlZCBh
bmQgbW9kZQo+IHZhbHVlcyBmcm9tIERULCB3aGVyZWFzIHRoZSBzZWNvbmQgY2FsbCBpcyBkb25l
IHdpdGggc3BlZWQKPiBhbmQgbW9kZSBzZXQgdG8gZGVmYXVsdCB2YWx1ZSAoc3BlZWQgaXMgc2V0
IHRvIENPTkZJR19TRl9ERUZBVUxUX1NQRUVEKQo+Cj4gVGhpcyBpcyBhbiBpc3N1ZSBiZWNhdXNl
IFNQSSBmbGFzaCBwZXJmb3JtYW5jZSBhcmUgaW1wYWN0ZWQgYnkKPiB1c2luZyBkZWZhdWx0IHNw
ZWVkIHdoaWNoIGNhbiBiZSBsb3dlciB0aGFuIHRoZSBvbmUgZGVmaW5lZCBpbiBEVC4KPgo+IE9u
ZSBzb2x1dGlvbiBpcyB0byBzZXQgQ09ORklHX1NGX0RFRkFVTFRfU1BFRUQgdG8gdGhlIHNwZWVk
IGRlZmluZWQKPiBpbiBEVCwgYnV0IHdlIGxvb3NlIGZsZXhpYmlsaXR5IG9mZmVyZWQgYnkgRFQu
Cj4KPiBBbm90aGVyIGlzc3VlIGNhbiBiZSBlbmNvdW50ZXJlZCB3aXRoIDIgU1BJIGZsYXNoZXMg
dXNpbmcgMiBkaWZmZXJlbnQKPiBzcGVlZHMuIEluIHRoaXMgc3BlY2lmaWMgY2FzZSB1c2FnZSBv
ZiBDT05GSUdfU0ZfREVGQVVMVF9TUEVFRCBpcyBub3QKPiBmbGV4aWJsZSBjb21wYXJlZCB0byBn
ZXQgdGhlIDIgZGlmZmVyZW50IHNwZWVkcyBmcm9tIERULgo+Cj4gQnkgYWRkaW5nIG5ldyBwYXJh
bWV0ZXIgInVzZV9kdCIgdG8gc3BpX2ZsYXNoX3Byb2JlX2J1c19jcygpIGFuZCB0bwo+IHNwaV9n
ZXRfYnVzX2FuZF9jcygpLCB0aGlzIGFsbG93cyB0byBmb3JjZSB1c2FnZSBvZiBlaXRoZXIgc3Bl
ZWQgYW5kCj4gbW9kZSBmcm9tIERUICh1c2VfZHQgPSB0cnVlKSBvciB0byB1c2Ugc3BlZWQgYW5k
IG1vZGUgcGFyYW1ldGVyIHZhbHVlLgo+Cj4gU2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJk
IDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4gQ2M6IE1hcmVrIEJlaHVuIDxtYXJlay5i
ZWh1bkBuaWMuY3o+Cj4gQ2M6IEphZ2FuIFRla2kgPGphZ2FuQGFtYXJ1bGFzb2x1dGlvbnMuY29t
Pgo+IENjOiBWaWduZXNoIFIgPHZpZ25lc2hyQHRpLmNvbT4KPiBDYzogSm9lIEhlcnNoYmVyZ2Vy
IDxqb2UuaGVyc2hiZXJnZXJAbmkuY29tPgo+IENjOiBSYW1vbiBGcmllZCA8cmZyaWVkLmRldkBn
bWFpbC5jb20+Cj4gQ2M6IEx1a2FzeiBNYWpld3NraSA8bHVrbWFAZGVueC5kZT4KPiBDYzogTWFy
ZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+Cj4gQ2M6IFdvbGZnYW5nIERlbmsgPHdkQGRlbnguZGU+
Cj4gQ2M6IFNpbW9uIEdsYXNzIDxzamdAY2hyb21pdW0ub3JnPgo+IENjOiBTdGVmYW4gUm9lc2Ug
PHNyQGRlbnguZGU+Cj4gQ2M6ICJQYWxpIFJvaMOhciIgPHBhbGlAa2VybmVsLm9yZz4KPiBDYzog
S29uc3RhbnRpbiBQb3JvdGNoa2luIDxrb3N0YXBAbWFydmVsbC5jb20+Cj4gQ2M6IElnYWwgTGli
ZXJtYW4gPGlnYWxsQG1hcnZlbGwuY29tPgo+IENjOiBCaW4gTWVuZyA8Ym1lbmcuY25AZ21haWwu
Y29tPgo+IENjOiBQcmF0eXVzaCBZYWRhdiA8cC55YWRhdkB0aS5jb20+Cj4gQ2M6IFNlYW4gQW5k
ZXJzb24gPHNlYW5nYTJAZ21haWwuY29tPgo+IENjOiBBbmppIEogPGFuamkuamFnYXJsbXVkaUBu
eHAuY29tPgo+IENjOiBCaXdlbiBMaSA8Yml3ZW4ubGlAbnhwLmNvbT4KPiBDYzogUHJpeWFua2Eg
SmFpbiA8cHJpeWFua2EuamFpbkBueHAuY29tPgo+IENjOiBDaGFpdGFueWEgU2FraW5hbSA8Y2hh
aXRhbnlhLnNha2luYW1AbnhwLmNvbT4KPiAtLS0KPgo+ICBib2FyZC9DWi5OSUMvdHVycmlzX21v
eC90dXJyaXNfbW94LmMgfCAgMiArLQo+ICBjbWQvc2YuYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgNSArKysrLQo+ICBjbWQvc3BpLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgMiArLQo+ICBkcml2ZXJzL210ZC9zcGkvc2YtdWNsYXNzLmMgICAgICAgICAgfCAgOCArKysr
LS0tLQo+ICBkcml2ZXJzL25ldC9mbS9mbS5jICAgICAgICAgICAgICAgICAgfCAgNSArKystLQo+
ICBkcml2ZXJzL25ldC9wZmVfZXRoL3BmZV9maXJtd2FyZS5jICAgfCAgMiArLQo+ICBkcml2ZXJz
L25ldC9zbmlfbmV0c2VjLmMgICAgICAgICAgICAgfCAgMyArKy0KPiAgZHJpdmVycy9zcGkvc3Bp
LXVjbGFzcy5jICAgICAgICAgICAgIHwgIDggKysrKy0tLS0KPiAgZHJpdmVycy91c2IvZ2FkZ2V0
L21heDM0MjBfdWRjLmMgICAgIHwgIDIgKy0KPiAgZW52L3NmLmMgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDIgKy0KPiAgaW5jbHVkZS9zcGkuaCAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDkgKysrKystLS0tCj4gIGluY2x1ZGUvc3BpX2ZsYXNoLmggICAgICAgICAgICAgICAgICB8
ICAyICstCj4gIHRlc3QvZG0vc3BpLmMgICAgICAgICAgICAgICAgICAgICAgICB8IDE1ICsrKysr
KysrLS0tLS0tLQo+ICAxMyBmaWxlcyBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspLCAyOSBkZWxl
dGlvbnMoLSkKCkkgdGhpbmsgdGhpcyBpcyBhIGdvb2QgaWRlYSwgYnV0IHNob3VsZCB1c2UgYSBz
ZXBhcmF0ZSBmdW5jdGlvbiBuYW1lCmluc3RlYWQgb2YgYWRkaW5nIGFuIGFyZ3VtZW50LCBzaW5j
ZSBpdCBkb2Vzbid0IG1ha2Ugc2Vuc2UgdG8gcGFzcwpwYXJhbWV0ZXJzIHRoYXQgYXJlIGlnbm9y
ZWQuCgpBbHNvIHdlIHNob3VsZCBwcm9iYWJseSBoYXZlIGRldmljZXRyZWUgYXMgdGhlIGRlZmF1
bHQgKHRoZSBiYXNlIGZ1bmN0aW9uIG5hbWUpLgoKUmVnYXJkcywKU2ltb24KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBs
aXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
