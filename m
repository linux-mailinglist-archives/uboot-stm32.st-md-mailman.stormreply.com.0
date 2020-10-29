Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E3529EE5A
	for <lists+uboot-stm32@lfdr.de>; Thu, 29 Oct 2020 15:33:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A22F9C3FAD5;
	Thu, 29 Oct 2020 14:33:51 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79EA2C36B37
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Oct 2020 14:33:50 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id m26so2390265otk.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Oct 2020 07:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eV1PRTz2iVzexw8wLdxIpURZ4dEdoJgF2FklXQdmH5o=;
 b=Y5mreOmo2aA9UYpzZYJZzvwUPJyXB8jLaclluB53Pd5A9yfdhO/7NvXICLwdho8vrf
 Ay8rpxv5QhqKm/xZN6byJSKK+6I805UGslqtUDR2PyDe1zS0qV/lxx47GF5CkxtWdk58
 eXz+/umQtCnM01mu2/tTQf2hrWbrOOQHmxaslAFDWr0KSt+gSt4bdqoV7c9e1A+1cQ6D
 bzOTrrSpElhlyespfvaFTPL115GsqT9vwyB1CxMhj+qsAdtYOpIXa8Y33ALG7qTbKSZF
 WomptwDLCaZYonvsAlPAbiVidCkH3VLgRyfuV4wdYmj1sQd5s06rDIdBuGBT/hPA2udM
 /PFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eV1PRTz2iVzexw8wLdxIpURZ4dEdoJgF2FklXQdmH5o=;
 b=GhZI7jjd9rAuGyhWMH09zHl+XqYXw5u3djXn4c3N/yhqKirdf0Jd4uF7cMeo6yqhtu
 7f/f9fqMiZaMObzGjdocLbVoyjIdjiCognConIX8kBup0XpD8ysRZFmfqrHRxsUlhx17
 QLMetL9JJqXBU39TdkYIi77qmWNTtBg9mWwbKjE+Cev4BJTPVsy+hMEB9Dv7fFhqahoW
 kgnPVFRxwm1jtAxze4AacafwLzk5inX+SXFLWRVBKAwJMB7tfv6pDRr6ohzeCG2Bm+sS
 qH8LEpv+RQdcEXgHcq4cGPtuTL3PTZWjPR1hBHR/JG+XVicL6UP9wy1erK1HzL/WoSB9
 WFkg==
X-Gm-Message-State: AOAM533gKMjJLiqlb/xCiFx9J2x3fB7Ksv6bRUPmoXOMWaI4NvYmUWv4
 Tg4YKTRMKBpgpiPcvzBc4rQ=
X-Google-Smtp-Source: ABdhPJxdY63csIv+gRaAESDCfN3MvGryBj6KU8ECdJAq1DamPV43L0G1gGhRz6Z0lovUGugfAjwk+A==
X-Received: by 2002:a9d:7313:: with SMTP id e19mr3216057otk.97.1603982029113; 
 Thu, 29 Oct 2020 07:33:49 -0700 (PDT)
