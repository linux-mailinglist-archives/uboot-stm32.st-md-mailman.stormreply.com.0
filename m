Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCBC3FDE42
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Sep 2021 17:10:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B56FC597AC;
	Wed,  1 Sep 2021 15:10:15 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62805C58D58
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Sep 2021 15:10:12 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 i3-20020a056830210300b0051af5666070so53240otc.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 01 Sep 2021 08:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pmPVZvas+4IPPlgSoibLVmYjzvn+bhWKk5elvEBrgRc=;
 b=GXX8FwhGFLry5G7My7+hrf0fzxVOu6tXhojFMRoh6HZgNn6KahEgz6SBRnTN+WXU/4
 /6nVgr271Es54chbrwwc0avSUFbpmIy4hKWp4ekUxEYjHX+vVFRSMMbEUm+3/7kvUrGQ
 l6qP1VNKA3xQ+L53dYoTcdoC8tfocggXrb0M0JEJ87uo6RDndhb5BVVDHoyVixf9Kvry
 sBY3HMsaCu6QJVM2fF0QiXmeK3i5GqM/wVbKOpTdvNdrraH9r/MOz8K07mjyryP4sYRc
 cn4ieL8tjyFxiJx5EqQDPcYbF820XaAgU9gnFnatjoSzqKkOIYqKcKWOwtA7m+WhzFhG
 NjYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pmPVZvas+4IPPlgSoibLVmYjzvn+bhWKk5elvEBrgRc=;
 b=gmUevTB4lMJeA0xrMkU8C5j7797UXiriR+xxrR/BlYt5E1abD0O5NtGn3es6Vx+NGZ
 NjFPU/NBDd4Bj6Rae6fU6rGjO7ilL2rJ1h7iacZAiUHoKYwwDyxuvhoYYAH6SIyp+3Fb
 1YHmS6oY06cd/NX1/APQrWjwlPgTfxbG+4QTpa7DGNNFBw3rX9eAHBMYG4gS7gVpoiX0
 wHJLztMiFulKEkGoE91gMQ6yobaVjvn7br5Ex8DJlAim8lm5IJWakxGlZgkHniinFJrv
 gYDc8g1UgvqGmFOSaA8vQMWdcQfqROz20MuVIS94xCNFPQ0ubYONWJp+VV4noU6wova0
 UM/Q==
X-Gm-Message-State: AOAM530ad6N8jXIlEM93Vgf3gu0dQXGO16/+5ktdnMxipE0Ja/P4FL8Z
 a0N410jiebMB6+tRg++nR79zlC4xMBw=
X-Google-Smtp-Source: ABdhPJx4wLcQ3UKPP3rnYLEQZFWSWg4V0TK+BWf53awIOn1Z+/dLo7XfhwqPE7944bEoS4VUYqXcmQ==
X-Received: by 2002:a05:6830:4090:: with SMTP id
 x16mr28869988ott.71.1630509010477; 
 Wed, 01 Sep 2021 08:10:10 -0700 (PDT)
Received: from nuclearis3.gtech (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id w9sm4700723oti.35.2021.09.01.08.10.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 08:10:09 -0700 (PDT)
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20210826214209.254461-1-mr.nuke.me@gmail.com>
 <20210826214209.254461-11-mr.nuke.me@gmail.com>
 <1afb6206-e2e9-30e7-33f5-695341e88841@foss.st.com>
From: "Alex G." <mr.nuke.me@gmail.com>
Message-ID: <0d056c73-60ad-2590-a355-1aff7a8af73d@gmail.com>
Date: Wed, 1 Sep 2021 10:10:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1afb6206-e2e9-30e7-33f5-695341e88841@foss.st.com>
Content-Language: en-US
Cc: marex@denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Etienne Carriere <etienne.carriere@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 10/10] stm32mp1: spl: Copy optee nodes to
 target FDT for OP-TEE payloads
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

