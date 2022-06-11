Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7C2547636
	for <lists+uboot-stm32@lfdr.de>; Sat, 11 Jun 2022 17:43:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35744C5F1EF;
	Sat, 11 Jun 2022 15:43:51 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A906C5F1D7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Jun 2022 15:43:49 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id c8so1321435qtj.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Jun 2022 08:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8Hc3TbytFe0YE8khZz3Kra9OrC20fRyv5o2WyfTTbog=;
 b=LNXjp9aXcSFTn9m5EJpzrV889Nze+pAllMibWwnHXeadr/JgV6VbtD7NWxrW/WEYZj
 9zvMMVMkQgMGtJWLDtGTzzWuiXM589CH0jYice/RyZcuPXGW1KnpzWzKFbd+Qhtz09Ed
 hzDusa6IES+2xS6VwEvU/qr6wmAvr5x9YWeiKvbcQSkV6juNtpiZo9naB+SC/enFI328
 KD+1bCSJkiAo5TJjV9e4rdAzohEe4UgZf7MLJbeib8Q1o6PRx94Ts7ysWLhQG0fpJgKy
 7k9uPH6exJDl+dwtgnXL/ouiipgfmL8Rl2NfDXYYsiaoEjQBTxFQxV46O3bPzoBvYxcj
 v4kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8Hc3TbytFe0YE8khZz3Kra9OrC20fRyv5o2WyfTTbog=;
 b=nFJN2qGDYohIJEqy22+9V86KXJT5JeTfIWPgxTAWSeaEbrkyU4V+bqi6nE4hjxgypV
 FyTBGhtywL9XyXB5GHroHbiTJLD6zElp0E3zzEPHIc3yo+UA9v5qgXr0YZOIhuQ54H3t
 InJeK6CxNSsxkr0qZ8ggS7PT85vCciWv5K/IY1gTKwmOov2PP+3up7h47UDcMZSiIDNe
 Z5Bu8Q5hxL3s7i4qluA5G30aevPA9O1990eCBgyovboXgdyW3dCh3OlMr94P9B2S+aj+
 zZw0QcHNuqYz+9iX0vr3PJC/jK2rrlOFU7TLpcaNeNWtmNX/AEB4pCZeo2LqiLeKgELN
 +4Hw==
X-Gm-Message-State: AOAM531Z8celztO1dESk1cWR7NsqyroDI5Sue++u5T1Q20uiF8AafoIE
 gmHrFUINOo7xET23V1e2trnhgM9Xw612hZDK
X-Google-Smtp-Source: ABdhPJwIKPzkyucLec3MX8ECWY/C81y7v6stjyAo4KcJNyLvacBjQJsYsF7yMdKRfgXEwX4rIuS4Zw==
X-Received: by 2002:ac8:5ac5:0:b0:304:fa16:1227 with SMTP id
 d5-20020ac85ac5000000b00304fa161227mr19643574qtd.37.1654962228666; 
 Sat, 11 Jun 2022 08:43:48 -0700 (PDT)
Received: from [192.168.1.201] (pool-173-73-95-180.washdc.fios.verizon.net.
 [173.73.95.180]) by smtp.gmail.com with ESMTPSA id
 j9-20020a05620a288900b006a67d257499sm2032522qkp.56.2022.06.11.08.43.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Jun 2022 08:43:48 -0700 (PDT)
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Amelie Delaunay <amelie.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20220426123750.579726-1-patrick.delaunay@foss.st.com>
 <20220426143736.1.I15bd7c3c8c983d6a6cec3d2ee371d75fe72fcd41@changeid>
 <27373592-d6c9-ff00-799b-a2f04f4500b1@gmail.com>
 <0aeffe8a-b73a-5e3d-de89-9938d8d53150@foss.st.com>
 <8776d357-028b-0d21-cb90-4cbdd73f4ffb@foss.st.com>
 <78061a89-ab5e-af21-d02a-9deeece3e454@gmail.com>
 <4a7519b0-9bb7-f92e-3e73-7be0ba9959d7@foss.st.com>
From: Sean Anderson <seanga2@gmail.com>
Message-ID: <217c9525-9d3c-a6ed-0d3f-0830a534ae84@gmail.com>
Date: Sat, 11 Jun 2022 11:43:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <4a7519b0-9bb7-f92e-3e73-7be0ba9959d7@foss.st.com>
Content-Language: en-US
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH 1/3] phy: stm32-usbphyc: add counter of
	PLL consumer
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

