Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEB852D441
	for <lists+uboot-stm32@lfdr.de>; Thu, 19 May 2022 15:42:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BFE4AC03FC2;
	Thu, 19 May 2022 13:42:58 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D72DC03FC1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 May 2022 13:42:57 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id h9so239786qtx.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 May 2022 06:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5GXy5Ltz1h55DIsL8zQBfKz19JhKODAX6fsu8P8SA0Y=;
 b=KZih0QDMTzTA6PMg0ZXTV9NFS8djlkb0sTPmVty1xfhm9WPTw3zRMam1BFJ5Hs8g91
 rZBJjrQ7uewUGmZ6fIHSykGfqb31ZtHJReQ23UWPtOeiqS2KFM1GvigCYnZ53iNe3jvF
 GC0LKtrtpxcaJ7pa3CBT8dIyP0CdCpjRfIenCkohsNlN1tUAigHEeZoJG6gUZkf8ar5D
 W+7+veOor3io4YDnsXc64c+vsaLYp+NX7C5QaA8D9lJcvBAis0suew12ZXNPyfD42xOQ
 hysXAwFTlTLNBhHQTvEud4GxD3zrUp2bFiXvx/HZznFj6TQXKES4t2kXY7wn5vf/+YTc
 6HLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5GXy5Ltz1h55DIsL8zQBfKz19JhKODAX6fsu8P8SA0Y=;
 b=TmaZcGIi7odyck5ZvphlPk7JNOxsd++5+j3kVUay5jy6zUxev0jUupykxnfpBdtv1i
 6oR4kdtQlfBhINJQ7D++Ygvuuk0gN1D+IeyFu1PB3YWj4oyVm1nN9VvmC1G/RkUDQ+eP
 5zaB/hdepS0zFg7OhDAzPZUpgIVxV1p1ZP+hJV3anQoEQ22ZhccDwausy1G606sqTag2
 XOGZVqbSY+vFnQ0Zsx3+/DvqnTKq/F4lJEGbDQnhCxrKnGoU0n2SCc5jnKF34BRHAkt6
 Hgm21UjON5rfJX1wmm45uqBj1MgxAglE5TpFxmkEQqeU4u+Rk8qIxmuasT+dZwbXPC5L
 fdLA==
X-Gm-Message-State: AOAM533XHUn/Efu5Nx2d1tvVpnYf6x2LHzEBLdMDpkaehmpS24V2DkzG
 IVRmupA1lr0Qg7iFTU1v8D55MLMAxWg=
X-Google-Smtp-Source: ABdhPJxLQxWy2Bp9RH/GgVXDMLKPrXm2a0t0R6GNxKue7c2j0dyb8RLbE1KP1n06tQRpouIwd7G87A==
X-Received: by 2002:ac8:7fd0:0:b0:2f3:fda4:6ddf with SMTP id
 b16-20020ac87fd0000000b002f3fda46ddfmr3820888qtk.323.1652967775923; 
 Thu, 19 May 2022 06:42:55 -0700 (PDT)
Received: from [192.168.1.201] (pool-108-18-248-138.washdc.fios.verizon.net.
 [108.18.248.138]) by smtp.googlemail.com with ESMTPSA id
 b126-20020a37b284000000b0069fc13ce1fcsm1313055qkf.45.2022.05.19.06.42.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 May 2022 06:42:55 -0700 (PDT)
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20220510075114.1238086-1-patrick.delaunay@foss.st.com>
 <41b170c1-99ba-18ac-4a94-01c90f67b97c@gmail.com>
 <21688d64-ffeb-d0b7-b6e5-2efeb3f33ec1@foss.st.com>
From: Sean Anderson <seanga2@gmail.com>
Message-ID: <0c7bf009-9731-d16b-ce8d-08718e6dd7bb@gmail.com>
Date: Thu, 19 May 2022 09:42:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <21688d64-ffeb-d0b7-b6e5-2efeb3f33ec1@foss.st.com>
Content-Language: en-US
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>,
 Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>,
 Lukasz Majewski <lukma@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 0/4] stm32mp: add minimal RCC support for
	STM32MP13
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