Received: from nuclearis2-1.gtech (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id x14sm606558ooo.43.2020.10.29.07.33.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2020 07:33:48 -0700 (PDT)
From: "Alex G." <mr.nuke.me@gmail.com>
To: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>
References: <fd5e7932-11b9-3a06-0169-ddf13e91ffee@gmail.com>
Message-ID: <bdf285bd-7540-b7cf-989f-0f24594c6940@gmail.com>
Date: Thu, 29 Oct 2020 09:33:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <fd5e7932-11b9-3a06-0169-ddf13e91ffee@gmail.com>
Content-Language: en-US
Cc: "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] stm32mp: The purpose of "!tee_find_device()"
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

T24gOS8zMC8yMCA2OjAzIFBNLCBBbGV4IEcuIHdyb3RlOgo+IEhpCj4gCj4gSSdtIHRyeWluZyB0
byB3cmFwIG15IGhlYWQgYXJvdW5kIHRoZSBwdXJwb3NlIG9mIHRoZSBmb2xsb3dpbmcgbGluZXMg
aW4gCj4gZnRfc3lzdGVtX3NldHVwKCk6Cj4gCj4gIMKgwqDCoMKgaWYgKCFDT05GSUdfSVNfRU5B
QkxFRChPUFRFRSkgfHwKPiAgwqDCoMKgwqDCoMKgwqAgIXRlZV9maW5kX2RldmljZShOVUxMLCBO
VUxMLCBOVUxMLCBOVUxMKSkKPiAgwqDCoMKgwqDCoMKgwqAgc3RtMzJfZmR0X2Rpc2FibGVfb3B0
ZWUoYmxvYik7CgpIaSEgTWUgYWdhaW4hIERvIHdlIGhhdmUgYSAoZ29vZCkgcmVhc29uIGZvciB0
aGlzLCBvciBzaG91bGQgSSBzdWJtaXQgYSAKcGF0Y2ggdG8gcmVtb3ZlIHRoaXMgcHJvYmxlbWF0
aWMgY29kZT8KCkFsZXgKCj4gTXkgaW50ZXJwcmV0YXRpb24gaXMgImlmIG9wdGVlIGlzIG5vdCBy
dW5uaW5nLCBkZWxldGUgdGhlIEZEVCBub2RlIi4KPiBUaGUgcHJvYmxlbSBpcyB0aGF0IHRlZV9m
aW5kX2RldmljZSgpIGludm9rZXMgZGV2aWNlX3Byb2JlKCkuIFRoaXMgaW4gCj4gdHVybiBkb2Vz
IGFuIFNNQyBjYWxsLiBUaGlzIGNhbGwgcmVzdWx0cyBpbiBhbiBhYm9ydCBhbmQgcmVib290IGlm
IG9wdGVlIAo+IGlzIG5vdCBydW5uaW5nIGluIHRoZSBmaXJzdCBwbGFjZS4KPiAKPiBTbyBJIGRv
bid0IHRoaW5rIHRoYXQgdGVlX2ZpbmRfZGV2aWNlKCkgY2FuIGJlIHVzZWQgYXMgYSBjaGVjayBm
b3IgIklzIAo+IG9wdGVlIHJ1bm5pbmc/Ii4gRXhoaWJpdCBCOiBPdXRzaWRlIG9mIG1hY2gtc3Rt
MzJtcCwgdGVlX2ZpbmRfZGV2aWNlKCkgCj4gaXMgdXNlZCB0byBvYnRhaW4gb2YgYSBfd29ya2lu
Z18gVEVFIG5vZGUsIG5vdCB0byBhc2sgaWYgImlzIG9wdGVlIAo+IHJ1bm5pbmc/Ii4KPiAKPiAK
PiBNeSBwcm9ibGVtIGlzIHRoYXQgdHJ5aW5nIHRvIHN0YXJ0IGxpbnV4IHdpdGggQ09ORklHX09Q
VEVFPXkgd2lsbCBjYXVzZSAKPiB0aGUgYm9vdG0gY29tbWFuZCB0byBjcmFzaCAobG9nIGluIGFw
cGVuZGl4IEEpOgo+IAo+ICDCoMKgwqDCoGxvYWQgbW1jIDA6NyAkbG9hZGFkZHIgYm9vdC91SW1h
Z2UKPiAgwqDCoMKgwqBsb2FkIG1tYyAwOjcgJGZkdF9hZGRyX3IgYm9vdC9zdG0zMm1wMTU3Yy1k
azIuZHRiCj4gIMKgwqDCoMKgbG9hZCBtbWMgMDo3IDB4YzgwMDAwMDAgYm9vdC91dGVlCj4gIMKg
wqDCoMKgc2V0ZW52IGJvb3RtX2Jvb3RfbW9kZSBzZWMKPiAgwqDCoMKgwqBib290bSAweGM4MDAw
MDAwIC0gJGZkdF9hZGRyX3IKPiAKPiBXaGF0IGlzIHRoZSBpbnRlbnQgb2YgY2FsbGluZyB0ZWVf
ZmluZF9kZXZpY2UoKSBpbiBhbiBGRFQgZml4dXAgCj4gZnVuY3Rpb24/IERvIHlvdSBoYXZlIGFu
eSBpZGVhcyBob3cgdG8gbWFrZSBpdCBub3QgY3Jhc2ggKHNob3J0IG9mIAo+IGNvbW1lbnRpbmcg
b3V0IHRoZSBwcm9ibGVtIGxpbmVzKSA/Cj4gCj4gQWxleAo+IAo+IAo+IEFwcGVuZGl4IEE6IHUt
Ym9vdCBsb2cgYWZ0ZXIgYm9vdG0gY29tbWFuZAo+IAo+ICMjIEJvb3Rpbmcga2VybmVsIGZyb20g
TGVnYWN5IEltYWdlIGF0IGM4MDAwMDAwIC4uLgo+ICDCoMKgIEltYWdlIE5hbWU6Cj4gIMKgwqAg
Q3JlYXRlZDrCoMKgwqDCoMKgIDIwMjAtMDktMjjCoCAyMDo1ODo1NiBVVEMKPiAgwqDCoCBJbWFn
ZSBUeXBlOsKgwqAgQVJNIFRydXN0ZWQgRXhlY3V0aW9uIEVudmlyb25tZW50IEtlcm5lbCBJbWFn
ZSAKPiAodW5jb21wcmVzc2VkKQo+ICDCoMKgIERhdGEgU2l6ZTrCoMKgwqAgMzQ5Mjc2IEJ5dGVz
ID0gMzQxLjEgS2lCCj4gIMKgwqAgTG9hZCBBZGRyZXNzOiBmZGZmZmZlNAo+ICDCoMKgIEVudHJ5
IFBvaW50OsKgIGZlMDAwMDAwCj4gIMKgwqAgVmVyaWZ5aW5nIENoZWNrc3VtIC4uLiBPSwo+ICDC
oMKgIExvYWRpbmcgS2VybmVsIEltYWdlCj4gIyMgRmxhdHRlbmVkIERldmljZSBUcmVlIGJsb2Ig
YXQgYzQwMDAwMDAKPiAgwqDCoCBCb290aW5nIHVzaW5nIHRoZSBmZHQgYmxvYiBhdCAweGM0MDAw
MDAwCj4gIMKgwqAgTG9hZGluZyBEZXZpY2UgVHJlZSB0byBjZmZlZjAwMCwgZW5kIGNmZmZmNWUy
IC4uLiBPSwo+IDxCT0FSRCBSRVNFVFMgV0lUSE9VVCBVU0VSIElOUFVUPgo+IFUtQm9vdCBTUEwg
MjAyMC4xMC1yYzQgKFNlcCAyMCAyMDIwIC0gMjM6NDY6NDcgKzAwMDApCj4gTW9kZWw6IFNUTWlj
cm9lbGVjdHJvbmljcyBTVE0zMk1QMTU3Qy1ESzIgRGlzY292ZXJ5IEJvYXJkCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcg
bGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