T24gNS8xNy8yMiAzOjQyIEFNLCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpIFNlYW4sCj4g
Cj4gT24gNS8xMS8yMiAxODo0OCwgU2VhbiBBbmRlcnNvbiB3cm90ZToKPj4gT24gNS8xMC8yMiA1
OjUxIEFNLCBBbWVsaWUgRGVsYXVuYXkgd3JvdGU6Cj4+PiBIaSBQYXRyaWNrLAo+Pj4gSGkgU2Vh
biwKPj4+Cj4+PiBPbiA1LzkvMjIgMTY6MzcsIFBhdHJpY2sgREVMQVVOQVkgd3JvdGU6Cj4+Pj4g
SGkgU2VhbiwKPj4+Pgo+Pj4+IE9uIDUvOC8yMiAyMDoyMSwgU2VhbiBBbmRlcnNvbiB3cm90ZToK
Pj4+Pj4gT24gNC8yNi8yMiA4OjM3IEFNLCBQYXRyaWNrIERlbGF1bmF5IHdyb3RlOgo+Pj4+Pj4g
QWRkIHRoZSBjb3VudGVyIG9mIHRoZSBQTEwgdXNlciBuX3BsbF9jb25zIG1hbmFnZWQgYnkgdGhl
IDIgZnVuY3Rpb25zCj4+Pj4+PiBzdG0zMl91c2JwaHljX3BsbF9lbmFibGUgLyBzdG0zMl91c2Jw
aHljX3BsbF9kaXNhYmxlLgo+Pj4+Pj4KPj4+Pj4+IFRoaXMgY291bnRlciBhbGxvdyB0byByZW1v
dmUgdGhlIGZ1bmN0aW9uIHN0bTMyX3VzYnBoeWNfaXNfaW5pdAo+Pj4+Pj4gYW5kIGl0IGlzIGEg
cHJlbGltaW5hcnkgc3RlcCBmb3IgY2tfdXNib180OG0gaW50cm9kdWN0aW9uLgo+Pj4+Pgo+Pj4+
PiBJcyBpdCBuZWNlc3NhcnkgdG8gZGlzYWJsZSB0aGlzIGNsb2NrIGJlZm9yZSBib290aW5nIHRv
IExpbnV4PyBJZiBpdCBpc24ndCwKPj4+Pj4gdGhlbiBwZXJoYXBzIGl0IGlzIHNpbXBsZXIgdG8g
anVzdCBub3QgZGlzYWJsZSB0aGUgY2xvY2suCj4+Pj4+Cj4+Pj4+IC0tU2Vhbgo+Pj4+Cj4+Pj4K
Pj4+PiBObywgaXQgaXMgbm90IG5lY2Vzc2FyeSwgd2Ugb25seSBuZWVkIHRvIGVuYWJsZSB0aGUg
Y2xvY2sgZm9yIHRoZSBmaXJzdCB1c2VyLgo+Pj4+Cj4+Pj4gSSBjb3B5IHRoZSBjbG9jayBiZWhh
dmlvciBmcm9tIGtlcm5lbCwKPj4+Pgo+Pj4+IGJ1dCBJIGFncmVlIHRoYXQgY2FuIGJlIHNpbXBs
ZXIuCj4+Pj4KPj4+Pgo+Pj4+IEFtZWxpZSBhbnkgbm90aWNlIGFib3V0IHRoaXMgcG9pbnQgPwo+
Pj4+Cj4+Pj4gRG8geW91IHByZWZlciB0aGF0IEkga2VwdCB0aGUgYmVoYXZpb3IgLSBzYW1lIGFz
IGtlcm5lbCBkcml2ZXIgLSBvciBJIHNpbXBsaWZ5IHRoZSBVLUJvb3QgZHJpdmVyID8KPj4+Cj4+
PiBJbiBjYXNlIHRoZSBQTEwgaGFzIG5vdCBiZWVuIGRpc2FibGVkIGJlZm9yZSBLZXJuZWwgYm9v
dCwgdXNicGh5YyBLZXJuZWwgZHJpdmVyIHdpbGwgd2FpdCBmb3IgdGhlIFBMTCBwd2VyZG93bi4K
Pj4+IFVTQiBjb3VsZCBhbHNvIG5vdCBiZWluZyB1c2VkIGluIEtlcm5lbCwgc28gUExMIHdvdWxk
IHJlbWFpbiBlbmFibGVkLCBhbmQgd291bGQgd2FzdGUgcG93ZXIuCj4+PiBJIGFtIHJhdGhlciBp
biBmYXZvciBvZiBkaXNhYmxpbmcgdGhlIFBMTC4KPj4KPj4gSXQgc2hvdWxkIGJlIGRpc2FibGVk
IGlmIGNsa19pZ25vcmVfdW51c2VkIGlzIG5vdCBpbiB0aGUga2VybmVsIHBhcmFtZXRlcnMsCj4+
IGFzIGxvbmcgYXMgTGludXggaXMgYWxzbyBhd2FyZSBvZiB0aGUgY2xvY2suCj4+Cj4+IEdlbmVy
YWxseSwgSSB3b3VsZCBsaWtlIHRvIGF2b2lkIHJlZmNvdW50aW5nIGlmIHBvc3NpYmxlLiBNYW55
IFUtQm9vdAo+PiBkcml2ZXJzIGRvIG5vdCBkaXNhYmxlIHRoZWlyIGNsb2NrcyAoYmVjYXVzZSB0
aGV5IGRvbid0IGRvIGFueSBjbGVhbnVwKSwKPj4gc28geW91IGNhbiBlbmQgdXAgd2l0aCB0aGUg
Y2xvY2sgc3RheWluZyBvbiBhbnl3YXkuCj4+Cj4+IC0tU2Vhbgo+Pgo+Pj4gUmVnYXJkcywKPj4+
IEFtZWxpZQo+Pj4KPj4+Pgo+Pj4+Cj4+Pj4gUGF0cmljawo+Pj4+Cj4+Pj4KPj4+Pj4KPiAKPiBJ
biBnZW5lcmFsLCBJJ20gYWxzbyBpbiBmYXZvciBvZiBub3QgZGlzYWJsaW5nIHRoZSBjbG9jayBp
biBVLUJvb3QuCj4gCj4gQnV0IHRoaXMgUExMIHdpdGggdmRkYTF2MSBhbmQgdmRkYTF2OCBkZXBl
bmRlbmN5IGlzIHJlcXVlc3RlZCBmb3IKPiAKPiAtIFVTQlBIWUMgaGltc2VsZiBvcgo+IAo+IC0g
c291cmNlIGNsb2NrIG9mIFJDQywKPiAKPiAKPiBBbmQgd2UgaGF2ZSBoYXZlIHNlZSBtYW55IGlz
c3VlIGZvciB0aGlzIFBMTCBpbml0aWFsaXphdGlvbiBzZXF1ZW5jZSAvIGRlcGVuZGVuY2llcy4K
PiAKPiAKPiBTbyBmb3IgY2xvY2sgc3VwcG9ydCwgSSBvbmx5IHJldXNlZCB0aGUgZXhpc3Rpbmcv
d29ya2luZyBmdW5jdGlvbiBjYWxsZWQgYnkgdGhlIFBIWSBvcHMgaW5pdCAmIGV4aXQgPQo+IAo+
IHN0bTMyX3VzYnBoeWNfcGh5X2luaXQgJiBzdG0zMl91c2JwaHljX3BoeV9leGl0Cj4gCj4gPT4g
dGhlIFBMTCBhbmQgdGhlIGFzc29jaWF0ZWQgVkREwqAgYXJlIGFscmVhZHkgZGVhY3RpdmF0ZWQg
b24gVVNCUEhZQyBleGl0Lgo+IAo+IAo+IEFuZCB0byBiZSBjb2hlcmVudCBJIGZvciB0aGUgc2Ft
ZSBmb3IgdGhlIGNsb2NrIHRvIGF2b2lkIGNvbmZsaWN0IGJldHdlZW4gdGhlc2UgMiB1c2Vycwo+
IAo+IChVU0JQSFlDIG9yIFJDQykgYXMgaXQgaXMgZG9uZSBhbHNvIGluIExpbnV4IGtlcm5lbC4K
PiAKPiAKPiBBdm9pZCB0byBkZWFjdGl2YXRlIFBMTCBvbiBjbG9jayBkaXNhYmxlIGlzIGEgbWFq
b3Igb2JqZWN0aW9uIG9yIGp1c3QgYSBhZHZpY2U/CgpKdXN0IGFkdmljZS4gSWYgYWxsIG9mIHRo
ZSBjbG9jaydzIHVzZXJzIGNhbGwgZGlzYWJsZSwgdGhlbiBpdCBpcyBmaW5lLgoKLS1TZWFuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0z
MiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9v
dC1zdG0zMgo=