SGkgUGF0cmljaywKCk9uIDUvMTcvMjIgNDoxMiBBTSwgUGF0cmljayBERUxBVU5BWSB3cm90ZToK
PiBIaSwKPiAKPiBPbiA1LzExLzIyIDE4OjQ0LCBTZWFuIEFuZGVyc29uIHdyb3RlOgo+PiBIaSBQ
YXRyaWNrLAo+Pgo+PiBPbiA1LzEwLzIyIDM6NTEgQU0sIFBhdHJpY2sgRGVsYXVuYXkgd3JvdGU6
Cj4+Pgo+Pj4gQWRkIGEgbWluaW1hbCBzdXBwb3J0IGZvciBTVE0zMk1QMTMgUkNDLCB0aGUgcmVz
ZXQgYW5kIGNsb2NrIGNvbnRyb2xsZXIKPj4+IC0gdXBkYXRlIG9mIHRoZSBSQ0MgTUlTQyBkcml2
ZXIgdG8gYmluZCB0aGUgY29ycmVjdCBjbG9jayBhbmQgcmVzZXQgZHJpdmVyCj4+PiAtIHJlc2V0
IGRyaXZlciwgc2FtZSB0aGFuIFNUTTMyTVAxNXggPSBkcml2ZXJzL3Jlc2V0L3N0bTMyLXJlc2V0
LmMKPj4+IC0gY2xvY2sgZHJpdmVyLCBhZGQgYSBlbXB0eSBkcml2ZXIgZm9yIFNUTTMyTVAxM3gg
PQo+Pj4gwqDCoCBkcml2ZXJzL2Nsay9zdG0zMi9jbGstc3RtMzJtcDEzLmMKPj4+IC0gQWRkIFJD
QyBub2RlIGluIFNPQyBkZXZpY2UgdHJlZSB3aXRoIHUtYm9vdCxkbS1wcmUtcmVsb2MgcHJvcGVy
dHkKPj4+Cj4+PiBUaGlzIHNlcmllIGlzIG9ubHkgYSBwcmVsaW1pbmFyeSBzdGVwIGZvciBTVE0z
Mk1QMTMgY2xvY2sgYW5kIHJlc2V0IHN1cHBvcnQKPj4+IGluIFUtQm9vdCwgYmFzZWQgb24gTGlu
dXgga2VybmVsIGJpbmRpbmcgaW50cm9kdWNlZCBieSBbMV0gYW5kIGl0IHByZXBhcmVzCj4+PiB0
aGUgbmV4dCBkZXZpY2UgdHJlZSBhbGlnbm1lbnQgd2l0aCBMaW51eCBrZXJuZWwuCj4+Pgo+Pj4g
VGhlIGZ1bmN0aW9uYWwgU1RNUDEzIGNsb2NrIGRyaXZlciBiYXNlZCBvbiBDQ0YgYW5kIG9uIFND
TUkgY2xvY2tzCj4+PiBwcm92aWRlZCBieSBPUC1URUUgYW5kIHRoZSBjbG9jayBhbmQgcmVzZXQg
cmVmZXJlbmNlcyBpbiBTT0MgZGV2aWNlIHRyZWUKPj4+IHdpbGwgYmUgcHVzaGVkIHdoZW4gdGhl
IGFzc29jaWF0ZWQgcGF0Y2hlcyBpbiBbMV0gd2lsbCBiZSBhY2NlcHRlZC4KPj4+Cj4+PiBbMV0g
SW50cm9kdWN0aW9uIG9mIFNUTTMyTVAxMyBSQ0MgZHJpdmVyIChSZXNldCBDbG9jayBDb250cm9s
bGVyKQo+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYXJtLWtlcm5lbC8yMDIyMDMx
NjEzMTAwMC45ODc0LTEtZ2FicmllbC5mZXJuYW5kZXpAZm9zcy5zdC5jb20vCj4+Cj4+IEknbSBu
b3QgcmVhbGx5IHN1cmUgd2hhdCB0aGUgcHVycG9zZSBvZiB0aGlzIHNlcmllcyBpcy4gQ2FuIHlv
dQo+PiBlbGFib3JhdGUgYSBiaXQgb24gd2h5IHdlIG5lZWQgYSBkdW1teSBjbG9jayBkcml2ZXI/
IFdoeSBkb24ndAo+PiB5b3UganVzdCBhZGQgdGhlIGJpbmRpbmcgdG8gdGhlIGRldmljZSB0cmVl
IHdpdGhvdXQgdGhlIGFzc29jaWF0ZWQKPj4gZHJpdmVyPwo+IAo+IAo+IEFmdGVyIHRoaXMgc2Vy
aWUsIHRoZSBSQ0MgcmVzZXQgcGFydCBpcyBmdW5jdGlvbmFsIG9uIFNUTTMyTVAxMyAocHJvYmUg
YW5kIG9wcykKPiAKPiBldmVuIGlmIHRoZSBhc3NvY2lhdGVkIGJpbmRpbmcgaXMgbm90IHByZXNl
bnQgaW4gZGV2aWNlIHRyZWUuCj4gCj4gdGVzdGVkIHdpdGg6Cj4gCj4gLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLSBhcmNoL2FybS9kdHMvc3RtMzJtcDEzMS5kdHNpIC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KPiBpbmRleCBmY2IwYWYwOWI1Li5kOWM2MTg1YmNmIDEwMDY0NAo+IEBAIC0xOTcs
NiArMTk3LDcgQEAKPiAgwqDCoMKgwqAgwqDCoMKgIMKgwqDCoCBpbnRlcnJ1cHQtbmFtZXMgPSAi
Y21kX2lycSI7Cj4gIMKgwqDCoMKgIMKgwqDCoCDCoMKgwqAgY2xvY2tzID0gPCZjbGtfcGxsNF9w
PjsKPiAgwqDCoMKgwqAgwqDCoMKgIMKgwqDCoCBjbG9jay1uYW1lcyA9ICJhcGJfcGNsayI7Cj4g
K8KgwqDCoCDCoMKgwqAgwqDCoMKgIHJlc2V0cyA9IDwmcmNjIDE0MjI0PjsKPiAgwqDCoMKgwqAg
wqDCoMKgIMKgwqDCoCBjYXAtc2QtaGlnaHNwZWVkOwo+ICDCoMKgwqDCoCDCoMKgwqAgwqDCoMKg
IGNhcC1tbWMtaGlnaHNwZWVkOwo+ICDCoMKgwqDCoCDCoMKgwqAgwqDCoMKgIG1heC1mcmVxdWVu
Y3kgPSA8MTMwMDAwMDAwPjsKPiAKPiAKPiBBIGR1bW15IFNUTTMyTVAxMyBjbG9jayBkcml2ZXIg
aXMgcmVxdWVzdGVkIHRvIGFsbG93IFJDQyBNSVNDIGFuZCBSQ0MgUkVTRVQKPiAKPiBiaW5kaW5n
IGFuZCBwcm9iZSB3aXRob3V0IGlzc3VlLgoKU2hvdWxkbid0IHRoZSBzb2x1dGlvbiBiZSB0byBt
YWtlIHRoZSBjbG9jayBvcHRpb25hbCBpbiB0aGUgdXNlcj8KCj4gVGhpcyByZXNldCBzdXBwb3J0
IHdhcyByZXF1ZXN0ZWQgYnkgU0RNQ0MgZHJpdmVyIGFuZCBTRC1DYXJkIGJvb3QsIGJlZm9yZSB0
aGUgcGF0Y2g6Cj4gCj4gaHR0cDovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvdWJvb3Qv
cGF0Y2gvMjAyMjA1MDYxNjA1NDAuMTMuSTM5YjY5ZThkYzdiNDNiOGUyNjVlNzczODhmYjUzZjdj
MWZhMmEwMDdAY2hhbmdlaWQvCj4gCj4gCj4gQXMgd2Ugc29sdmUgdGhlIFNETUNDIGRlcGVuZGVu
Y3kgaXNzdWUgKHJlc2V0IGJlY29tZSBvcHRpb25uYWwpLCBzbyB0aGlzIHNlcmllIGlzIG5vIG1v
cmUgbWFuZGF0b3J5Lgo+IAo+IAo+IFRoaXMgc2VyaWUgaXMgYSBqdXN0IGEgY2xlYW51cCAvIHBy
ZWxpbWluYXJ5IHN0ZXAsIGJ1dCBJIGNhbiBkcm9wIHRoaXMgZHVtbXkgUkNDIGRyaXZlciBpZiBp
dCBpcyBkaXN0dXJiaW5nLgpJIHdvdWxkIGxpa2UgdGhhdCwgc2luY2UgdGhpcyBpcyBub3QgbWFu
ZGF0b3J5LgoKLS1TZWFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
