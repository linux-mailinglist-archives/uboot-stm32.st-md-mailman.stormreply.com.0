Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A504D6926
	for <lists+uboot-stm32@lfdr.de>; Fri, 11 Mar 2022 20:39:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7CB16C628A7;
	Fri, 11 Mar 2022 19:39:33 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54B26C628A4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Mar 2022 19:39:32 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id gb39so21103937ejc.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Mar 2022 11:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=V5IVIsx4msUHyfPB+pEYGKt675fQD+YezlsXMf/hfiM=;
 b=Ycue28VWbZt3MKLMdvoblYA/kF7gJUg+aDaPLSABJEqwpdKLGxHoFx3iZ/atis1u/n
 rsoTF+N3T/lfWOHU8av3KDCvfs0iRchWOjp1FIcRpN51iqeQXbAYCdtfL0VDsj5ogM2k
 9kFAhGivIWzzIdxH1GN8rYNbcHj+vlX/oOWfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=V5IVIsx4msUHyfPB+pEYGKt675fQD+YezlsXMf/hfiM=;
 b=0Cg6LnHghipPepzb8iFho0LX0z/gKmRNm7PRPFyoiecWaVmMkJ3TZES8tqf2qKwBfd
 xdyclV8ZkZBqlU28d98+xPp0FEpB52W+5thfJrJ5fEr8ESALIWOVLtoDnPBlikvWttxi
 biECCPilDklgzUU7+LFD2EDuEG2r29sxTYQbkySj+/2k9czuDjdzHBFLhUXjQ7+azs1P
 7V98JVpRJFA4KikuegDA8uxc6ImmwZvp5JrtzXrDFI9EPcEhIDvXOmglQMfGBraTaDOn
 Y7oDx54iMnzedi94ngpa9K+BV3YfaNtue21mnzjoejYlaOEUHcHkcOcU08a2wK3cpaOW
 30Ww==
X-Gm-Message-State: AOAM531AiMJCKabcOTgz5Z6NATJVSr2N4W0NCfIr+PSCp7U/iG5+cj5A
 FYzF2GQWX+v3Q+7Rs1yiv4kUrcRC1XfOaCGWE5MXoQ==
X-Google-Smtp-Source: ABdhPJwQRD3JrEYfsbPe037zHos9mnR5QBrzK0aBaGKNWOtmw7EFNwfkErjN8NsXxhiKSYJQ+YJq6yptNVlaeb0AoYM=
X-Received: by 2002:a17:906:58d6:b0:6da:bc08:af7 with SMTP id
 e22-20020a17090658d600b006dabc080af7mr10009624ejs.537.1647027571812; Fri, 11
 Mar 2022 11:39:31 -0800 (PST)
MIME-Version: 1.0
References: <20220307185028.v3.1.Ia4144ff459c53ba75870c1c488361bced44be7ea@changeid>
In-Reply-To: <20220307185028.v3.1.Ia4144ff459c53ba75870c1c488361bced44be7ea@changeid>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Sat, 12 Mar 2022 01:09:20 +0530
Message-ID: <CAMty3ZAZAYO1Xqd=5+Wphkpc5ejg6PNY2oCoWVc9vL+vtA76Tg@mail.gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Vignesh R <vigneshr@ti.com>, Masami Hiramatsu <masami.hiramatsu@linaro.org>,
 Sean Anderson <seanga2@gmail.com>, Joe Hershberger <joe.hershberger@ni.com>,
 Chaitanya Sakinam <chaitanya.sakinam@nxp.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Marek Vasut <marex@denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Lukasz Majewski <lukma@denx.de>,
 Marek Behun <marek.behun@nic.cz>, Ramon Fried <rfried.dev@gmail.com>,
 Konstantin Porotchkin <kostap@marvell.com>, Biwen Li <biwen.li@nxp.com>,
 Wolfgang Denk <wd@denx.de>, Anji J <anji.jagarlmudi@nxp.com>,
 Jassi Brar <jaswinder.singh@linaro.org>, Igal Liberman <igall@marvell.com>,
 u-boot@lists.denx.de, Priyanka Jain <priyanka.jain@nxp.com>,
 Simon Glass <sjg@chromium.org>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [Uboot-stm32] [PATCH v3] spi: spi_flash_probe_bus_cs() rely on
 DT for spi speed and mode
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

