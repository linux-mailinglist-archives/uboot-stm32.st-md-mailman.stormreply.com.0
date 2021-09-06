Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEA0402150
	for <lists+uboot-stm32@lfdr.de>; Tue,  7 Sep 2021 00:40:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41C3BC597B6;
	Mon,  6 Sep 2021 22:40:02 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com
 [209.85.161.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6002EC57189
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Sep 2021 22:40:00 +0000 (UTC)
Received: by mail-oo1-f49.google.com with SMTP id
 q26-20020a4adc5a000000b002918a69c8eeso2186696oov.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Sep 2021 15:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=W8s0Y6PXpVq5HJWe3jhqpN4nXeyn3ufVbxJOkvH51pQ=;
 b=coWUsT/HJw8Tj8CNW3ONKvwEnwncjBOYumh1boQkReb7hN5uYpeCP3mE2dKmOLoteW
 WDKLb0Tjczmk1RTIO1ZGsev89Kw3zn4DJ4GXMjVhbC5pO2m2wszZq/2sJkNfHdwbUFr3
 OXMPFlIDSDLW6CO8xUtBqLAL4hKhdVzRcvKgEwHP8DqsXrE+/WZ0vbGZD6FLoxXML0cj
 hy1rop35iAXTFtZ8K4WZB+oq1oF/IemUov4qYGuMr+guV9hZCa9PmSEURE+IyVOKfCmp
 2Qf1F2uI4bwGZvpv03mpoMkHFkP0K4Bp0dLsoXDC5Yz8KFQI7Mu3EPKFfgAJAlTwv5hF
 RU+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W8s0Y6PXpVq5HJWe3jhqpN4nXeyn3ufVbxJOkvH51pQ=;
 b=ejR+U0QdQ29rhoROghqRCpwbK+Y2iI3gZPeS0u7dGh0ENR80DqZxQf/u2oOYXVgcTk
 M0Fq0jzsdztVeXY1fdy56fDFS9WK0q9broUWjoE0HoQrIj6zUnbe9E7ITcBu+XhixTWy
 zPJgJ/0HteYkWKdLUzGRHqWYAvmWXhMFguay+k7iV61RyQFQhjAobs5sksx/DXXoGqBt
 0d9H+8DTCJyDy/8YKA5TmEcN32LQeCFlSLwTVQ6nsgYZfxtP4J/TfRghcQflqZBsrKBN
 af4tK5gtNanBOQUT2Fk39nWe8HnU4o78LLrJUPsl0au2ZovGabGdfPeyvboWXbz6wGA0
 a5cg==
X-Gm-Message-State: AOAM531xUGqRNNcfKbjq6IPQNc/TxRQrZi8pgx8C+gMR0PYkLBhXLt4z
 83utSr+H0TqhcgMkJXeL0gkrpyER+1K8CA==
X-Google-Smtp-Source: ABdhPJx/YO4okNwnQoQwD31W65Av+JNEEpSlJdHrYMCpMUwp0SOzMN30yZEBP8yMN0c8OPlGHV9I7A==
X-Received: by 2002:a4a:d108:: with SMTP id k8mr15283519oor.90.1630967998871; 
 Mon, 06 Sep 2021 15:39:58 -0700 (PDT)
Received: from nuclearis3.gtech (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id k8sm1861378oom.20.2021.09.06.15.39.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 15:39:57 -0700 (PDT)
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Etienne Carriere <etienne.carriere@linaro.org>
References: <20210902115512.1.I1c6536da7609f8240549cccae2708e075dc9fcf3@changeid>
 <569089c3-8936-2a47-930e-218805064413@gmail.com>
 <CAN5uoS_-rCBtWdXe+_neH3iwnUOzdExX7OayUq3P+ufeohioPg@mail.gmail.com>
 <ca6ac42b-3337-5d48-756b-eaafa1266d60@foss.st.com>
From: "Alex G." <mr.nuke.me@gmail.com>
Message-ID: <d730a496-60a9-150b-549a-e2c74d6e44d1@gmail.com>
Date: Mon, 6 Sep 2021 17:39:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <ca6ac42b-3337-5d48-756b-eaafa1266d60@foss.st.com>
Content-Language: en-US
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <royger@freebsd.org>,
 Kever Yang <kever.yang@rock-chips.com>, Sean Anderson <seanga2@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Masahisa Kojima <masahisa.kojima@linaro.org>, Stefan Roese <sr@denx.de>,
 Samuel Holland <samuel@sholland.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Michal Simek <michal.simek@xilinx.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Andre Przywara <andre.przywara@arm.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Steffen Jaeckel <jaeckel-floss@eyet-services.de>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Simon Glass <sjg@chromium.org>, Tero Kristo <t-kristo@ti.com>,
 Michael Walle <michael@walle.cc>, Ovidiu Panait <ovidiu.panait@windriver.com>,
 Bin Meng <bmeng.cn@gmail.com>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 1/2] lib: optee: remove the duplicate
	CONFIG_OPTEE
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

CgpPbiA5LzYvMjEgMTE6NTMgQU0sIFBhdHJpY2sgREVMQVVOQVkgd3JvdGU6Cj4+Cj4+PiBJbiBm
YWN0LCB0aGUgU1BMIGJvb3QgcGF0aCBmb3IgT1AtVEVFIGRvZXNuJ3QgdXNlIHRoaXMgZnVuY3Rp
b24uIFRoYXQncwo+Pj4gaW50ZW50aW9uYWwuCj4+Pgo+Pj4gSGVyZSdzIHdoYXQgSSBzdWdnZXN0
Ogo+Pj4gwqDCoMKgIC0gUmVtb3ZlIE9QVEVFX1RaRFJBTV9CQVNFIGFuZCBfU0laRQo+PiBUaGVy
ZSBpcyBzb21lIGxlZ2FjeSBoZXJlLCBib2FyZC93YXJwN2FuZCBib2FyZC90ZWNobmV4aW9uL3Bp
Y28taW14N2QuCj4gCj4gCj4gaXQgaXMgbm90IHBvc3NpYmxlLCBpdCBpcyB1c2VkIGZvciBVLUJv
b3QgcHJvcGVyIG9uIG90aGVyIHBsYXRmb3Jtcwo+IAo+IGJvYXJkL3dhcnA3L3dhcnA3LmM6Mzg6
wqDCoMKgIMKgwqDCoCBnZC0+cmFtX3NpemUgLT0gQ09ORklHX09QVEVFX1RaRFJBTV9TSVpFOwo+
IGJvYXJkL3dhcnA3L3dhcnA3LmM6MTIyOsKgwqDCoCBvcHRlZV9zdGFydCA9IG9wdGVlX2VuZCAt
IENPTkZJR19PUFRFRV9UWkRSQU1fU0laRTsKPiBib2FyZC90ZWNobmV4aW9uL3BpY28taW14N2Qv
cGljby1pbXg3ZC5jOjU2OiBnZC0+cmFtX3NpemUgLT0gQ09ORklHX09QVEVFX1RaRFJBTV9TSVpF
Owo+IGluY2x1ZGUvY29uZmlncy9teDdfY29tbW9uLmg6NTI6I2lmIChDT05GSUdfT1BURUVfVFpE
UkFNX1NJWkUgIT0gMCkKCkkgaGF2ZSBhbiBpZGVhIGhvdyB0byB3b3JrIGFyb3VuZCB0aGF0LgoK
Cj4gQW5kIGZvciBtZSB0aGlzIGNvbmZpZ3VyYXRpb24gKHNpemUgb2YgbWVtb3J5IHVzZWQgYnkg
T1BURUUpIGlzIG1vcmUgYSAKPiBzeXN0ZW0gY29uZmlndXJhdGlvbgo+IGRlcGVuZGluZyBvZiB0
aGUgT1AtVEVFIGZpcm13YXJlIHVzZWQgdGhhbiBhIERldmljZSBUcmVlIGNvbmZpZ3VyYXRpb24g
Cj4gYXQgU1BMIGxldmVsCj4gCj4gUFM6IGZvciB0aGUgVEYtQSBjYXNlIGl0IGlzIGRvbmUgaW4g
YSBzZWN1cmUgRlcgY29uZmlndXJhdGlvbiBmaWxlID0+IGluIAo+IHRoZSBGSVAKPiAgwqDCoMKg
wqDCoCB0aGlzIGluZm9ybWF0aW9uIGlzIG5vIGhhcmRjb2RlZCBpbmZvcm1hdGlvbiBpbiBCTDIK
PiAgwqDCoMKgIGluIFNQTCwgdGhlIGxvYWQgYWRkcmVzcyAvIGVudHJ5IHBvaW50IGl0IGlzIGFs
cmVhZHkgcHJvdmlkZWQgYnkgCj4gRklUIGZvciBPUFRFRSBpbWFnZQo+IAo+ICDCoMKgwqDCoCAo
PT4gb3B0ZWVfaW1hZ2VfZ2V0X2xvYWRfYWRkciAvIG9wdGVlX2ltYWdlX2dldF9lbnRyeV9wb2lu
dCkKPiAgwqDCoMKgwqAgbm8gbmVlZCB0byBoYXZlIHRoaXMgaW5mb3JtYXRpb24gaW4gRFQgKG9w
dGVlIGJhc2UgYWRkcmVzcykKPiAKPiB0b29scy9kZWZhdWx0X2ltYWdlLmM6MTE5Cj4gCj4gIMKg
wqDCoCBpZiAocGFyYW1zLT5vcyA9PSBJSF9PU19URUUpIHsKPiAgwqDCoMKgIMKgwqDCoCBhZGRy
ID0gb3B0ZWVfaW1hZ2VfZ2V0X2xvYWRfYWRkcihoZHIpOwo+ICDCoMKgwqAgwqDCoMKgIGVwID0g
b3B0ZWVfaW1hZ2VfZ2V0X2VudHJ5X3BvaW50KGhkcik7Cj4gCj4gIMKgwqDCoCB9CgpUaGUgT1BU
RUUgZW50cnkgcG9pbnQgaXMgYXZhaWxhYmxlOgoxKSBpbiBib3RoIEZJVCBhbmQgdUltYWdlIGZp
bGVzLgoyKSBBcyB0aGUgb3B0ZWUgcmVzZXJ2ZWQtbWVtb3J5IG5vZGUgaW4gRFQKMykgVmlhIENP
TkZJR19PUFRFRV9UWkRSQU1fQkFTRQoKT24gdGhlIG9uZSBoYW5kLCAoMSkgYW5kICgyKSB0b2dl
dGhlciBjb3VsZCBoaW50IHRoYXQgdGhlIE9QVEVFIGltYWdlIGlzIAppbmNvbXBhdGlibGUgd2l0
aCB0aGUgYm9hcmQsIHNvIHRoZXkgYXJlIG5vdCBjb21wbGV0ZWx5IHJlZHVuZGFudC4KT24gdGhl
IG90aGVyIGhhbmQsIHRoZXJlIGlzIG5vIHBvaW50IGluICgzKSBnaXZlbiB0aGF0IHRoZSBpbmZv
cm1hdGlvbiAKY291bGQgYmUgb2J0YWluZWQgaW4gYXQgbGVhc3QgdHdvIG90aGVyIHdheXMuCgoK
PiAKPiAgwqDCoMKgIGZvciBDT05GSUdfT1BURUVfVFpEUkFNX1NJWkUsIEkgdGhpbmsgdGhhdCBj
YW4gYmUgYWxzbyBmb3VuZCBieSAKPiBwYXJzaW5nIHRoZSBPUC1URUUgaGVhZGVyCj4gCj4gPT4g
c2VlIDogaW5pdF9tZW1fdXNhZ2UKPiAKPiAgwqDCoMKgIHRoZSBPUFRFRSBzaG91bGQgYmUgYWNj
ZXNzIHRvIHRoaXMgbWVtb3J5IC4uLi4uCj4gIMKgwqDCoCBhbmQgaXQgY2FuIGNoYW5nZSB0aGUg
ZmlyZXdhbGwgY29uZmlndXJhdGlvbiBpcyBpdCBpcyBuZWNlc3NhcnkKPiAgwqDCoMKgIGZvciB0
aGUgc2hhcmVkIG1lbW9yeSBmb3IgZXhhbXBsZQo+IAo+IAo+ID0+IG5vIG5lZWQgdG8gdXBkYXRl
IGZpcnN0IHN0YWdlIGJvb3QgbG9hZGVyID0gU1BMICh3aXRoIHRoZSByaXNrIHRvIAo+IGJyaWNr
IHRoZSBkZXZpY2UpCj4gIMKgwqDCoMKgIHdoZW4gb25seSBPUC1URUUgZmlybXdhcmUgY2hhbmdl
CgpJIHNlZSB5b3VyIHBvaW50LiBJdCdzIGEgcGFja2FnaW5nIGlzc3VlLCB3aGljaCB3ZSBjb3Vs
ZCBzb2x2ZSB3aXRoIEZJVCwgCmJ1dCBub3Qgd2l0aCB1SW1hZ2UuIFRob3VnaCwgaG93IG9mdGVu
IGRvZXMgYW4gT1AtVEVFIHVwZGF0ZSBjaGFuZ2UgdGhlIApUWkRSQU0gbG9jYXRpb24/CgoKPj4+
IMKgwqDCoCAtIFJlbW92ZSBvcHRlZV92ZXJpZnlfYm9vdG1faW1hZ2UoKQo+IAo+IGJ1dCBpdCBp
cyB1c2VkIGluCj4gCj4gY29tbW9uL2Jvb3RtX29zLmM6NDkxOsKgwqDCoCByZXQgPSAKPiBvcHRl
ZV92ZXJpZnlfYm9vdF9pbWFnZShpbWFnZXMtPm9zLmltYWdlX3N0YXJ0LAoKWWVzLiBJdCBvbmx5
IGNoZWNrcyBpZiB0aGUgT1AtVEVFIGltYWdlIGZpdHMgd2l0aGluIHNvbWUgaGFyZGNvZGVkLCBh
bmQgCnBvdGVudGlhbGx5IHdyb25nLCBib3VuZGFyaWVzLiBXaGljaCBpcyBjb250cmFyeSB0byB5
b3VyIGFyZ3VtZW50cyBmcm9tIAphIGZldyBwYXJhZ3JhcGhzIGFnby4gSnVzdCBkb24ndCBjYWxs
IG9wdGVlX3ZlcmlmeV9ib290X2ltYWdlIGluIGJvb3RtX29zLmMuCgpBbGV4Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcg
bGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