SGkgUGF0cmljaywKCk9uIDgvMzEvMjEgMTI6MjQgUE0sIFBhdHJpY2sgREVMQVVOQVkgd3JvdGU6
Cj4gSGksCj4gCj4gT24gOC8yNi8yMSAxMTo0MiBQTSwgQWxleGFuZHJ1IEdhZ25pdWMgd3JvdGU6
Cj4+IE9QLVRFRSBkb2VzIG5vdCB0YWtlIGEgZGV2aWNldHJlZSBmb3IgaXRzIG93biB1c2UuIEhv
d2V2ZXIsIGl0IGRvZXMKPj4gcGFzcyB0aGUgZGV2aWNldHJlZSB0byB0aGUgbm9ybWFsIHdvcmxk
IE9TLiBJbiBtb3N0IGNhc2VzIHRoYXQgd2lsbAo+PiBiZSBzb21lIG90aGVyIGRldmljZXRyZWUt
YmVhcmluZyBwbGF0Zm9ybSwgc3VjaCBhcyBsaW51eC4KPj4KPj4gQXMgaW4gb3RoZXIgY2FzZXMg
d2hlcmUgdGhlcmUncyBhbiBPUFRFRSBwYXlsb2FkIChlLmcuIEJPT1RNX09QVEVFKSwKPj4gaXQg
aXMgcmVxdWlyZWQgdG8gY29weSB0aGUgb3B0ZWUgbm9kZXMgdG8gaGUgdGFyZ2V0J3MgRkRULiBE
byB0aGlzIGFzCj4+IHBhcnQgb2Ygc3BsX2JvYXJkX3ByZXBhcmVfZm9yX29wdGVlKCkuCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRydSBHYWduaXVjIDxtci5udWtlLm1lQGdtYWlsLmNvbT4K
Pj4gLS0tCj4+IMKgIGFyY2gvYXJtL21hY2gtc3RtMzJtcC9zcGwuYyB8IDIgKysKPj4gwqAgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0v
bWFjaC1zdG0zMm1wL3NwbC5jIGIvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3NwbC5jCj4+IGluZGV4
IGQ5ZmRjNTkyNmMuLjk0ZmJiNDVjZjkgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJtL21hY2gtc3Rt
MzJtcC9zcGwuYwo+PiArKysgYi9hcmNoL2FybS9tYWNoLXN0bTMybXAvc3BsLmMKPj4gQEAgLTE5
LDYgKzE5LDcgQEAKPj4gwqAgI2luY2x1ZGUgPGFzbS9hcmNoL3N5c19wcm90by5oPgo+PiDCoCAj
aW5jbHVkZSA8bWFjaC90emMuaD4KPj4gwqAgI2luY2x1ZGUgPGxpbnV4L2xpYmZkdC5oPgo+PiAr
I2luY2x1ZGUgPHRlZS9vcHRlZS5oPgo+PiDCoCB1MzIgc3BsX2Jvb3RfZGV2aWNlKHZvaWQpCj4+
IMKgIHsKPj4gQEAgLTE4Miw2ICsxODMsNyBAQCB2b2lkIHN0bTMyX2luaXRfdHpjX2Zvcl9vcHRl
ZSh2b2lkKQo+PiDCoCB2b2lkIHNwbF9ib2FyZF9wcmVwYXJlX2Zvcl9vcHRlZSh2b2lkICpmZHQp
Cj4+IMKgIHsKPj4gwqDCoMKgwqDCoCBzdG0zMl9mZHRfc2V0dXBfbWFjX2FkZHIoZmR0KTsKPj4g
K8KgwqDCoCBvcHRlZV9jb3B5X2ZkdF9ub2RlcyhmZHQpOwo+PiDCoMKgwqDCoMKgIHN0bTMyX2lu
aXRfdHpjX2Zvcl9vcHRlZSgpOwo+PiDCoCB9Cj4gCj4gCj4gTkFLIHRoZSBPUC1URUUgbm9kZXMg
YXJlIEFEREVEIGJ5IHRoZSBPUC1URUUgZmlybXdhcmUgaW4gdGhlIHVuc2VjdXJlIAo+IGRldmlj
ZSB0cmVlICh3aGVuIENGR19EVCBpcyBhY3RpdmF0ZWQpCj4gCj4gYmVmb3JlIHRvIGp1bXAgdG8g
dGhlIGtlcm5lbCAodGhhdCByZW1vdmUgdGhlIG5lZWQgdG8gaGF2ZSBEVCAKPiBhbGxpZ25lbWVu
dCB3aXRoIFUtQm9vdCBTUEwgZGV2aWNlIHRyZWUpCj4gCj4gPT4gU1BMIHNob3VsZCBub3QgY29w
eSB0aGUgT1AtVEVFIG5vZGVzIGluIG5leHQgc3RhZ2UgRFQKPiAKPiByZWZlcmVuY2UgaW4gb3B0
ZWVfb3MgPSBjb3JlL2FyY2gvYXJtL2tlcm5lbC9ib290LmM6IGFkZF9vcHRlZV9kdF9ub2RlKCkK
PiAKPiBhZGRfb3B0ZWVfZHRfbm9kZSgpIDw9IHVwZGF0ZV9leHRlcm5hbF9kdCgpIDw9IHBhZ2Vk
X2luaXRfcHJpbWFyeSgpCj4gCj4gSXQgaXMgdGhlIGV4cGVjdGVkIGNvbmZpZ3VyYXRpb24gZm9y
IE9QLVRFRSBvbiBTVE0zMk1QMTUgcGxhdGZvcm0uCgpJIGFncmVlIHRoYXQgaWYgYSBjb21wb25l
bnQgbW9kaWZpZXMgdGhlIHBsYXRmb3JtLCBpdCBzaG91bGQgYmUgCnJlc3BvbnNpYmxlIGZvciB1
cGRhdGluZyB0aGUgZGV2aWNldHJlZS4gVHdvIGlzc3VlcyB0aG91Z2gKCgoxLiBDb25zaXN0ZW5j
eQoKVGhlIFNUTTMySU1BR0UgYm9vdCBwYXRoIGV4cGVjdHMgdS1ib290IHRvIGFkZCB0aGUgb3B0
ZWUgbm9kZXMsIHdoaWxlIAp0aGUgRklQIHBhdGggZXhwZWN0cyBPUC1URUUgdG8gYWRkIHRoZSBu
b2Rlcy4gV2hpY2ggb25lIGRvIHdlIHN0aWNrIHRvPwoKCjIuIE1lbW9yeSBhY2Nlc3MKCkkgZG9u
J3QgdW5kZXJzdGFuZCBpcyBob3cgT1AtVEVFIHdvdWxkIGdldCBwYXN0IHRoZSBUWkMuCklmIHdl
IGxvb2sgYXQgb3B0ZWVfb3MgPT4gcGxhdC0wc3RtMzJtcDEvcGxhdF90emM0MDA6CiAgICAgIkVh
cmx5IGJvb3Qgc3RhZ2UgaXMgaW4gY2hhcmdlIG9mIGNvbmZpZ3VyaW5nIG1lbW9yeSByZWdpb25z
IgpUaGUgZm9sbG93aW5nIG1lbW9yeSBoYXMgYmVlbiBzZXQgdXAgYnkgU1BMIChvciBURi1BIGZv
ciB0aGF0IG1hdHRlcik6CgogICAgIE5vbnNlYzogYzAwMDAwMDAtPmRkZmZmZmZmCiAgICAgU2Vj
OiAgICBkZTAwMDAwMC0+ZGZkZmZmZmYKICAgICBTSE1FTTogIGRmZTAwMDAwLT5kZmZmZmZmZgoK
VGhlIGV4dGVybmFsIERUQiB3aWxsIGJlIGluIHRoZSBub25zZWMgcmVnaW9uLCB3aGljaCBPUC1U
RUUgYWxsZWdlZGx5IApjYW4ndCBhY2Nlc3MuIFNvIGhvdyB3b3VsZCB0aGlzIGdldCBwYXRjaGVk
PwoKQWxleApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpV
Ym9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby91Ym9vdC1zdG0zMgo=