SGkgUGF0cmljZSwKCk9uIE1vbiwgTWFyIDcsIDIwMjIgYXQgMTE6MjAgUE0gUGF0cmljZSBDaG90
YXJkCjxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+IHdyb3RlOgo+Cj4gU2luY2UgY29tbWl0
IGUyZTk1ZTVlMjU0MiAoInNwaTogVXBkYXRlIHNwZWVkL21vZGUgb24gY2hhbmdlIikKPiB3aGVu
IGNhbGxpbmcgInNmIHByb2JlIiBvciAiZW52IHNhdmUiIG9uIFNQSSBmbGFzaCwKPiBzcGlfc2V0
X3NwZWVkX21vZGUoKSBpcyBjYWxsZWQgdHdpY2UuCj4KPiBzcGlfZ2V0X2J1c19hbmRfY3MoKQo+
ICAgICAgIHwtLT4gc3BpX2NsYWltX2J1cygpCj4gICAgICAgfCAgICAgICB8LS0+IHNwaV9zZXRf
c3BlZWRfbW9kZShzcGVlZCBhbmQgbW9kZSBmcm9tIERUKQo+ICAgICAgIC4uLgo+ICAgICAgIHwt
LT4gc3BpX3NldF9zcGVlZF9tb2RlKGRlZmF1bHQgc3BlZWQgYW5kIG1vZGUgdmFsdWUpCj4KPiBU
aGUgZmlyc3Qgc3BpX3NldF9zcGVlZF9tb2RlKCkgY2FsbCBpcyBkb25lIHdpdGggc3BlZWQgYW5k
IG1vZGUKPiB2YWx1ZXMgZnJvbSBEVCwgd2hlcmVhcyB0aGUgc2Vjb25kIGNhbGwgaXMgZG9uZSB3
aXRoIHNwZWVkCj4gYW5kIG1vZGUgc2V0IHRvIGRlZmF1bHQgdmFsdWUgKHNwZWVkIGlzIHNldCB0
byBDT05GSUdfU0ZfREVGQVVMVF9TUEVFRCkKPgo+IFRoaXMgaXMgYW4gaXNzdWUgYmVjYXVzZSBT
UEkgZmxhc2ggcGVyZm9ybWFuY2UgYXJlIGltcGFjdGVkIGJ5Cj4gdXNpbmcgZGVmYXVsdCBzcGVl
ZCB3aGljaCBjYW4gYmUgbG93ZXIgdGhhbiB0aGUgb25lIGRlZmluZWQgaW4gRFQuCj4KPiBPbmUg
c29sdXRpb24gaXMgdG8gc2V0IENPTkZJR19TRl9ERUZBVUxUX1NQRUVEIHRvIHRoZSBzcGVlZCBk
ZWZpbmVkCj4gaW4gRFQsIGJ1dCB3ZSBsb29zZSBmbGV4aWJpbGl0eSBvZmZlcmVkIGJ5IERULgo+
Cj4gQW5vdGhlciBpc3N1ZSBjYW4gYmUgZW5jb3VudGVyZWQgd2l0aCAyIFNQSSBmbGFzaGVzIHVz
aW5nIDIgZGlmZmVyZW50Cj4gc3BlZWRzLiBJbiB0aGlzIHNwZWNpZmljIGNhc2UgdXNhZ2Ugb2Yg
Q09ORklHX1NGX0RFRkFVTFRfU1BFRUQgaXMgbm90Cj4gZmxleGlibGUgY29tcGFyZWQgdG8gZ2V0
IHRoZSAyIGRpZmZlcmVudCBzcGVlZHMgZnJvbSBEVC4KPgo+IFRvIGZpeCB0aGlzIGlzc3VlLCB0
aGUgbGVnYWN5IHNwaV9nZXRfYnVzX2FuZF9jcygpIGlzIHJlbmFtZWQgdG8KPiBfc3BpX2dldF9i
dXNfYW5kX2NzKCkgYW5kIGtlZXAgdGhlIHNhbWUgYmVoYXZpb3VyLgo+IEFkZCBhIG5ldyBzcGlf
Z2V0X2J1c19hbmRfY3MoKSB3aGljaCByZWx5IG9uIERUIGZvciBzcGkgc3BlZWQgYW5kIG1vZGUK
PiB2YWx1ZXMuCj4KPiBOb3csIHNwaV9mbGFzaF9wcm9iZV9idXNfY3MoKSByZWxpZXMgb24gRFQg
Zm9yIHNwaSBzcGVlZCBhbmQgbW9kZQo+IGFuZCBsb2dpY2FsbHkgY2FsbHMgc3BpX2dldF9idXNf
YW5kX2NzKCkuIEluIGNhc2Ugc3BpIG1vZGUgYW5kIHNwZWVkIGFyZQo+IG5vdCByZWFkIGZyb20g
RFQsIG1ha2UgdXNhZ2Ugb2Ygc3BpX2ZsYXNoX3Byb2JlKCkuCj4gVGhpcyBwYXRjaCBpbXBhY3Rz
IHRoZSBmb2xsb3dpbmcgOgo+ICAgLSBjbWQvc2YuYzogaWYgc3BpIG1vZGUgYW5kL29yIHNwZWVk
IGlzIHBhc3NlZCBpbiBhcmd1bWVudCwgY2FsbAo+ICAgICBzcGlfZmxhc2hfcHJvYmUoKSBvdGhl
cndpc2UgY2FsbCBzcGlfZmxhc2hfcHJvYmVfYnVzX2NzKCkuCj4KPiAgIF8gY21kL3NwaS5jOiBr
ZWVwIGxlZ2FjeSwgcmVwbGFjZSBzcGlfZ2V0X2J1c19hbmRfY3MoKSBieQo+ICAgICBfc3BpX2dl
dF9idXNfYW5kX2NzKCkKPgo+ICAgXyBkcml2ZXJzL25ldC9mbS9mbS5jOiBubyBpbXBhY3QgYXMg
YnkgZGVmYXVsdCBzcGkgc3BlZWQgYW5kIG1vZGUKPiAgICAgd2FzIHNldCB0byAwIGFuZCBhIGNv
bW1lbnQgaW5kaWNhdGVzIHRoYXQgc3BlZWQgYW5kIG1vZGUgYXJlIHJlYWQKPiAgICAgZnJvbSBE
VC4KPgo+ICAgXyBkcml2ZXJzL25ldC9wZmVfZXRoL3BmZV9maXJtd2FyZS5jOiBzcGkgc3BlZWQg
YW5kIG1vZGUgYXJlIG5vdCByZWFkCj4gICAgIGZyb20gRFQgYnkgYWxsIHBsYXRmb3JtcyB1c2lu
ZyB0aGlzIGRyaXZlciwgc28ga2VlcCBsZWdhY3kgYW5kIHJlcGxhY2UKPiAgICAgc3BpX2ZsYXNo
X3Byb2JlX2J1c19jcygpIGJ5IHNwaV9mbGFzaF9wcm9iZSgpOwo+Cj4gICBfIGRyaXZlcnMvdXNi
L2dhZGdldC9tYXgzNDIwX3VkYy5jOiBzcGkgc3BlZWQgYW5kIG1vZGUgYXJlIG5vdCByZWFkCj4g
ICAgIGZyb20gRFQsIGtlZXAgbGVnYWN5LCByZXBsYWNlIHNwaV9nZXRfYnVzX2FuZF9jcygpIGJ5
Cj4gICAgIF9zcGlfZ2V0X2J1c19hbmRfY3MoKQo+Cj4gICBfIGRyaXZlcnMvbmV0L3NuaV9uZXRz
ZWMuYyA6IHNwaSBzcGVlZCBhbmQgbW9kZSBhcmUgbm90IHJlYWQgZnJvbSBEVCwKPiAgICAgc28g
cmVwbGFjZSBzcGlfZmxhc2hfcHJvYmVfYnVzX2NzKCkgYnkgc3BpX2ZsYXNoX3Byb2JlKCkuCj4K
PiAgIF8gZHJpdmVycy91c2IvZ2FkZ2V0L21heDM0MjBfdWRjLmM6IENhbid0IGZpbmQgYW55IHBs
YXRmb3JtIHdoaWNoIG1ha2UKPiAgICAgdXNhZ2Ugb2YgdGhpcyBkcml2ZXIsIG5ldmVydGhlbGVz
cywga2VlcCBsZWdhY3kgYW5kIHJlcGxhY2UKPiAgICAgc3BpX2dldF9idXNfYW5kX2NzKCkgYnkg
X3NwaV9nZXRfYnVzX2FuZF9jcygpLgo+Cj4gICBfIGVudi9zZi5jOiBubyBpbXBhY3QsIGFzIGJ5
IGRlZmF1bHQgc3BpIHNwZWVkIGFuZCBtb2RlCj4gICAgIHdhcyBzZXQgdG8gMCBhbmQgYSBjb21t
ZW50IGluZGljYXRlcyB0aGF0IHNwZWVkIGFuZCBtb2RlIGFyZSByZWFkCj4gICAgIGZyb20gRFQu
Cj4KPiAgIC0gdXBkYXRlIHRlc3QvZG0vc3BpLmM6IHdoZW4gc3BpX2dldF9idXNfYW5kX2NzKCkg
d2FzIHVzZWQgd2lodG91dAo+ICAgICBkcml2ZXIgYW5kIGRldmljZSBuYW1lLCBubyBjaGFuZ2Uu
Cj4gICAgIFdoZW4gc3BpX2dldF9idXNfYW5kX2NzKCkgd2FzIHVzZWQgd2l0aCBkcml2ZXIgYW5k
IGRldmljZSBuYW1lLAo+ICAgICB1c2UgdGhlIGxlZ2FjeSBieSBjYWxsaW5nIF9zcGlfZ2V0X2J1
c19hbmRfY3MoKS4KPgo+IENjOiBNYXJlayBCZWh1biA8bWFyZWsuYmVodW5AbmljLmN6Pgo+IENj
OiBKYWdhbiBUZWtpIDxqYWdhbkBhbWFydWxhc29sdXRpb25zLmNvbT4KPiBDYzogVmlnbmVzaCBS
IDx2aWduZXNockB0aS5jb20+Cj4gQ2M6IEpvZSBIZXJzaGJlcmdlciA8am9lLmhlcnNoYmVyZ2Vy
QG5pLmNvbT4KPiBDYzogUmFtb24gRnJpZWQgPHJmcmllZC5kZXZAZ21haWwuY29tPgo+IENjOiBM
dWthc3ogTWFqZXdza2kgPGx1a21hQGRlbnguZGU+Cj4gQ2M6IE1hcmVrIFZhc3V0IDxtYXJleEBk
ZW54LmRlPgo+IENjOiBXb2xmZ2FuZyBEZW5rIDx3ZEBkZW54LmRlPgo+IENjOiBTaW1vbiBHbGFz
cyA8c2pnQGNocm9taXVtLm9yZz4KPiBDYzogU3RlZmFuIFJvZXNlIDxzckBkZW54LmRlPgo+IENj
OiAiUGFsaSBSb2jDoXIiIDxwYWxpQGtlcm5lbC5vcmc+Cj4gQ2M6IEtvbnN0YW50aW4gUG9yb3Rj
aGtpbiA8a29zdGFwQG1hcnZlbGwuY29tPgo+IENjOiBJZ2FsIExpYmVybWFuIDxpZ2FsbEBtYXJ2
ZWxsLmNvbT4KPiBDYzogQmluIE1lbmcgPGJtZW5nLmNuQGdtYWlsLmNvbT4KPiBDYzogUHJhdHl1
c2ggWWFkYXYgPHAueWFkYXZAdGkuY29tPgo+IENjOiBTZWFuIEFuZGVyc29uIDxzZWFuZ2EyQGdt
YWlsLmNvbT4KPiBDYzogQW5qaSBKIDxhbmppLmphZ2FybG11ZGlAbnhwLmNvbT4KPiBDYzogQml3
ZW4gTGkgPGJpd2VuLmxpQG54cC5jb20+Cj4gQ2M6IFByaXlhbmthIEphaW4gPHByaXlhbmthLmph
aW5AbnhwLmNvbT4KPiBDYzogQ2hhaXRhbnlhIFNha2luYW0gPGNoYWl0YW55YS5zYWtpbmFtQG54
cC5jb20+Cj4KPiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFy
ZEBmb3NzLnN0LmNvbT4KPiAtLS0KCkxvb2sgbGlrZSB0aGlzIHBhdGNoIGNvbWJpbmVkIG1hbnkg
Y2hhbmdlcyB0b2dldGhlciwgcGxlYXNlIHNlcGFyYXRlCml0IGFuZCBzZW5kIGl0IGFzIGEgc2Vy
aWVzIHRoYXQgd291bGQgaGVscCB0byByZXZpZXcgcHJvcHBlcmx5LgoKVGhhbmtzLApKYWdhbi4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3Rt
MzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJv
b3Qtc3RtMzIK
